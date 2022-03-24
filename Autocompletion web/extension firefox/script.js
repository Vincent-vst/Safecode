var email_tag = document.getElementsByName("email");
if (email_tag[0].tagName == "INPUT") {
	email_tag[0].value = "mart_84";
}


document.getElementById("pass").value = "azertyuiop";


// TODO
/* - Avoir les différents noms possibles pour les deux inputs
*  - Analyser en fonction du type d'input (password/email)
*  - Essayer avec les id
*  - Essayer avec les classes -> surement moins précis
*/ 