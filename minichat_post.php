<?php
  // N'hésitez pas à éditer le fichier de configuration pour adapter
  // le mini-chat à votre environnement :
  include 'config.php';
  session_start();

  // ---------------------------------------------------------------------------
  // On se connecte à la base de données via PDO
  $mysqli=mysqli_connect('localhost','root','','assopeche');//'serveur','nom d'utilisateur','pass','nom de la table'
    if(!$mysqli) {
    	echo "Erreur connexion BDD";
    	//Dans ce script, je pars du principe que les erreurs ne sont pas affichées sur le site, vous pouvez donc voir qu'elle erreur est survenue avec mysqli_error(), pour cela décommentez la ligne suivante:
    	//echo "<br>Erreur retournée: ".mysqli_error($mysqli);
    	exit(0);
    } else {
        $sql = "INSERT INTO messages (author, content, created_at) VALUES ('".$_POST["pseudo"]."', '".$_POST["message"]."', '2020-03-05 14:51:27')";
        //on récupère les infos du membre si on souhaite les afficher dans la page:
        $req=mysqli_query($mysqli, $sql);
    }   
       
    mysqli_free_result($req);

  // Et on redirige vers la première page
  header('Location: index.php');
?>
