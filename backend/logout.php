<?php
//Desloga a conta do usuário e direciona para a tela inicial
session_start();
session_destroy();
header('Location: ../index.php');
exit;