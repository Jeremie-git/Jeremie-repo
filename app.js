var obj= {envoi:'coucou'} 
$.ajax({
     url: "index.php", 
     type:"POST", 
     data:obj 
}).done(function( arg) {
     //alert( "Données : " + arg); 
});
