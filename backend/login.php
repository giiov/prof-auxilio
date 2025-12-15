<?php
//Começa a sessão com a conta do usuário e chama a conexão com o banco
session_start();
include 'conexao.php';

//Variável vazia para mensagens
$mensagem = '';

//O formulário com metódo POST só funciona, se ele detectar o envio
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'];
    $senha = $_POST['senha'];

//Prepara a consulta no banco e compara os emails, para só assim executar
    $stmt = $conn->prepare("SELECT id_usuario, usuario, senha_hash FROM usuarios WHERE email = :email");
    $stmt->bindParam(':email', $email);
    $stmt->execute();

//Verifica se existe um usuário - por isso usei o diferente de zero
    if ($stmt->rowCount() > 0) {
        $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

//Verifica se senha está correta. Se sim, redireciona para a tela inicial
        if (password_verify($senha, $usuario['senha_hash'])) {
            $_SESSION['usuario_id'] = $usuario['id_usuario'];
            $_SESSION['usuario'] = $usuario['usuario'];
            header('Location: ../index.php');
            exit();
        } else {
            $mensagem = "Senha incorreta.";
        }
    } else {
        $mensagem = "Usuário não encontrado.";
    }
}


?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="../interface/login.css">
    <link rel="stylesheet" href="../interface/style.css">
    
</head>
<body class="login-page">
    
    <div class="container-login">

        <div class="logo-login">
            <a href="../index.php">
                <div class="titulo-logo">
                    <div class="linha-superior-logo">Prof.</div>
                    <div class="linha-inferior-logo">Auxílio</div>
                </div>
            </a>
        </div>

        <div class="cartao-login">
            <h1 class="titulo-login">Login</h1>
            <p class="subtitulo-login">Acesse sua conta para continuar</p>

            <?php if (!empty($mensagem)): ?>
                <div class="mensagem-erro">
                    <?= htmlspecialchars($mensagem); ?>
                </div>
            <?php endif; ?>

            <form method="POST" class="formulario-login">
                <div class="grupo-formulario">
                    <input type="email" name="email" placeholder="E-mail" class="campo-formulario" required>
                </div>
                
                <div class="grupo-formulario">
                    <input type="password" name="senha" placeholder="Senha" class="campo-formulario" required>
                </div>
                
                <button type="submit" class="botao-login">
                    <i class="fas fa-sign-in-alt"></i> Entrar
                </button>
            </form>
            
            <div class="link-cadastro">
                Não tem conta? <a href="cadastrar.php">Cadastre-se</a>
            </div>
        </div>
    </div>

</body>
</html>