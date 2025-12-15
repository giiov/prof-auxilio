<?php
//Começa a sessão com a conta do usuário e chama a conexão com o banco

include 'conexao.php';
session_start();

//Variáveis para serem preenchidas
$mensagem = '';
$modulos_db = [];

//Busca todos os módulos cadastrados - realiza a busca por meio do ID
try {
    $stmt_modulos = $conn->prepare("SELECT id_modulo, modulo FROM modulos ORDER BY id_modulo ASC");
    $stmt_modulos->execute();

//Retorna todos como array
    $modulos_db = $stmt_modulos->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    $mensagem = 'Erro ao carregar os módulos: ' . $e->getMessage();
}

//Só realiza o restante das coisas, se houver a confirmação do envio de formulário via POST
if ($_SERVER['REQUEST_METHOD'] === 'POST' && empty($mensagem)) {

//Remove caracteres inválidos - Verifica se o módulo escolhido é inteiro
    $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
    $senha = $_POST['senha'];
    $usuario = htmlspecialchars($_POST['usuario']);
    $id_modulo_selecionado = filter_input(INPUT_POST, 'id_modulo', FILTER_VALIDATE_INT);

//Verifica se o formato do email é válido, se a senha têm o mínimo de caracteres e se o módulo escolhido é válido
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $mensagem = 'E-mail inválido.';
    } elseif (strlen($senha) < 3) {
        $mensagem = 'A senha deve ter pelo menos 3 caracteres.';
    } elseif ($id_modulo_selecionado === false || $id_modulo_selecionado === null) {
        $mensagem = 'Módulo selecionado inválido.';
    } else {
         echo "oi";
        try {
            $conn->beginTransaction();

//Evita que sejam colocados email duplicados
            $stmt = $conn->prepare("SELECT id_usuario FROM usuarios WHERE email = :email");
            $stmt->bindParam(':email', $email);
            $stmt->execute();

            if ($stmt->rowCount() > 0) {
                $mensagem = 'Este e-mail já está cadastrado.';
                $conn->rollBack();
//Armazena a senha e email de forma segura
            } else {
                $senha_hash = password_hash($senha, PASSWORD_DEFAULT);

                $sql_user = "INSERT INTO usuarios (usuario, email, senha_hash) 
                             VALUES (:usuario, :email, :senha_hash)";
                $stmt_user = $conn->prepare($sql_user);
                $stmt_user->bindParam(':usuario', $usuario);
                $stmt_user->bindParam(':email', $email);
                $stmt_user->bindParam(':senha_hash', $senha_hash);
                $stmt_user->execute();
//Pega o ID do usuário para ligar ao módulo escolhido
                $novo_usuario_id = $conn->lastInsertId();

//Adiciona o registro na tabelo de acesso, indicando que aquele usuário têm acesso a aquele módulo
                $sql_acesso = "INSERT INTO acesso_modulos (id_usuario, id_modulo, ativo) 
                               VALUES (:id_usuario, :id_modulo, TRUE)";
                $stmt_acesso = $conn->prepare($sql_acesso);
                $stmt_acesso->bindParam(':id_usuario', $novo_usuario_id);
                $stmt_acesso->bindParam(':id_modulo', $id_modulo_selecionado);
                $stmt_acesso->execute();

                $conn->commit();

//Após cadastro ser efetuado, redireciona para a tela de login
                header('Location: login.php');
                exit();
            }
        } catch (PDOException $e) {
            if ($conn->inTransaction()) {
                $conn->rollBack();
            }
            $mensagem = 'Erro ao cadastrar: ' . $e->getMessage();
        }
    }
    echo "oi";
}
?>


<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro - Professor Auxílio</title>

    <link rel="stylesheet" href="../interface/cadastrar.css">
    <link rel="stylesheet" href="../interface/style.css">

    <!-- ADIÇÃO: Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container-cadastro">
        <div class="logo-cabecalho">
            <a href="../index.php">
                <img src="../interface/tartaruga.png" alt="Logo Professor Auxílio" onerror="this.style.display='none'">
                <div class="titulo-logo">
                    <div class="linha-superior-logo">Prof.</div>
                    <div class="linha-inferior-logo">Auxilio</div>
                </div>
            </a>
        </div>

        <div class="cartao-cadastro">
            <h1 class="titulo-cadastro">Criar Conta</h1>
            <p class="subtitulo-cadastro">Junte-se à nossa comunidade educacional</p>

            <?php if (!empty($mensagem)): ?>
                <div class="mensagem-alerta">
                    <i class="fas fa-exclamation-circle"></i> <?= $mensagem; ?>
                </div>
            <?php endif; ?>

            <form method="POST" class="formulario-cadastro">
                <h3 class="titulo-secao">Dados de Acesso</h3>
                
                <div class="grupo-formulario">
                    <input type="text" name="usuario" placeholder="Nome de Usuário" class="campo-formulario" required>
                </div>

                <div class="grupo-formulario">
                    <input type="email" name="email" placeholder="E-mail" class="campo-formulario" required>
                </div>

                <div class="grupo-formulario">
                    <input type="password" name="senha" placeholder="Senha (mínimo 3 caracteres)" class="campo-formulario" required>
                </div>

                <h3 class="titulo-secao">Selecione o Módulo</h3>
                
                <div class="grupo-formulario">
                    <select name="id_modulo" class="campo-formulario" required>
                        <option value="">Escolha um Módulo</option>
                        <?php foreach ($modulos_db as $modulo): ?>
                            <option value="<?= htmlspecialchars($modulo['id_modulo']); ?>">
                                <?= htmlspecialchars($modulo['modulo']); ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <button type="submit" class="botao-cadastrar">
                    <i class="fas fa-user-plus"></i> Cadastrar e Continuar
                </button>
            </form>

            <div class="link-login">
                <p>Já tem conta? <a href="login.php">Fazer Login</a></p>
            </div>
        </div>
    </div>
</body>
</html>