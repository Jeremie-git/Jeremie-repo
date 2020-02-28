// Cette fonction sert à cacher la div "Evènements" quand on charge la page.
// Elle est appliquée au tag <body> via un "onload"
function cacher(){
   document.getElementById("evenements").style.display = "none";
 }

// Cette fonction sert à afficher la div "Evènements" quand la div "Commerce est affichée" après avoir cliquer sur la barre de switch
// Elle est appliquée à l'input id="switch" via un "onclick"
function changer(){
   var corps = document.getElementById("corps");
   var tempo = document.getElementById("evenements");
   if (corps.style.display === "none") {
     corps.style.display = "flex";
     tempo.style.display = "none";
   }
   else {
     corps.style.display = "none";
     tempo.style.display = "flex";
   }
 }
