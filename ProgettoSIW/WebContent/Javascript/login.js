function insertPaneLogin() {
	
	$.ajax({
		  url: "login.html"
		}).done(function(data){
		$('body').append(data);
	});
	
}

function insertPaneForRegister() {
	$.ajax({
		  url: "register.html"
		}).done(function(data){
		$('body').append(data);
	});
}

function executeLogin() {
	
}