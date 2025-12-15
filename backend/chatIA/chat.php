<?php
require_once __DIR__ . '/../config/env.php';



$input = json_decode(file_get_contents("php://input"), true);

$pergunta = $input["pergunta"] ?? "";
$histórico = $input["histórico"] ?? [];

$contents = [];

$contents[] = [
    "role" => "model",
    "parts" => [
        ["text" =>
"Você é um assistente chamado Tutorguita focado em estudos.

- Se apresente quando começar um assunto novo.
- Nunca dê respostas diretas, exceto para resumos ou cronogramas.
- Sempre explique passo a passo.
- Incentive o aluno a pensar.
- Use linguagem simples.
- Dê exemplos básicos.
- Nunca resolva uma prova inteira sem o aluno tentar.
- Sempre recomende usar o gerador de simulados do site.
- Não responda nada fora de estudos. Apenas diga que não foi criado para isso."]
    ]
];

foreach ($histórico as $msg) {
    $contents[] = [
        "role" => $msg["role"] === "user" ? "user" : "model",
        "parts" => [
            ["text" => $msg["text"]]
        ]
    ];
}

$contents[] = [
    "role" => "user",
    "parts" => [
        ["text" => $pergunta]
    ]
];



$url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$apiKeyChat";

$body = [
    "contents" => $contents
];

$jsonBody = json_encode($body);

$ch = curl_init($url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, [
    "Content-Type: application/json" 
]);

curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonBody);
$response = curl_exec($ch);
curl_close($ch);

$data = json_decode($response, true);

if (isset($data["error"])) {
    echo json_encode([
        "resposta" => "Erro do Gemini: " . $data["error"]["message"]
    ]);
    exit;
}

$resposta = $data["candidates"][0]["content"]["parts"][0]["text"] ?? "Erro ao gerar resposta.";

echo json_encode([
    "resposta" => $resposta
]);
?>