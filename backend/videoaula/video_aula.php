<?php
// CONEXÃO
include '../conexao.php';

// BUSCA OS VÍDEOS
try {
    $sql = $conn->query("SELECT id_video, nome_video FROM video_aula");
    $videos = $sql->fetchAll(PDO::FETCH_ASSOC);
} catch (Exception $e) {
    die("Erro ao buscar vídeos: " . $e->getMessage());
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Vídeos</title>

<style>
    body {
        background: linear-gradient(135deg, #2ba0b7 0%, #086a88 100%);
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
    }

    .container {
        max-width: 750px;
        margin: 60px auto;
        background: #fff;
        padding: 35px;
        border-radius: 12px;
        box-shadow: 0 0 25px rgba(0,0,0,0.12);
    }

    h1 {
        text-align: center;
        margin: 0 0 25px 0;
        color: #086a88;
        font-size: 28px;
    }

    .materia-list {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .materia-list li {
        margin-bottom: 15px;
    }

    .materia-list a {
        display: block;
        background: #218ea1;
        color: #fff;
        padding: 14px;
        border-radius: 10px;
        text-decoration: none;
        font-size: 18px;
        transition: 0.2s;
        box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
    }

    .materia-list a:hover {
        background: #1b7686ff;
        transform: translateY(-3px);
    }

    .no-data {
        text-align: center;
        background: #ffe0e0;
        padding: 12px;
        color: #b30000;
        border-radius: 8px;
        font-weight: bold;
        margin-top: 20px;
    }
</style>

</head>
<body>

<div class="container">

    <h1>Escolha o Vídeo</h1>

    <ul class="materia-list">

        <?php if (!empty($videos)): ?>
            <?php foreach ($videos as $v): ?>
                <li>
                    <a href="materias_aula.php?id_video=<?= $v['id_video'] ?>">
                        <?= htmlspecialchars($v['nome_video']) ?>
                    </a>
                </li>
            <?php endforeach; ?>
        <?php else: ?>
            <div class="no-data">Nenhum vídeo encontrado no banco!</div>
        <?php endif; ?>

    </ul>

</div>

</body>
</html>