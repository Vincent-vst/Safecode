document.getElementById("login").addEventListener("click", autofill);

function autofill() {
	
	
	browser.tabs.query({active: true, currentWindow: true}, function(tabs){
		var currentTab = tabs[0];
		browser.tabs.executeScript({
			file: 'script.js'
		});
	});
}