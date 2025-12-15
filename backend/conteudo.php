<?php
//Começa a sessão com a conta do usuário e chama a conexão com o banco
include 'conexao.php';
session_start();

//Verifica qual a matéria selecionado pelo o usuário - impede dados errados ou não inteiros
$id_materia = filter_input(INPUT_GET, 'id_materia', FILTER_VALIDATE_INT);

//Variáveis que vão ser preenchidas com os valores buscados no banco
$conteudos = [];
$nome_materia = "";
$mensagem = "";

if ($id_materia) {
    try {

//Busca nome da matéria
        $stmt_materia = $conn->prepare("SELECT materia FROM materias WHERE id_materia = :id");
        $stmt_materia->bindParam(':id', $id_materia, PDO::PARAM_INT);
        $stmt_materia->execute();
        $materia = $stmt_materia->fetch(PDO::FETCH_ASSOC);

        if ($materia) {
            $nome_materia = $materia['materia'];
        } else {
            $mensagem = "Matéria não encontrada.";
        }

//Busca apenas os conteúdos da matéria selecionada
        $stmt_conteudos = $conn->prepare("
            SELECT id_conteudo, titulo 
            FROM conteudos 
            WHERE id_materia = :id 
            ORDER BY ordem ASC
        ");
        $stmt_conteudos->bindParam(':id', $id_materia, PDO::PARAM_INT);
        $stmt_conteudos->execute();
        $conteudos = $stmt_conteudos->fetchAll(PDO::FETCH_ASSOC);

    } catch (PDOException $e) {
        $mensagem = "Erro ao carregar conteúdos: " . $e->getMessage();
    }
} else {
    $mensagem = "ID de matéria inválido.";
}


?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Conteúdos</title>
    <link rel="stylesheet" href="../interface/style.css">
    <link rel="stylesheet" href="../interface/Conteudos/conteudos.css">
</head>
<body>

    <!-- Exibi o nome da matéria -->
    <header class="cabecalho">
    <div class="container">
        <h1>Conteúdos da disciplina: <?= htmlspecialchars($nome_materia); ?></h1>
        <p><a style="color: white" href="javascript: history.go(-1)">Voltar</a></p>
    </div>
</header>

    <?php if (!empty($mensagem)): ?>
        <?= htmlspecialchars($mensagem); ?>
    <?php endif; ?>

    <?php if (!empty($conteudos)): ?>
        <ul class='lista-conteudos'>
            <?php foreach ($conteudos as $conteudo): ?>
                <li class='lista-linha-conteudos'>
                    <!-- Exibi os Títulos dos conteúdos-->
                    <a class="link-lista-conteudos" href="conteudo_especifico.php?id_conteudo=<?= htmlspecialchars($conteudo['id_conteudo']); ?>">
                        <?= htmlspecialchars($conteudo['titulo']); ?>
                    </a>
                </li>
            <?php endforeach; ?>
        </ul>
    <?php else: ?>
        <p>Nenhum conteúdo encontrado para esta disciplina.</p>
    <?php endif; ?>
</body>
</html>