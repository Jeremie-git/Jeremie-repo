<?php
  $valeurs=[];
  /*************************
	*  Page: connexion.php
	*  Page encodée en UTF-8
	**************************/

  session_start();//session_start() combiné à $_SESSION (voir en fin de traitement du formulaire) nous permettra de garder le pseudo en sauvegarde pendant qu'il est connecté, si vous voulez que sur une page, le pseudo soit (ou tout autre variable sauvegardée avec $_SESSION) soit retransmis, mettez session_start() au début de votre fichier PHP, comme ici

    //on se connecte une fois pour toutes les actions possible de cette page:
    $mysqli=mysqli_connect('localhost','root','','assopeche');//'serveur','nom d'utilisateur','pass','nom de la table'
    if(!$mysqli) {
    	echo "Erreur connexion BDD";
    	//Dans ce script, je pars du principe que les erreurs ne sont pas affichées sur le site, vous pouvez donc voir qu'elle erreur est survenue avec mysqli_error(), pour cela décommentez la ligne suivante:
    	//echo "<br>Erreur retournée: ".mysqli_error($mysqli);
    	exit(0);
    } else {
        //on récupère les infos du membre si on souhaite les afficher dans la page:
        $req=mysqli_query($mysqli,"SELECT id, author, content, created_at FROM messages");
        while ($row = mysqli_fetch_assoc($req)) {
          //printf ("id : %s  Author : %s Content : %s Created_at : %s", $row[id], $row["author"], $row["content"], $row["created_at"]);
          array_push($valeurs,$row); 
       }
       
        
       

    }
    //var_dump($valeurs);
    //var_dump($author); //author;//," content: ",$content," date: ",$date;

    mysqli_free_result($req);
?>


<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="description" content="Peche 2.0 est un site axé sur la peche responsable et l'organisation d'évènements en accord avec nos principes">
    <title>Bienvenue sur Pêche 2.0 (titre provisoire)</title>
    <link rel="stylesheet" href="./cssPeche/style_acceuil_commerce.css">
    <link rel="stylesheet" href="./cssPeche/styleAssoPeche.css">
    
    <link rel="stylesheet" href="test.css">

    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

    <script src="./test.js"></script>


    <meta name='viewport' content="initial-scale=1, width=device-width"/>
    <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-159441246-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-159441246-1');
</script>

  </head>

  <body onload="cacher()">

    <div class="header">
      <img src="banniere.jpg" alt="banniere" width="100%">
      <div class="inscri_connec">
        <img src="register.svg" alt="register">
        <a href="inscription.php">S'inscrire</a>
        <img src="login.svg" alt="login">
        <a href="connexion.php">Se connecter</a>
      </div>
      <input type="search" name="chercher" id="recherche" placeholder="Rechercher sur Pêche 2.0">
      
        <div class="row chat-window col-xs-5 col-md-3" id="chat_window_1" style="margin-left:10px;">
            <div class="col-xs-12 col-md-12">
              <div class="panel panel-default">
                    <div class="panel-heading top-bar">
                        <div class="col-md-8 col-xs-8">
                            <h3 class="panel-title"><span class="glyphicon glyphicon-comment"></span> TChat Pêche</h3>
                        </div>
                        <div class="col-md-4 col-xs-4" style="text-align: right;">
                            <a href="#"><span id="minim_chat_window" class="glyphicon glyphicon-minus icon_minim"></span></a>
                            <a href="#"><span class="glyphicon glyphicon-remove icon_close" data-id="chat_window_1"></span></a>
                        </div>
                    </div>
                    <div class="panel-body msg_container_base">

                        <?php
                          for ($i=0; $i < sizeof($valeurs); $i++){
                            echo "
                              <div class=\"row msg_container base_receive\">
                                <div class=\"col-md-2 col-xs-2 avatar\">
                                  <img src=\"http://www.bitrebels.com/wp-content/uploads/2011/02/Original-Facebook-Geek-Profile-Avatar-1.jpg\" class=\" img-responsive \">
                                </div>
                                <div class=\"col-md-10 col-xs-10\">
                                  <div class=\"messages msg_receive\">
                                    <p>";
                                    echo $valeurs[$i]['content']."</p>
                                    <time>";
                                    echo $valeurs[$i]['author']." • ".$valeurs[$i]['created_at']."</time>
                                  </div>
                                </div>
                              </div>";
                          }
                        ?>

                    </div>
                    <div class="panel-footer">
                        <div class="input-group">
                          <form action="minichat_post.php" method="post">
                            <input name="pseudo" id="btn-input" type="text" class="form-control input-sm chat_nom" placeholder="votre pseudo ici..." />
                            <input name="message" id="btn-input" type="text" class="form-control input-sm chat_input" placeholder="Ecrivez votre message ici..." />
                            <span class="input-group-btn">
                            <button type="submit" class="btn btn-primary btn-sm" id="btn-chat">Envoyer</button>
                            </span>
                          </form>
                        </div>
                    </div>
            </div>
            </div>

        
        <div class="btn-group dropup">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <span class="glyphicon glyphicon-cog"></span>
                <span class="sr-only">Toggle Dropdown</span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#" id="new_chat"><span class="glyphicon glyphicon-plus"></span> Novo</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-list"></span> Ver outras</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-remove"></span> Fechar Tudo</a></li>
                <li class="divider"></li>
                <li><a href="#"><span class="glyphicon glyphicon-eye-close"></span> Invisivel</a></li>
            </ul>
        </div>
    </div>
      
      
      <!-- barre de switch -->
      <label class="switch">
      <input type="checkbox" id="switch" onclick="changer()" placeholder="Commerce">
      <span class="slider"></span>
      </label>
      <!--  -->
    </div>

    <section class="corps" id="corps">
      <div class="icone" id="icone_canne_peche">
        <a href="#"><img src="canne_peche.png" alt="canne_peche"></a>
        <h2>Cannes à pêche</h2>
      </div>
      <div class="icone" id="icone_hamecon">
        <a href="#"><img src="Hamecon.jpg" alt="hamecon"></a>
        <h2>Hameçons</h2>
      </div>
      <div class="icone" id="icone_moulinet">
        <a href="#"><img src="Moulinet.jpg" alt="moulinet"></a>
        <h2>Moulinets</h2>
      </div>
      <div class="icone" id="icone_leure">
        <a href="#"><img src="leure.jpg" alt="leure"></a>
        <h2>Leures</h2>
      </div>
      <div class="icone" id="icone_equipement">
        <a href="#"><img src="bottes.jpg" alt="equipement"></a>
        <h2>Equipement</h2>
      </div>
      <div class="icone" id="icone_detachee">
        <a href="#"><img src="piece_detachee.jpg" alt="piece_detachee"></a>
        <h2>Pièces Détachées</h2>
      </div>
    </section>

    <div id="evenements">
      <div class="flex-item">
        <div class="img_flex_item">
            <img src= "debutant.jpg" id="image1" title="debutant" width=259px height=194px>
        </div>
          <div class="p1">Débutant</div>
          <h3>Journées découvertes, organisées le second W.E. de chaque mois, sur notre base de loisir</h3>
      </div>

      <div class="flex-item">
        <div class="img_flex_item">
          <img src= "intermediaire.jpg" id="image2" title="intermediaire" width=259px height=194px>
        </div>
          <div class="p1">Intermédiaire</div>
          <h3>Journées partages de conseils, tous les trois mois, dans les locaux de l'association</h3>
      </div>

      <div class="flex-item">
        <div class="img_flex_item">
          <img src= "expert.jpg" id="image3" title="expert" width=259px height=194px>
        </div>
          <div class="p1">Expert</div>
          <h3>Séjours à l'étranger, pension complète, durée et destination selon projet</h3>
      </div>
    </div>




    



    <div class="footer">
      <a href="#">Contacts</a>
      <a href="#">Conditions générales de vente</a>
      <a href="#">Mentions légales</a>
      <a href="#">CopyRights</a>
    </div>

    

  </body>
  <script type="text/javascript" src="index.js"></script>
  <script src="app.js"></script>
</html>
