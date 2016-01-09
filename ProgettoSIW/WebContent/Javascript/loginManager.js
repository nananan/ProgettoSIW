 
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
              alert("ERRORE");
        }
	});
}