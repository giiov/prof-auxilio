<?php
// Inicia sessão e conexão
include 'conexao.php';
session_start();

// Verifica login
if (!isset($_SESSION['usuario_id'])) {
    header('Location: login.php');
    exit();
}

// Verifica se a série foi enviada
if (!isset($_GET['id_serie'])) {
    die("Série não selecionada.");
}

$id_serie = intval($_GET['id_serie']);

// Variáveis
$disciplinas = [];
$nome_serie = "";
$nome_modulo = "";
$mensagem = "";

try {

    // Busca nome da série e módulo
    $sql_info = "
        SELECT S.serie, M.modulo
        FROM series S
        JOIN modulos M ON S.id_modulo = M.id_modulo
        WHERE S.id_serie = :id_serie
        LIMIT 1
    ";

    $stmt_info = $conn->prepare($sql_info);
    $stmt_info->bindParam(':id_serie', $id_serie, PDO::PARAM_INT);
    $stmt_info->execute();
    $dados = $stmt_info->fetch(PDO::FETCH_ASSOC);

    if ($dados) {
        $nome_serie = $dados['serie'];
        $nome_modulo = $dados['modulo'];
    } else {
        $mensagem = "Série não encontrada.";
    }

    // Busca disciplinas da série
    $sql_disciplinas = "
        SELECT id_materia, materia
        FROM materias
        WHERE id_serie = :id_serie
        ORDER BY materia ASC
    ";

    $stmt_disciplinas = $conn->prepare($sql_disciplinas);
    $stmt_disciplinas->bindParam(':id_serie', $id_serie, PDO::PARAM_INT);
    $stmt_disciplinas->execute();
    $disciplinas = $stmt_disciplinas->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    $mensagem = "Erro ao carregar dados: " . $e->getMessage();
}

?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Disciplinas</title>

    <link rel="stylesheet" href="../interface/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>

<header class="cabecalho">
    <div class="container">
        <h1><?= htmlspecialchars($nome_modulo); ?> — <?= htmlspecialchars($nome_serie); ?></h1>
        <p><a href="javascript: history.go(-1)" style="color:white;">Voltar</a></p>
    </div>
</header>

<div class="container" style="margin-top: 40px;">

    <?php if (!empty($mensagem)): ?>
        <p style="color:red;"><?= htmlspecialchars($mensagem); ?></p>
    <?php endif; ?>

    <h2 style="text-align:center;">Disciplinas Disponíveis</h2>

    <section class="grade-recursos">

        <?php if (!empty($disciplinas)): ?>
            <?php foreach ($disciplinas as $disciplina): ?>
                <div class="cartao-recurso">
                    <a href="conteudo.php?id_materia=<?= $disciplina['id_materia']; ?>">
                        <div class="icone-recurso">
                            <i class="fas fa-book"></i>
                        </div>
                        <h3><?= htmlspecialchars($disciplina['materia']); ?></h3>
                        <p>Clique para acessar os conteúdos.</p>
                    </a>
                </div>
            <?php endforeach; ?>

        <?php else: ?>
            <p style="text-align:center;">Nenhuma disciplina cadastrada para esta série.</p>
        <?php endif; ?>

    </section>

</div>

</body>
</html>