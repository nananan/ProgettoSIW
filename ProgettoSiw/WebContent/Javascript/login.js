var socialUser = false;

function insertPaneLogin() {
	
//	$.ajax({
//	  url: "login.html",
//	  success: function(data) {
//	  }
//	}).done(function(data){
//		$('body').append(data)
//	});
	
	$.ajax({
		  url: "login.html",
		  success: function(data) {
			  $('body').append(data)
		  }
		}).done(function(data){
			$('#paneLogin').toggle();
	});
}

function insertPaneLoginMobile() {
	
	$.ajax({
		  url: "JSP/login.jsp",
		  success: function(data) {
			  $('body').append(data)
		  }
		}).done(function(data){
			$('#paneLogin').toggle();
	});
}


function deletePanelLogin() {
	$('#paneBottomLogin').remove();
	$('#paneLogin').remove();
}

function deletePanelRegister() {
	$('#themeRegister').remove();
	$('#register').remove();
}

function deletePanelRegisterMobile() {
	$('#modalRegister').remove();
	$('#themeRegister').remove();
}


function insertPaneForRegister() {
	$.ajax({
		  url: "register.html",
		  success: function(data) {
			  $('body').append(data)
		  }
		}).done(function(data){
			$('#register').toggle();
	});
}

function insertPaneForRegisterMobile() {
	$.ajax({
		  url: "JSP/mobile/register.jsp",
		  success: function(data) {
			  $('body').append(data)
		  }
		}).done(function(data){
			$('#register').toggle();
	});
}

function executeLogin() {
	$.ajax({
		type : "POST",
		url : 'Login',
		data : {
			'username' : $("#user").val(),
			'password' : $("#pwd").val()
		},
		success : function(data) {
			localStorage["user"] = data;
			var jsonResp = eval("("+data+")");
			if (jsonResp["user"] != "null") {
				deleteLoginAndInsertNameUser(jsonResp["username"]);
			}
			else {
				userNotPresent();
			}
		},
		 error: function (data) {
              alert("ERRORE");
        }
	});
}

function executeLoginMobile() {
	$.ajax({
		type : "POST",
		url : 'Login',
		data : {
			'username' : $("#user").val(),
			'password' : $("#pwd").val()
		},
		success : function(data) {
			localStorage["user"] = data;
			var jsonResp = eval("("+data+")");
			if (jsonResp["user"] != "null") {
				deleteLoginAndInsertNameUserMobile(jsonResp["username"]);
			}
			else {
				userNotPresent();
			}
		},
		 error: function (data) {
              alert("ERRORE");
        }
	});
}


function deleteLoginAndInsertNameUser(username) {
	$('#paneLogin').remove();
	$('#paneBottomLogin').remove();
	
	$('#loginKeyLi').remove();
	
//	$('#menu li').eq(3).remove();
//	$('ul#menu').last().append('<li><a id="exitKey" onclick="executeLogOut()">Exit</a></li>');
	$('body').append('<div id="nameUser"><div id="quadName" onclick="insertProfile()">'+username+'<div></div>');
}


function deleteLoginAndInsertNameUserMobile(username) {
	
	$.ajax({
		  url: "JSP/mobile/profile.jsp",
		  success: function(data) {
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


isInsertProfile = false;
isInsertInfo = false;
function insertProfile() {
	if (!isInsertProfile) {
		$.ajax({
			  url: "JSP/profile.jsp",
			  success: function(data) {
			  }
		}).done(function(data){
			$('#paneInfo').remove();
			$('.arrow-topInfo').remove();
			$('body').append(data);
			isInsertProfile = true;
			isInsertInfo = false;
		});
	}
	else {
		$('#pane').remove();
		$('.arrow-top').remove();
		isInsertProfile = false;
	}
}

function insertPaneInfo() {
	if (!isInsertInfo) {
		$.ajax({
			  url: "JSP/info.jsp",
			  success: function(data) {
			  }
		}).done(function(data){
			$('#pane').remove();
			$('.arrow-top').remove();
			$('#popupSection').append(data);
			isInsertInfo = true;
			isInsertProfile = false;
		});
	}
	else {
		$('#paneInfo').remove();
		$('.arrow-topInfo').remove();
		isInsertInfo = false;
	}
} 


function userNotPresent() {
	$('body').append('<div id="userNotPresent"><p>Utente non presente, Registrati.</p>'+
			'<input onclick="ok()" type="button" value="Ok"/></div>');
}

function ok() {
	$('#userNotPresent').remove();
}

function executeLogOut() {
//	$('#menu li').eq(3).remove();
//	$('ul#menu').last().append('<li><a id="loginKey" onclick="insertPaneLogin()">Login</a></li>');
//	$('#nameUser p').remove();
//	$('#pane').remove();
//	$('.arrow-top').remove();
	
	if (socialUser)
		Logout();
	else
		localStorage["user"] = null;
	
	location.href="main.html";
}

window.fbAsyncInit = function() {
	FB.init({
		appId : '187466334935416',
		xfbml : true,
		version : 'v2.5'
	});
};
(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) {
		return;
	}
	js = d.createElement(s);
	js.id = id;
	js.src = "//connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

// login Facebook
function Login() {
    FB.login(function(response) {
       if (response.authResponse) {
            getUserInfo(); // Get User Information.
        } else {
         console.log('Authorization failed.');
        }
     },{scope: 'email,user_photos'});
}

userIsNotPresent = true;
function getUserInfo() {
	FB.api('/me', {fields : [ 'email', 'name', 'picture.type(normal)']}, function(response) {

     //response.name       - User Full name
     //response.link       - User Facebook URL
     //response.username   - User name
     //response.id         - id
     //response.email      - User email
		
		$.ajax({
			type : "POST",
			url : 'Login',
			data : {
				'username' : response.name,
				'social' : true
			},
			success : function(data) {
				localStorage["user"] = data;
				var jsonResp = eval("("+data+")");
				if (jsonResp["user"] != "null") {
					deleteLoginAndInsertNameUser(jsonResp["username"]);
					userIsNotPresent = false;
				}
				else
					userIsNotPresent = true;
			},
			 error: function (data) {
	              alert("ERRORE");
	        }
		}).done(function() {
			if (userIsNotPresent) {
		    	$.ajax({
		    		type : "POST",
		    		url : 'SignUp',
		    		data : {
		    			'name' : response.name,
		    			'username' : response.username,
		    			'email' : response.email,
		    			'imageUrl' : response.picture.data.url,
		    			'social' : true
		    		},
		    		success : function(data) {
		    			console.log(localStorage);
		    			localStorage["user"] = data;
		    			console.log(data);
		    			var jsonResp = eval("("+data+")");
		//    			if (localStorage["user"] == jsonResp["username"])
		//    				console.log("YOOOOOOO");
		    			if (jsonResp["user"] != "null") {
		    				deleteLoginAndInsertNameUser(jsonResp["username"]);
		    				socialUser = true;
		    			}
		    			else {
		    				userNotPresent();
		    			}
		    		},
		    		 error: function (data) {
		                  console.log("ERRORE");
		            }
		    	});
			}
	     })
	});
}

function getPhoto()
{
  FB.api('/me/picture?type=normal', function(response) {

//      var str="<br/><b>Pic</b> : <img src='"+response.data.url+"'/>";
//      document.getElementById("status").innerHTML+=str;
	  console.log(response.data.url);
	  return response.data.url;
  }); 
}


function Logout()
{
	localStorage["user"] = null;
    FB.logout(function(){document.location.reload();});
}

