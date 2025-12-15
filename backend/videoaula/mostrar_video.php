<?php
// Usa a conexão oficial do sistema
include '../conexao.php';

// Verifica se o formulário enviou o arquivo
if (isset($_FILES['video_aula'])) {

    $arquivo = $_FILES['video_aula']['name'];
    $tmp = $_FILES['video_aula']['tmp_name'];

    // Caminho correto dentro da pasta videoaula/uploadvideos/
    $destino = "uploadvideos/" . $arquivo;

    // Move o arquivo enviado
    if (move_uploaded_file($tmp, $destino)) {

        // Atualiza o vídeo (id_video = 1 é só exemplo)
        $stmt = $conn->prepare("UPDATE video_aula SET video_url = ? WHERE id_video = 1");
        $stmt->execute([$destino]);

        echo "Vídeo enviado com sucesso!";
    } else {
        echo "Erro ao enviar o vídeo.";
    }
}
?>