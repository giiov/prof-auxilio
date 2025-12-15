<?php
require_once __DIR__ . '/../config/env.php';

header("Content-Type: application/json; charset=UTF-8");

ini_set('display_errors', 0);
error_reporting(0);


$API_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$apiKeyF";

//recebe dados de desempenho do javascript
$input = json_decode(file_get_contents("php://input"), true);

if (!isset($input["acertos"]) || !isset($input["total"])|| !isset($input["materia"]) || !isset($input["serie"])) {
    http_response_code(400); 
    echo json_encode(["error" => "Parâmetros de feedback inválidos."]);
    exit;
}

$acertos = $input["acertos"];
$total = $input["total"];
$materia = $input["materia"];
$serie = $input["serie"];

//prompt de feedback
$prompt = "
Você é um professor didático chamado TutorGuita, pode apresentar sua sugestão com esse nome. 
O aluno fez um simulado de $materia ($serie) e acertou $acertos de $total questões.
Gere uma análise concisa do desempenho com base nas seguintes regras:
- Ruim: abaixo de 6 acertos.
- Regular: entre 6 a 8 acertos.
- Bom: de 9 a 12 acertos.
E sugira o PRÓXIMO PASSO didático (revisão de um tópico ou avanço de conteúdo). Pode especificar qual será o próximo conteúdo, ou se deve focar em aprender mais do mesmo.
Sua resposta deve ser APENAS o texto do feedback, sem formatação Markdown ou títulos, e com no máximo 80 palavras.
";

//corpo de requisição da API
$body = [
    "contents" => [
        [
            "parts" => [
                ["text" => $prompt]
            ]
        ]
    ]
];

$ch = curl_init($API_URL);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($body));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, ["Content-Type: application/json"]);

$response = curl_exec($ch);
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

//processamento da resposta da IA
if ($httpCode !== 200) {
    http_response_code($httpCode);
    $errorDetails = json_decode($response, true);
    $errorMessage = $errorDetails['error']['message'] ?? "Erro HTTP $httpCode na API de Feedback.";
    echo json_encode(["error" => $errorMessage]);
    exit;
}

$data = json_decode($response, true);
//o feedback é o texto gerado pela IA
$feedback = $data["candidates"][0]["content"]["parts"][0]["text"] ?? null;

if (!$feedback) {
    echo json_encode(["error" => "Erro: conteúdo de feedback vazio retornado pela IA"]);
    exit;
}

echo json_encode ([
    "success" => true,
    "feedback" => trim($feedback) //retorna o texto de feedback
]);

?>