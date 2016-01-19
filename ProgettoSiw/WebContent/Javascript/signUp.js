
function createAccount() {
		$.ajax({
			type : "POST",
			url : 'SignUp',
			data : {
				'username' : $('#username').val(),
				'password' : $('#password').val(),
				'email' : $("#email").val(),
				'social' : false,
//				'profileImage' : "file:///home/eliana/SIW/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ProgettoSiw/data/worms.jpg"
			},
			success : function(data) {
				// FARE PANNELLINO
				localStorage["user"] = data;
				$('#register').toggle();
				$('#paneLogin').toggle();
				$('#paneBottomLogin').toggle();
				$('body').append('<div id="nameUser"><p>'+$('#username').val()+'</p></div>');
				deleteLoginAndInsertNameUser($('#username').val());
			},
			 error: function (data) {
	              alert("ERRORE");
            }
		});
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
	$('body').append('<div id="nameUser"><p onclick="insertProfile()">'+username+'</p></div>');
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
			// FARE PANNELLINO
			localStorage["user"] = data;
			$('#register').toggle();
			$('#paneLogin').toggle();
			$('#paneBottomLogin').toggle();
			$('body').append('<div id="nameUser"><p>'+$('#username').val()+'</p></div>');
			deleteLoginAndInsertNameUser($('#username').val());
		},
		 error: function (data) {
				console.log("ERRORE QUANTO UNA CASA");
        }
	});
} 

