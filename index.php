<?php
include './backend/conexao.php';
session_start();
?>

<?php
include '../professor-auxilio/interface/Menu/menu.php';
?>

<!DOCTYPE html> 
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Professor Auxílio</title>
    <link rel="stylesheet" href="../professor-auxilio/interface/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

        <section class="hero">
            <div class="container">
                <div class="conteudo-hero-centralizado">
                    <div class="texto-hero-centralizado">
                        <div class="slogan">Mergulhe em um oceano de possibilidades</div>
                        <p>Descubra uma nova forma de aprender com recursos educacionais inovadores, suporte personalizado e uma comunidade de aprendizado colaborativo.</p>
                        
                        <div class="divisor"></div>
                        
                        <div class="botoes-hero">
                            <a href="./backend/login.php" class="botao botao-primario">
                                COMEÇAR AGORA
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    <section class="recursos">

        <div class="container">
            <div class="titulo-secao">
                <h2>Recursos Educacionais</h2>
                <p>Explore nossas ferramentas e recursos para potencializar seu aprendizado</p>
            </div>
            
            <div class="grade-recursos">
                <div class="cartao-recurso">
                    <a href="<?php echo isset($_SESSION['usuario_id']) ? './backend/series.php?id_modulo=1' : './backend/login.php'; ?>">
                        <div class="icone-recurso">
                            <i class="fas fa-book"></i>
                        </div>
                        <h3>Disciplinas</h3>
                        <p>Conteúdo organizado por disciplina, com explicações detalhadas, exercícios e material de apoio.</p>
                    </a>
                </div>

                <div class="cartao-recurso">
                    <a href="<?php echo isset($_SESSION['usuario_id']) ? './backend/videoaula/video_aula.php' : './backend/login.php'; ?>">
                        <div class="icone-recurso">
                            <i class="fas fa-play-circle"></i>
                        </div>
                        <h3>Videoaulas</h3>
                        <p>Aulas em vídeo com professores especialistas, abordando os principais tópicos de cada disciplina.</p>
                    </a>
                </div>

                <div class="cartao-recurso">
                    <a href="<?php echo isset($_SESSION['usuario_id']) ? './interface/mapas-mentais/mapas.php' : './backend/login.php'; ?>">
                        <div class="icone-recurso">
                            <i class="fas fa-project-diagram"></i>
                        </div>
                        <h3>Mapas Mentais</h3>
                        <p>Organize o conhecimento de forma visual com nossos mapas mentais interativos e dinâmicos.</p>
                    </a>
                </div>

                <div class="cartao-recurso">
                    <a style="cursor: pointer;" onclick="alert('É preciso ter conta de nível premium para acessar este recurso!');">
                        <div class="icone-recurso">
                            <i class="fas fa-comments"></i>
                        </div>
                        <h3>Chat com Professores</h3>
                        <p>Tire suas dúvidas em tempo real com nossa equipe de professores especializados.</p>
                    </a>
                </div>

                <div class="cartao-recurso">
                    <a href="<?php echo isset($_SESSION['usuario_id']) ? './interface/chatIA/chatI.php' : './backend/login.php'; ?>">
                        <div class="icone-recurso">
                            <i class="fas fa-robot"></i>
                        </div>
                        <h3>Tutorguita AI</h3>
                        <p>Receba recomendações personalizadas e respostas instantâneas com nossa inteligência artificial.</p>
                    </a>
                </div>

                <div class="cartao-recurso">
                    <a href="<?php echo isset($_SESSION['usuario_id']) ? './interface/Simulados/simulados.php' : './backend/login.php'; ?>">
                        <div class="icone-recurso">
                            <i class="fas fa-graduation-cap"></i>
                        </div>
                        <h3>Simulados</h3>
                        <p>Teste seus conhecimentos com exercícios adaptativos e receba feedback imediato.</p>
                    </a>
                </div>
            </div>
        </div>

    </section>

    <footer class="rodape">
        <div class="container">
            <div class="conteudo-rodape">
                <div class="coluna-rodape">
                    <h3>Professor Auxílio</h3>
                    <p>Uma plataforma educacional inovadora que oferece recursos completos para estudantes de todos os níveis.</p>
                    <div class="links-sociais">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
                
                <div class="coluna-rodape">
                    <h3>Recursos</h3>
                    <ul class="links-rodape">
                        <li><a href="materias.html"><i class="fas fa-chevron-right"></i> Matérias</a></li>
                        <li><a href="videoaulas.html"><i class="fas fa-chevron-right"></i> Videoaulas</a></li>
                        <li><a href="mapas-mentais.html"><i class="fas fa-chevron-right"></i> Mapas Mentais</a></li>
                        <li><a href="exercicios.html"><i class="fas fa-chevron-right"></i> Exercícios</a></li>
                    </ul>
                </div>
                
                <div class="coluna-rodape">
                    <h3>Suporte</h3>
                    <ul class="links-rodape">
                        <li><a href="chat-professores.html"><i class="fas fa-chevron-right"></i> Chat com Professores</a></li>
                        <li><a href="ia-educacional.html"><i class="fas fa-chevron-right"></i> IA Educacional</a></li>
                        <li><a href="forum.html"><i class="fas fa-chevron-right"></i> Fórum de Dúvidas</a></li>
                        <li><a href="ajuda.html"><i class="fas fa-chevron-right"></i> Central de Ajuda</a></li>
                    </ul>
                </div>
                
                <div class="coluna-rodape">
                    <h3>Contato</h3>
                    <ul class="links-rodape">
                        <li><a href="mailto:contato@professorauxilio.com"><i class="fas fa-envelope"></i> contato@professorauxilio.com</a></li>
                        <li><a href="tel:+551199999999"><i class="fas fa-phone"></i> (11) 9999-9999</a></li>
                        <li><a href="#"><i class="fas fa-map-marker-alt"></i> São Paulo, SP</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="base-rodape">
                <p>&copy; 2024 Professor Auxílio. Todos os direitos reservados.</p>
            </div>
        </div>
    </footer>

</body>
</html>