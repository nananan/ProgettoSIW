var contImage = 0;
var bool = [];
var arrayDishId = [];
var arrayComment = [];
var arrayRating = [];
var arrayCont = [];
var positionImage = [];
var posTopSelected = [];
var posLeftSelected = [];
var arrayCategory = [];

var point = 0;

var user = eval("("+localStorage["user"]+")");

function deletePanelMenu() {
	$("#panelForMenu").toggle();
}

function deletePanelBestDish() {
	$("#panelForBestDish").toggle();
}

function deletePanelChooseMenu() {
	$("#panelForChooseMenu").toggle();
	
	var realComment = [];
	if (checkIfThereIsAComment(contImage, realComment)) {
		for (i = 0; i < realComment.length; i++) {
			if (realComment[i] != "") {
				$.ajax({
					method : "POST",
					url : 'Comment',
					data : {
						'dishId' : arrayDishId[i],
						'username' : user["username"],
						'comment' : realComment[i]
					},
					success : function(data) {
						
					},
				});
			}
		}
	}
	for (i = 0; i < contImage; i++) 
		arrayRating.splice(i,1,$("#valueRating"+i).val());
	
	if (checkIfThereIsARating(contImage)) {
		for (i = 0; i < arrayRating.length; i++) {
			if (arrayRating[i] != 0) {
				$.ajax({
					method : "POST",
					url : 'addRating',
					data : {
						'dishId' : arrayDishId[i],
						'username' : user["username"],
						'rating' : arrayRating[i]
					},
					success : function(data) {
						
					},
				});
			}
		}
	}
	
	for (i = 0; i < contImage; i++) 
	{
		$("#"+i).remove();
		$("#rating"+i).remove();
	}
	
	$('#dishPrimo').remove();
	$('#dishSecondo').remove();
	$('#dishContorno').remove();
	
	realComment = [];
	arrayComment = [];
	contImage = 0;
	
	$('#point').remove();
}

function showDailyMenu() {
	$("#panelForMenu").toggle();
	
	$.ajax({
		  url: "JSP/dailyMenu.jsp"
		}).done(function(data){
		$('#quadMenu').append(data);
	})
}


function showChoiseMenu() {
	$("#panelForChooseMenu").toggle();

	var user = eval("("+localStorage["user"]+")");
	if(user != null) {
		var posTop = 85;
		var countPrimo = 0;
		var countSecondo = 0;
		var countContorno = 0;
		var count = 0;
		
		$.ajax({
			method : "POST",
			url : 'GetMenuDaily',
			dataType: 'json',
			success : function(data) {
				var responseJson = eval(data);
				if(responseJson != null) {
		            $.each(responseJson, function(key,value) {
		            	var id = eval(value.id);
		            	arrayDishId.push(id);
		            	contImage++;
		            });
				}
			}
		}).done(function() {
			
			for (i = 0; i < arrayDishId.length; i++) {
				$.ajax({
					method : "POST",
					url : 'getRating',
					dataType : 'json',
					data : {
						'dishId' : arrayDishId[i],
						'username' : user["username"]
					},
					success : function(data) {
						var resp = eval(data);
						arrayRating.splice(i,1,resp[0]["points"]);
					}
				});
			}
		}).done(function(){
			$.ajax({
				  url: "JSP/chooseMenu.jsp"
				}).done(function(data){
				$('#quad').append(data);
			})
				
		}).done(function(){
		
			$.ajax({
				url: "library.html"
			}).done(function(data){
				$('#quad').append(data);
				for (i=0; i<contImage; i++) {
			      	if (arrayRating[i] == null)
			      		arrayRating.splice(i,1,0);

			      	if (i % 3 == 1) {
				      	$('#quad').append(
				      			'<link rel="stylesheet"  href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">'+
				      			'<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">'+
				      			'<link rel="stylesheet" href="css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>'+
				      			'<link rel="stylesheet" type="text/css" href="css/mensaCR.css">'+
				      			'<script src="Javascript/star-rating.js" type="text/javascript"></script>'+
				  			'<div id="rating'+i+'"><div id=container style="position:absolute; top:'+posTop+'%; left:5%; "><input id="valueRating'+i+'" class="rating" value="'+arrayRating[i]+'" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa"></div></div>');
				      	count++;
			      	}
			      	if (i % 3 == 2) {
				      	$('#quad').append(
				      			'<link rel="stylesheet"  href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">'+
				      			'<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">'+
				      			'<link rel="stylesheet" href="css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>'+
				      			'<link rel="stylesheet" type="text/css" href="css/mensaCR.css">'+
				      			'<script src="Javascript/star-rating.js" type="text/javascript"></script>'+
				  			'<div id="rating'+i+'"><div id=container style="position:absolute; top:'+posTop+'%; left:35%; "><input id="valueRating'+i+'" class="rating" value="'+arrayRating[i]+'" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa"></div></div>');
				      	count++;
			      	}
			      	if (i % 3 == 0) {
				      	$('#quad').append(
				      			'<link rel="stylesheet"  href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">'+
				      			'<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">'+
				      			'<link rel="stylesheet" href="css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>'+
				      			'<link rel="stylesheet" type="text/css" href="css/mensaCR.css">'+
				      			'<script src="Javascript/star-rating.js" type="text/javascript"></script>'+
				  			'<div id="rating'+i+'"><div id=container style="position:absolute; top:'+posTop+'%; left:65%; "><input id="valueRating'+i+'" class="rating" value="'+arrayRating[i]+'" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa"></div></div>');
				      	count++;
			      	}
			      	
			      	if (count % 3 == 0) 
			      		posTop += 100;
				}
			});
		});
		$('body').append('<p id="point">POINT:'+point+'</p>');
	}
	else
		alert("Devi eseguire il login.")
}

function showBestDishes(){
	$('#panelForBestDish').toggle();

	$.ajax({
		  url: "JSP/bestDishes.jsp"
		}).done(function(data){
		$('#quadBestDish').append(data);
	});	
}

function checkDishSelected() {
	for (i=0; i<arrayCont.length; i++) {
		$('#quad').append('<div id="dishBorder"><a id="dishBorder'+arrayCont[i]+
				'"><img style="top:'+posTopSelected[arrayCont[i]]+'%; left:'+posLeftSelected[arrayCont[i]]+
				'%;" onclick="setBorderSelect('+posTopSelected[arrayCont[i]]+","+posLeftSelected[arrayCont[i]]+","+arrayCont[i]+","+arrayCategory[arrayCont[i]]+')" /></a></div>');
		bool[arrayCont[i]] = true;
		
	}
}

function setBorderSelect(posTop,pos,cont,category) {
	if (bool[cont] == null)
		bool[cont] = false;
	if (bool[cont] == false) {
		if ((point +1 <= 5 && (category=="1" || category=="3")) || (point + 2 <= 5 && category=="2")) {
			$('#quad').append('<div id="dishBorder"><a id="dishBorder'+cont+'"><img style="top:'+posTop+'%; left:'+pos+'%;" onclick="setBorderSelect('+posTop+","+pos+","+cont+","+category+')" /></a></div>');
			bool[cont] = true;
			if (category == "1" || category == "3")
				point += 1;
			else if (category == "2")
				point += 2;
			
			if (posTopSelected[cont] == null)
				posTopSelected[cont] = posTop;
			else
				posTopSelected.splice(cont,1,posTop);
			if (posLeftSelected[cont] == null)
				posLeftSelected[cont] = pos;
			else
				posLeftSelected.splice(cont,1,pos);

			arrayCategory[cont] = category;
			arrayCont.push(cont);
		}
		else
			alert("Hai superato i punti.");
	}
	else {
		$("#dishBorder"+cont).remove();
		bool[cont] = false;
		if (category == "1" || category == "3")
			point -= 1;
		else if (category == "2")
			point -= 2;
		
	}
	if (point <= 5) {
		$('#point').remove();
		$('body').append('<p id="point">POINT:'+point+'</p>');
		
	} else {
		alert("Hai superato i punti.");
	}
}

function checkIfThereIsAComment(cont, realComment) {
	var isCommented = false;
	
	for (i=0; i<cont; i++) {
		if (document.getElementById(i).value != "") {
			arrayComment.splice(i,1,document.getElementById(i).value);
			isCommented = true;
			console.log(document.getElementById(i).value);
		}
		realComment.push(document.getElementById(i).value);
	}
	arrayComment = [];
	return isCommented;
}

function checkIfThereIsARating(contImage) {
	for (i=0; i<arrayRating.length; i++) {
		if (arrayRating[i] != 0) {
			return true;
		}
	}
}


var position = 5;
var cont = 0;
var commentArray = [];
var commentId = [];
var dateArray = [];
var thereIsComment = false;
function showComment(dishId) {

	var user = eval("("+localStorage["user"]+")");
	
	
	$.ajax({
		  url: "JSP/comment.jsp"
		}).done(function(data){
		$('body').append(data);
		
	}).done(function(){
		if (user != null) {
			$.ajax({
				method : "POST",
				url : 'getCommentUser',
				dataType : 'json',
				data : {
					'dishId' : dishId,
					'username' : user["username"]
				},
				success : function(data) {
					var responseJson = eval(data);
					if(responseJson != null) {
			            $.each(responseJson, function(key,value) {
			            	console.log(value);
			            	$('#panelForComment').append('<p id="numberComment" style="top:'+position+'%">'+value.commentdate+'</p>');
			            	$('#panelForComment').append('<div id="comment'+cont+'"><p id="commentDish" class="commentDish'+cont+'" style="top:'+(position+5)+'%">'+value.comment+'</p></div>');
			            	
			            	commentArray[cont] = value.comment;
			            	commentId[cont] = value.id;
			            	dateArray[cont] = value.commentdate;
			            	
			            	$('#panelForComment').append('<button id="modifyButton" onclick="modifyComment('+cont+","+(position+5)+');"'+
			            			'type="button" style="top:'+(position+24)+'%">Modifica</button>');
			            	$('#panelForComment').append('<button id="deleteButton" onclick="deleteComment('+cont+","+(position+5)+","+dishId+');"'+
			            			'type="button" style="top:'+(position+24)+'%">Cancella</button>');
			            	
			            	position += 35;
			            	cont++;
			            });
					}
				}
			}).done(checkCommentNotUser(dishId));
		}
		else
			checkComment(dishId);
		
		if (!thereIsComment)
			$('#panelForComment').append('<p id="numberComment" style="top:10%">Non sono presenti ancora commenti per quetso piatto.</p>');
	});
	
}

function checkComment(dishId) {
	console.log(position);
	$.ajax({
		method : "POST",
		url : 'getComment',
		dataType : 'json',
		data : {
			'dishId' : dishId
		},
		success : function(data) {
			var responseJson = eval(data);
			if(responseJson != null) {
	            $.each(responseJson, function(key,value) {
	            	$('#panelForComment').append('<p id="numberComment" style="top:'+position+'%">'+value.commentdate+'</p>');
	            	$('#panelForComment').append('<div><p id="commentDish" style="top:'+(position+5)+'%">'+value.comment+'</p></div>');
	            	
	            	position += 25;
	            	thereIsComment = true;
	            });
			}
		}
	});
}

function checkCommentNotUser(dishId) {
	console.log(position);
	$.ajax({
		method : "POST",
		url : 'getCommentNotUser',
		dataType : 'json',
		data : {
			'dishId' : dishId,
			'username' : user["username"]
		},
		success : function(data) {
			var responseJson = eval(data);
			if(responseJson != null) {
	            $.each(responseJson, function(key,value) {
	            	$('#panelForComment').append('<p id="numberComment" style="top:'+position+'%">'+value.commentdate+'</p>');
	            	$('#panelForComment').append('<div><p id="commentDish" style="top:'+(position+5)+'%">'+value.comment+'</p></div>');
	            	
	            	position += 25;
	            	thereIsComment = true;
	            });
			}
		}
	});
}

function modifyComment(cont,position) {
	$('#comment'+cont).remove();
	$('#panelForComment').append('<div id="comment'+cont+'"><textarea id="commentDish" class="commentDish'+cont+'" style="top:'+position+'%">'+commentArray[cont]+'</textarea></div>');
	
	$('#modifyButton').remove();
	$('#panelForComment').append('<button id="okButton" onclick="okComment('+cont+","+position+');" type="button" style="top:'+(position+19)+'%">Ok</button>');
}

function okComment(cont,position) {
	if ($('.commentDish'+cont).val() != "") {
		$.ajax({
			method : "POST",
			url : 'modifyComment',
			data : {
				'commentId' : commentId[cont],
				'comment' : $('.commentDish'+cont).val()
			},
			success : function(data) {
				commentArray[cont] = $('.commentDish'+cont).val();
				insertPanelCommentModified(cont, position);
			}
		});
	}
	else 
		insertPanelCommentModified(cont, position);
}

function insertPanelCommentModified(cont, position) {
	$('#comment'+cont).remove();
	$('#okButton').remove();
	$('#panelForComment').append('<div id="comment'+cont+'"><p id="commentDish" style="top:'+(position)+'%">'+commentArray[cont]+'</p></div>');
	$('#panelForComment').append('<button id="modifyButton" onclick="modifyComment('+cont+","+position+');" type="button" style="top:'+(position+19)+'%">Modifica</button>');
}

function deleteComment(cont,position,dishId) {
	$.ajax({
		method : "POST",
		url : 'deleteComment',
		data : {
			'commentId' : commentId[cont]
		},
		success : function(data) {
			console.log("COMMENT: " +commentId[cont]);
			$('#panelForComment').append('<div id="deleteComment" style="top:'+(position-5)+'%"</div>');
			$('#panelForComment').append('<button id="annullaButton" onclick="annullaDeleteComment('+cont+","+(position)+","+dishId+');"'+
        			'type="button" style="top:'+(position+19)+'%">Annulla</button>');
			$('#deleteButton').remove();
		}
	});
}

function annullaDeleteComment(cont,position,dishId) {
	$('#deleteComment').remove();
	$('#annullaButton').remove();
	
	$('#panelForComment').append('<button id="deleteButton" onclick="deleteComment('+cont+","+(position)+","+dishId+');"'+
			'type="button" style="top:'+(position+19)+'%">Cancella</button>');
	
	
	$.ajax({
		method : "POST",
		url : 'Comment',
		data : {
			'dishId' : dishId,
			'username' : user["username"],
			'comment' : commentArray[cont],
			'date' : dateArray[cont]
		},
		success : function(data) {
			var resp = eval(data);
			commentId.splice(cont,1,resp[0]["id"]);
		}
	});
	
}

function deletePanelComment() {
	
	$('#theme').remove();
	$('#panelForComment').remove();
	
}

