<?php
include '../../backend/conexao.php';
session_start();

if (!isset($_SESSION['usuario_id'])) {
    header('Location: login.php');
    exit();
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mapas Mentais - Professor Auxílio</title>

    <link rel="stylesheet" href="../style.css">
    <link rel="stylesheet" href="./mapas.css">

    <!-- Bibliotecas -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/leader-line/1.0.7/leader-line.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dom-to-image/2.6.0/dom-to-image.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>

<?php
include '../Menu/menu.php';
?>

<div class="container-principal">
    

    <!-- CONTEÚDO PRINCIPAL -->
    <div class="wrapper-conteudo">
        
        <!-- MENU LATERAL ESQUERDO -->
        <aside class="menu-lateral">
            <h2><i class="fas fa-magic"></i> Ferramentas</h2>
            
            <div class="grupo-ferramentas">
                <h3><i class="fas fa-plus"></i> Criar</h3>
                <button id="botaoNovaBolha" class="botao-menu primario">
                    <i class="fas fa-plus-circle"></i> Nova Ideia
                </button>
            </div>
            
            <div class="grupo-ferramentas">
                <h3><i class="fas fa-save"></i> Arquivo</h3>
                <button id="botaoSalvar" class="botao-menu">
                    <i class="fas fa-save"></i> Salvar Mapa
                </button>
                <button id="botaoCarregar" class="botao-menu">
                    <i class="fas fa-folder-open"></i> Carregar Mapa
                </button>
                <button id="botaoExportar" class="botao-menu">
                    <i class="fas fa-download"></i> Exportar Imagem
                </button>
            </div>
            
            <div class="grupo-ferramentas">
                <h3><i class="fas fa-tools"></i> Ações</h3>
                <button id="botaoLimpar" class="botao-menu perigo">
                    <i class="fas fa-trash"></i> Limpar Tudo
                </button>
                <button id="botaoAjuda" class="botao-menu">
                    <i class="fas fa-question-circle"></i> Ajuda
                </button>
            </div>
            
            <div class="grupo-ferramentas">
                <h3><i class="fas fa-lightbulb"></i> Dica Rápida</h3>
                <p style="font-size: 0.9rem; opacity: 0.9; line-height: 1.4;">
                    <i class="fas fa-mouse-pointer"></i> Clique em uma bolha para selecionar, depois em outra para conectar!
                </p>
            </div>
        </aside>
        
        <!-- ÁREA DO CANVAS -->
        <main class="container-canvas">
            <div id="canvas"></div>
        </main>
    </div>
</div>

<!-- Modal de Ajuda -->
<div class="overlay-modal" id="overlayModal"></div>
<div class="modal-ajuda" id="modalAjuda">
    <h2 style="color: var(--azul-escuro); margin-bottom: 20px;">
        <i class="fas fa-graduation-cap"></i> Como usar o Mapa Mental
    </h2>
    <ul style="list-style: none; padding-left: 0;">
        <li style="margin-bottom: 15px; padding-left: 30px; position: relative;">
            <i class="fas fa-plus-circle" style="position: absolute; left: 0; color: var(--azul-marinho);"></i>
            <strong>Clique em "Nova Ideia"</strong> para criar uma bolha
        </li>
        <li style="margin-bottom: 15px; padding-left: 30px; position: relative;">
            <i class="fas fa-mouse-pointer" style="position: absolute; left: 0; color: var(--azul-marinho);"></i>
            <strong>Clique em uma bolha</strong> para selecionar (fica verde)
        </li>
        <li style="margin-bottom: 15px; padding-left: 30px; position: relative;">
            <i class="fas fa-link" style="position: absolute; left: 0; color: var(--azul-marinho);"></i>
            <strong>Clique em outra bolha</strong> para conectar as duas
        </li>
        <li style="margin-bottom: 15px; padding-left: 30px; position: relative;">
            <i class="fas fa-arrows-alt" style="position: absolute; left: 0; color: var(--azul-marinho);"></i>
            <strong>Arraste as bolhas</strong> para reposicionar
        </li>
        <li style="margin-bottom: 15px; padding-left: 30px; position: relative;">
            <i class="fas fa-edit" style="position: absolute; left: 0; color: var(--azul-marinho);"></i>
            <strong>Clique no texto</strong> para editar o conteúdo
        </li>
        <li style="margin-bottom: 15px; padding-left: 30px; position: relative;">
            <i class="fas fa-keyboard" style="position: absolute; left: 0; color: var(--azul-marinho);"></i>
            <strong>Teclas de atalho:</strong> Ctrl+N (nova), Ctrl+S (salvar), Delete (remover)
        </li>
    </ul>
    <div style="text-align: center; margin-top: 25px;">
        <button class="botao-menu primario fechar-modal" style="display: inline-flex;">
            <i class="fas fa-check"></i> Entendi!
        </button>
    </div>
</div>

<!-- Status Indicator -->
<div class="indicador-status" id="indicadorStatus"></div>

<script src="mapas.js"></script>

</body>
</html>