function login() {
	
	chrome.storage.local.get(["password"], function(password) {
		var passwordInput = document.querySelectorAll("form input[type=password]");
		passwordInput[0].value = password.password
	});
	chrome.storage.local.remove(["password"]);
	
	chrome.storage.local.get(["email"], function(email) {
		var email_tag = document.getElementsByName("email");
		if (email_tag.length > 0) {		
			if (email_tag[0].tagName == "INPUT") {
				email_tag[0].value = email.email;
			}
		}
	});
	chrome.storage.local.remove(["email"]);
}

login();



// TODO
/* - Avoir les différents noms possibles pour les deux inputs
*  - Analyser en fonction du type d'input (password/email)
*  - Essayer avec les id
*  - Essayer avec les classes -> surement moins précis
*/ 