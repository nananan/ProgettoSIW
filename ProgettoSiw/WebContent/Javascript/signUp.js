function createAccount() {
	var isAllInsert = true;
	
	if ($('#email').val() == "Email Address") {
		document.getElementById("email").style.borderColor = "red";
		isAllInsert = false;
	}
	if ($('#username').val() == "Username") {
		document.getElementById("username").style.borderColor = "red";
		isAllInsert = false;
	}
	if ($('#password').val() == "password") {
		document.getElementById("password").style.borderColor = "red";
		isAllInsert = false;
	}
	
	if (isAllInsert) {
		$.ajax({
			type : "POST",
			url : 'SignUp',
			data : {
				'username' : $('#username').val(),
				'password' : $('#password').val(),
				'email' : $("#email").val(),
				'social' : false,
				'profileImage' : "images/profileImage/noImage.png"
			},
			success : function(data) {
				// FARE PANNELLINO
				localStorage["user"] = data;
				$('#register').toggle();
				$('#paneLogin').toggle();
				$('#paneBottomLogin').toggle();
				$('body').append('<div id="nameUser"><div id="quadName" onclick="insertProfile()">'+$('#username').val()+'<div></div>');
				deleteLoginAndInsertNameUser($('#username').val());
			},
			 error: function (data) {
	              alert("ERRORE");
            }
		});
	}
} 


function chooseProfileImage() {
	$.ajax({
		  url: "JSP/upload.jsp"
		}).done(function(data){
		$('body').append(data);
	});
}

function chooseAvatar() {
	$.ajax({
		  url: "JSP/changeAvatar.jsp"
		}).done(function(data){
		$('body').append(data);
	});
}

function deleteLoginAndInsertNameUser(username) {
	$('#paneLogin').remove();
	$('#paneBottomLogin').remove();
	$('#menu li').eq(3).remove();
//	$('ul#menu').last().append('<li><a id="exitKey" onclick="executeLogOut()">Exit</a></li>');
	$('body').append('<div id="nameUser"><div id="quadName" onclick="insertProfile()">'+username+'<div></div>');
}


function createAccountA(file) {
	$.ajax({
		type : "POST",
		url : 'SignUp',
		data : {
			'username' : $('#username').val(),
			'password' : $('#password').val(),
			'email' : $("#email").val(),
			'social' : false,
			'profileImage' : file
		},
		success : function(data) {
			localStorage["user"] = data;
			$('#register').toggle();
			$('#paneLogin').toggle();
			$('#paneBottomLogin').toggle();
			$('body').append('<div id="nameUser"><div id="quadName" onclick="insertProfile()">'+$('#username').val()+'<div></div>');
			deleteLoginAndInsertNameUser($('#username').val());
		}
	});
} 

