<?php
//Começa a sessão com a conta do usuário e chama a conexão com o banco
include 'conexao.php';
session_start();

// Verifica se o usuário está logado
if (!isset($_SESSION['usuario_id'])) {
    header('Location: login.php');
    exit();
}

//Verifica qual é o conteúdo - impede dados errados ou não inteiros
$id_conteudo = filter_input(INPUT_GET, 'id_conteudo', FILTER_VALIDATE_INT);

//Variáveis que vão ser preenchidas com os valores buscados no banco
$conteudo_info = null;
$mensagem = "";

if ($id_conteudo) {
    try {
// Busca informações do conteúdo
        $stmt_conteudo = $conn->prepare("SELECT id_materia, titulo, texto FROM conteudos WHERE id_conteudo = :id");
        $stmt_conteudo->bindParam(':id', $id_conteudo, PDO::PARAM_INT);
        $stmt_conteudo->execute();
        $conteudo_info = $stmt_conteudo->fetch(PDO::FETCH_ASSOC);

        if (!$conteudo_info) {
            $mensagem = "Conteúdo não encontrado.";
        }
    } catch (PDOException $e) {
        $mensagem = "Erro ao carregar conteúdo: " . $e->getMessage();
    }
} else {
    $mensagem = "ID de conteúdo inválido.";
}


?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title><?= $conteudo_info ? htmlspecialchars($conteudo_info['titulo']) : "Conteúdo"; ?></title>

    <link rel="stylesheet" href="../interface/style.css">
    <link rel="stylesheet" href="../interface/Conteudos/conteudos.css">
</head>
<body>
    <?php if ($conteudo_info): ?>
        <p>
            <a href="conteudo.php?id_materia=<?= htmlspecialchars($conteudo_info['id_materia']); ?>"> </a>
        </p>
    <?php endif; ?>

    <header class="cabecalho">
    <div class="container">
        <p><a style="color: white" href="javascript: history.go(-1)">Voltar</a></p>
    </div>
    </header>

    <?php if (!empty($mensagem)): ?>
        <?= htmlspecialchars($mensagem); ?>
    <?php endif; ?>

    <?php if ($conteudo_info): ?>
        <!-- Exibi o título do conteúdo -->
         <div class="conteudo-especifico">
            <h1><?= htmlspecialchars($conteudo_info['titulo']); ?></h1>
        <div>
            <!-- Exibi as informações -->
            <p><?= nl2br(htmlspecialchars($conteudo_info['texto'])); ?></p>
        </div>
         </div>
    <?php endif; ?>
</body>
</html>