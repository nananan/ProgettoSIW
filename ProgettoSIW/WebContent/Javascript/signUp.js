function createAccount() {
		$.ajax({
			type : "POST",
			url : 'SignUp',
			data : {
				'username' : $('#username').val(),
				'password' : $('#password').val(),
				'email' : $("#email").val(),
//				'profileImage' : $('#fileChoosed').val()
			},
			success : function(data) {
				alert(username);
				// FARE PANNELLINO
				$('#register').toggle();
				$('#paneLogin').toggle();
				$('#paneBottomLogin').toggle();
				$('body').append('<div id="nameUser"><p>'+$('#username').val()+'</p></div>');
			},
			 error: function (data) {
	              alert(data);
            }
		});
} 




function chooseProfileImage() {
	$.ajax({
		  url: "fileChooser.html"
		}).done(function(data){
		$('body').append(data);
	});
}
