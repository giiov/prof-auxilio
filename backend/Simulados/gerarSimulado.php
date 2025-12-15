<?php
require_once __DIR__ . '/../config/env.php';

header("Content-Type: application/json; charset=UTF-8");

ini_set('display_errors', 0);
error_reporting(0);


if (empty($apiKeyS)) {
    http_response_code(500);
    echo json_encode(["error" => "Erro: API Key não configurada no servidor."]);
    exit;
}

$API_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$apiKeyS";


// Verifica se veio JSON
$input = json_decode(file_get_contents("php://input"), true);

if (!$input || !isset($input["materia"]) || !isset($input["serie"])) {
    http_response_code(400); 
    echo json_encode(["error" => "Parâmetros inválidos. Certifique-se de enviar 'materia' e 'serie'."]);
    exit;
}

$materia = $input["materia"];
$serie = $input["serie"];

// Prompt
$prompt = "
Você é um gerador de simulados didático e preciso.
Gere um simulado com **12 questões** sobre a matéria **{$materia}**
para a série **{$serie}**, seguindo a grade curricular oficial/BNCC.

Regras de Formato:
-A saída deve ser um objeto JSON **válido e completo**.
- O objeto JSON deve ter uma chave principal \"simulado\", que é um array de objetos \"questoes\".
- CADA objeto \"questao\" deve conter:
    1. \"id\": Número da questão (1 a 12).
    2. \"pergunta\": O texto completo da questão.
    3. \"alternativas\": Um array de strings com as 4 opções (A, B, C, D).
    4. \"resposta_correta\": A letra (A,B, C ou D) da alternativa correta.
- NÃO inclua qualquer texto ou aplicação fora do JSON.
Exemplo de estrutura (para referência, a IA deve gerar o JSON inteiro):
{
\"simulado\": [
    {
      \"id\": 1,
      \"pergunta\": \"Qual é o valor da expressão...\",
      \"alternativas\": [\"opção A\", \"opção B\", \"opção C\", \"opção D\"],
      \"resposta_correta\": \"C\"
    },
     // ... mais 11 questões
    ]
}

Regras das Questões:
- Questões CONDIZENTES com o nível escolar.
";

//corpo da requisição
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
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE); // Captura o código de status HTTP
curl_close($ch);

//erro de api
if ($httpCode !== 200) {
    http_response_code($httpCode);
    $errorDetails = json_decode($response, true);
    // Tenta retornar o erro da API se houver
    $errorMessage = $errorDetails['error']['message'] ?? "Erro HTTP $httpCode: Falha ao processar a requisição na API.";
    echo json_encode(["error" => $errorMessage]);
    exit;
}

//decodificar resposta
$data = json_decode($response, true);

//formato do texto
$simulado = $data["candidates"][0]["content"]["parts"][0]["text"] ?? null;

if (!$simulado) {
    echo json_encode(["error" => "Erro: conteúdo vazio retornado pela IA"]);
    exit;
}

echo json_encode ([
    "success" => true,
    "simulado" => $simulado
]);


// Envia resposta ao JS
//file_put_contents("log_api.txt", $response);

// O retorno da OpenAI é um JSON com o simulado dentro. Você precisa extraí-lo:
//$responseData = json_decode($response, true);
//$simuladoContent = $responseData['choices'][0]['message']['content'] ?? null;

//if ($simuladoContent) {
    // Retorna APENAS o conteúdo de texto (o simulado em Markdown)
   // echo json_encode(["success" => true, "simulado" => $simuladoContent]);
//} else {
  //  http_response_code(500);
  //  echo json_encode(["error" => "Resposta da API válida, mas o conteúdo do simulado não foi encontrado."]);
//}
