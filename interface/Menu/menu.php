<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Professor Auxílio</title>
    <link rel="stylesheet" href="../style.css">
</head>
<body>
    <header class="cabecalho">
            <div class="container">
                <div class="conteudo-cabecalho">
                    <div class="logo">
                        <img src="../professor-auxilio/interface/tartaruga.png" alt="Logo Professor Auxílio" class="logo-imagem" onerror="this.style.display='none'">
                        <div class="nome-logo">
                            <div class="linha-superior">Prof.</div>
                            <div class="linha-inferior">Auxilio</div>
                        </div>
                    </div>
                    <div class="botoes-usuario">
                        
                    <?php if (!isset($_SESSION['usuario_id'])): ?>
                        <a href="./backend/cadastrar.php" class="botao-login-cadastrar">Cadastre-se</a>
                        <a href="./backend/login.php" class="botao-login-cadastrar">Entrar</a>
                        <?php else: ?>
                            <div
                            class="usuario-logado"
                            style = ""
                            >
                                <span
                                class="nome-usuario"
                                onclick="toggleMenuUsuario()"
                                style ="
                                background: #257e99ff;
                                padding: 0.25rem 0.75rem;
                                border-radius: 15px;
                                "
                                >
                                    <?php echo htmlspecialchars($_SESSION['usuario']); ?><i class="fas fa-chevron-down"></i>
                                </span>
                                <div id="menu-usuario" class="menu-usuario">
                                    <a style="color: white" href="./backend/logout.php">Sair</a>
                                </div>
                            </div>
                            <?php endif; ?>
                        </div>
                    </div>
            </div>
            <script>
            function toggleMenuUsuario() {
                const menu = document.getElementById('menu-usuario');
                menu.style.display = menu.style.display === 'block' ? 'none' : 'block';
                }
            </script>
            
        </header>
</body>
</html>