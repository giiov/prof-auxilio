<?php


$envPath = __DIR__ . '/../../.env';

if (!file_exists($envPath)) {
    die('Arquivo .env não encontrado');
}

$lines = file($envPath, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

foreach ($lines as $line) {

    $line = trim($line);

    // Ignora comentários
    if ($line === '' || str_starts_with($line, '#')) {
        continue;
    }

    // Divide apenas na PRIMEIRA =
    [$key, $value] = explode('=', $line, 2);

    $_ENV[trim($key)] = trim($value);
}

// Variáveis usadas no projeto
$apiKeyChat = $_ENV['API_KEY_CHAT'] ?? '';
$apiKeyF    = $_ENV['API_KEY_FEEDBACK'] ?? '';
$apiKeyS    = $_ENV['API_KEY_SIMULADO'] ?? '';
