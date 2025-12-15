<?php
include '../conexao.php';
session_start();

if (!isset($_SESSION['usuario_id'])) {
    header('Location: ../login.php');
    exit();
}

$id = $_GET['id_video'] ?? 0;

$stmt = $conn->prepare("SELECT * FROM video_aula WHERE id_video = ?");
$stmt->execute([$id]);
$video = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$video) {
    die("Vídeo não encontrado!");
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title><?= htmlspecialchars($video['nome_video']) ?></title>
<link rel="stylesheet" href="../../interface/style.css">

<style>
.video-container {
    max-width: 800px;
    margin: 60px auto;
    background: #fff;
    padding: 30px;
    border-radius: 14px;
    box-shadow: 0 0 25px rgba(0,0,0,0.15);
    text-align: center;
}
video {
    width: 100%;
    border-radius: 12px;
}
</style>

</head>
<body>

<div class="video-container">
    <h1><?= htmlspecialchars($video['nome_video']) ?></h1>

    <video controls>
        <source src="<?= $video['video_url'] ?>" type="video/mp4">
    </video>
</div>

</body>
</html>