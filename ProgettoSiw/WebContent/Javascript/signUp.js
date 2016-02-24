function createAccount() {
	var isAllInsert = true;
	
	if ($('#email').val() == "") {
		document.getElementById("email").style.borderColor = "red";
		isAllInsert = false;
	}
	if ($('#username').val() == "") {
		document.getElementById("username").style.borderColor = "red";
		isAllInsert = false;
	}
	if ($('#password').val() == "") {
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
				$('#themeRegister').remove();
				$('#register').toggle();
				$('#paneLogin').toggle();
				$('#paneBottomLogin').toggle();
//				$('body').append('<div id="nameUser"><div id="quadName" onclick="insertProfile()">'+$('#username').val()+'<div></div>');
				deleteLoginAndInsertNameUser($('#username').val());
			},
			 error: function (data) {
	              alert("ERRORE");
            }
		});
	}
} 

function createAccountMobile() {
	var isAllInsert = true;
	
	if ($('#email').val() == "") {
		document.getElementById("email").style.borderColor = "red";
		isAllInsert = false;
	}
	if ($('#username').val() == "") {
		document.getElementById("username").style.borderColor = "red";
		isAllInsert = false;
	}
	if ($('#password').val() == "") {
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
				localStorage["user"] = data;
//				$('body').append('<div id="nameUser"><div id="quadName" onclick="insertProfile()">'+$('#username').val()+'<div></div>');
				deleteLoginAndInsertNameUserMobile($('#username').val());
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
	$('#loginKeyLi').remove();
	
	$('body').append('<div id="nameUser"><div id="quadName" onclick="insertProfile()">'+username+'<div></div>');
}

function deleteLoginAndInsertNameUserMobile(username) {
	$.ajax({
		  url: "JSP/mobile/profile.jsp",
		  success: function(data) {
			  $('#modalRegister').remove();
			  $('#themeRegister').remove();
			  $('#paneLogin').remove();
			  $('#paneBottomLogin').remove();
			  $('#loginKeyLi').remove();
			  
			  $('ul#menuCollapsibleMain').append('<li> <div class="collapsible-header"><a>'+username+'</a></div>'
					  +'<div class="collapsible-body">'+data+'</div>'
					  +'</li>');
			  $('ul#menuCollapsibleIndex').append('<li> <div class="collapsible-header"><a>'+username+'</a></div>'
					  +'<div class="collapsible-body">'+data+'</div>'
					  +'</li>');
		  }
		});
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
			$('#themeRegister').remove();
			$('#register').toggle();
			$('#paneLogin').toggle();
			$('#paneBottomLogin').toggle();
			$('body').append('<div id="nameUser"><div id="quadName" onclick="insertProfile()">'+$('#username').val()+'<div></div>');
			deleteLoginAndInsertNameUser($('#username').val());
		}
	});
} 

