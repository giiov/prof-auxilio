<?php
include 'conexao.php';
session_start();

// Verifica login
if (!isset($_SESSION['usuario_id'])) {
    header('Location: login.php');
    exit();
}

// Tipo de fluxo: disciplinas ou videoaulas
$tipo = $_GET['tipo'] ?? 'disciplinas';

// ID do usuário
$id_usuario = $_SESSION['usuario_id'];

// Busca o módulo ativo do usuário
$sql_modulo = "
    SELECT M.id_modulo, M.modulo
    FROM acesso_modulos A
    JOIN modulos M ON A.id_modulo = M.id_modulo
    WHERE A.id_usuario = :id_usuario AND A.ativo = TRUE
    LIMIT 1
";

$stmt_modulo = $conn->prepare($sql_modulo);
$stmt_modulo->bindParam(':id_usuario', $id_usuario, PDO::PARAM_INT);
$stmt_modulo->execute();
$modulo = $stmt_modulo->fetch(PDO::FETCH_ASSOC);

if (!$modulo) {
    die("Nenhum módulo ativo encontrado.");
}

$id_modulo = $modulo['id_modulo'];

// Busca as séries do módulo
$sql_series = "
    SELECT id_serie, serie
    FROM series
    WHERE id_modulo = :id_modulo
    ORDER BY id_serie ASC
";

$stmt_series = $conn->prepare($sql_series);
$stmt_series->bindParam(':id_modulo', $id_modulo, PDO::PARAM_INT);
$stmt_series->execute();
$series = $stmt_series->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Séries</title>
    <link rel="stylesheet" href="../interface/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>

<header class="cabecalho">
    <div class="container">
        <h1><?= htmlspecialchars($modulo['modulo']); ?> — Selecione a Série</h1>
        <p><a href="javascript: history.go(-1)" style="color:white;">Voltar</a></p>
    </div>
</header>

<section class="grade-recursos" style="margin: 3rem 3rem;">

    <?php foreach ($series as $s): ?>

        <?php
        // Decide o destino conforme o tipo
        if ($tipo === 'videoaulas') {
            $link = "materias_video.php?id_serie=" . $s['id_serie'];
        } else {
            $link = "disciplinas.php?id_serie=" . $s['id_serie'];
        }
        ?>

        <div class="cartao-recurso">
            <a href="<?= $link ?>">
                <div class="icone-recurso">
                    <i class="fas fa-layer-group"></i>
                </div>
                <h3><?= htmlspecialchars($s['serie']); ?></h3>
                <p>Clique para continuar</p>
            </a>
        </div>

    <?php endforeach; ?>

</section>

</body>
</html>