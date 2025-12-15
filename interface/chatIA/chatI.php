<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TutorGuita - Professor Auxílio</title>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <link rel="stylesheet" href="./chat.css">
    <link rel="stylesheet" href="../style.css">
    
    <style>
        /* Garantir Poppins para todos os elementos */
        * {
            font-family: 'Poppins', sans-serif;
        }
    </style>
</head>
<body>

<?php
include '../Menu/menu.php';
?>

<main class="area-mensagens">
    <div class="container-mensagens" id="messages">
    </div>
</main>

<footer class="rodape-chat">
    <input type="text" 
           id="userInput" 
           class="campo-entrada" 
           placeholder="Digite sua dúvida!">
    
    <button id="sendBtn" class="botao-enviar">
        <i class="fas fa-paper-plane"></i>
        Enviar
    </button>
</footer>

<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<script src="chat.js"></script>

</body>
</html>