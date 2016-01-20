
$.ajax({
	  url: "JSP/index.jsp"
	}).done(function(data){
	$('body').append(data);
	var json = eval("("+localStorage["user"]+")");
	
	if (json != null) {
			simpleLogin(json);
		}
}).done(function(){
	$.ajax({
		  url: "login.html",
		  success: function(data) {
			  $('body').append(data);
		  }
		}).done(function(data){
			$('#paneLogin').toggle();
		})
	
}).done(function(){
	$.ajax({
		  url: "JSP/signUp.jsp",
		  success: function(data) {
			  $('body').append(data)
		  }
		}).done(function(data){
			$('#register').toggle();
	});
	
});

	
function simpleLogin(json) {
	$.ajax({
		type : "POST",
		url : 'Login',
		data : {
			'username' : json["username"],
			'password' : json["password"]
		},
		success : function(data) {
			var jsonResp = eval("("+data+")");
			if (jsonResp["user"] != "null") {
				deleteLoginAndInsertNameUser(jsonResp["username"]);
			}
		},
		 error: function (data) {
			 console.log(json["username"]);
              alert("ERRORE");
        }
	});
}

