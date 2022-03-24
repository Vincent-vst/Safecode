
// create and execute an XMLHttpRequest to get data from the storage file
function getData() {
	var request_data = new XMLHttpRequest();
	request_data.onload = processData;
	request_data.open("get", data, true);
	request_data.send();
}

// get the hostname of the current tab
function getCurrentTabHostname(callback) {
	var currentTab = chrome.tabs.query({active: true, currentWindow: true}, function(tabs) {
		var currentTab = tabs[0];
		var url = new URL(currentTab.url);
		callback(url.hostname);
	});
}

// launch the script injection with all the parameters
function processData() {
	var passwordsObject = JSON.parse(this.responseText);
	getCurrentTabHostname(function (hostname) {
		for(const password of passwordsObject.passwords) {
			if (password.site == hostname) {
				injectScript(password.password, password.email);
			}
		}
	});
}

function injectScript(password, email) {
	chrome.tabs.query({active: true, currentWindow: true}, function(tabs){
		chrome.storage.local.set({"password" : password}, null);
		chrome.storage.local.set({"email" : email}, null);
		
		var currentTab = tabs[0].id;
		chrome.scripting.executeScript({
			target: {tabId: currentTab},
			files: ['script.js'],
		});
	});
}

function autofill() {
	getData();
}

var data = chrome.runtime.getURL("data.json");
document.getElementById("login").addEventListener("click", autofill);