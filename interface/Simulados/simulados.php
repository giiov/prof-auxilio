<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simulados - Professor Auxílio</title>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <link rel="stylesheet" href="./simulados.css">
    <link rel="stylesheet" href="../style.css">
    
    <!-- Bibliotecas para PDF -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

</head>
<body>

 <?php
    include '../Menu/menu.php';
?>

<div class="container-simulado">

    <section class="formulario-config">
        <div class="grupo-formulario">
            <label for="materia">
                <i class="fas fa-book"></i> Matéria:
            </label>
            <input type="text" 
                   id="materia" 
                   class="campo-entrada" 
                   placeholder="Ex: Português, Matemática, História...">
        </div>

        <div class="grupo-formulario">
            <label for="serie">
                <i class="fas fa-user-graduate"></i> Série/Ano:
            </label>
            <input type="text" 
                   id="serie" 
                   class="campo-entrada" 
                   placeholder="Ex: 6º ano, 9º ano, 1º EM...">
        </div>

        <button id="gerar-simulado" class="botao-principal">
            <i class="fas fa-magic"></i> Gerar Simulado Personalizado
        </button>
    </section>

    <!-- Loader -->
    <div id="loader-simulado" class="loader">
        <div class="animacao-carregamento"></div>
        <p class="texto-carregamento">Gerando seu simulado personalizado...</p>
    </div>

    <!-- Área de resultados -->
    <div class="area-resultados" id="resultado-simulado">
    </div>

    <!-- Botão PDF -->
    <button id="pdf-simulado" class="botao-pdf" style="display:none;">
        <i class="fas fa-file-pdf"></i> Baixar PDF do Simulado
    </button>
</div>

<!-- Scripts -->
<script src="simulados.js"></script>

</body>
</html>