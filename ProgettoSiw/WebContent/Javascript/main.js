
$.ajax({
	  url: "JSP/index.jsp"
	}).done(function(data){
	$('body').append(data);
//	var json = eval("("+localStorage["user"]+")");
//	
//	if (json != null) {
//			simpleLogin(json);
//		}
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
//			 console.log(json["username"]);
             alert("ERRORE");
        }
	});
}

function simpleLoginMobile(json) {
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
				deleteLoginAndInsertNameUserMobile(jsonResp["username"]);
			}
		},
		 error: function (data) {
//			 console.log(json["username"]);
             alert("ERRORE");
        }
	});
}

