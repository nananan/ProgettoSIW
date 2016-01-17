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
						
					}
				});
			}
		}
	}
	for (i = 0; i < contImage; i++) 
		arrayRating.splice(i,1,$("#valueRating"+i).val());
	
//	if (checkIfThereIsARating(contImage)) {
		for (i = 0; i < arrayRating.length; i++) {
//			if (arrayRating[i] != 0) {
				$.ajax({
					method : "POST",
					url : 'addRating',
					data : {
						'dishId' : arrayDishId[i],
						'username' : user["username"],
						'rating' : $("#valueRating"+i).val()
					},
					success : function(data) {
					}
				});
//			}
		}
//	}
	
//	for (i = 0; i < contImage; i++) 
//	{
//		$("#"+i).remove();
//		$("#rating"+i).remove();
//	}
	
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
		$('#pane').remove();
		$('.arrow-top').remove();
	})
}


function showChoiseMenu() {
	$("#panelForChooseMenu").toggle();

	var user = eval("("+localStorage["user"]+")");
	if(user != null) {
//		var posTop = 85;
//		var countPrimo = 0;
//		var countSecondo = 0;
//		var countContorno = 0;
//		var count = 0;
		
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
						console.log(resp[0]);
						arrayRating[i]= resp[0]["points"];
						console.log(arrayRating[i]);
					}
				});
			}
		}).done(function(){
			$.ajax({
				  url: "JSP/chooseMenu.jsp"
				}).done(function(data){
				$('#quad').append(data);
				$('#pane').remove();
				$('.arrow-top').remove();
			})
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
		$('#pane').remove();
		$('.arrow-top').remove();
	});	
}

//function checkDishSelected() {
//	for (i=0; i<arrayCont.length; i++) {
//		$('#quad').append('<div id="dishBorder"><a id="dishBorder'+arrayCont[i]+
//				'"><img style="top:'+posTopSelected[arrayCont[i]]+'%; left:'+posLeftSelected[arrayCont[i]]+
//				'%;" onclick="setBorderSelect('+posTopSelected[arrayCont[i]]+","+posLeftSelected[arrayCont[i]]+","+arrayCont[i]+","+arrayCategory[arrayCont[i]]+')" /></a></div>');
//		
//		bool[arrayCont[i]] = true;
//		console.log("OOOOH "+arrayCont[i]+"    "+i);
//	}
//}

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
			            	$('#panelForComment').append('<div id="panelComment'+cont+'" class="panelComment" ><div>');
			            	
			            	$('#panelComment'+cont).append('<div id="numberComment"><p id="numberComment'+cont+'">'+value.commentdate+'</p></div>');
			            	$('#panelComment'+cont).append('<div id="comment'+cont+'"><p id="commentDish" class="commentDish'+cont+'">'+value.comment+'</p></div>');
			            	
			            	commentArray[cont] = value.comment;
			            	commentId[cont] = value.id;
			            	dateArray[cont] = value.commentdate;
			            	
			            	$('#panelComment'+cont).append('<button class="modifyButton" id="modifyButton'+cont+'" onclick="modifyComment('+cont+","+dishId+');"'+
			            			'type="button">Modifica</button>');
			            	$('#panelComment'+cont).append('<button class="deleteButton" id="deleteButton'+cont+'" onclick="deleteComment('+cont+","+dishId+');"'+
			            			'type="button">Cancella</button>');
			            	
			            	cont++;
			            	thereIsComment = true;
			            });
					}
				}
			}).done(checkCommentNotUser(dishId));
		}
		else
			checkComment(dishId);
	});
}

function checkComment(dishId) {
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
	            	$('#panelForComment').append('<div id="panelComment" class="panelComment" ><div>');
	            	
	            	$('#panelComment').append('<div id="numberComment"><p>'+value.commentdate+'</p></div>');
	            	$('#panelComment').append('<div><p id="commentDish">'+value.comment+'</p></div>');
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
	            	$('#panelForComment').append('<div id="panelComment" class="panelComment" ><div>');
	            	
	            	$('#panelComment').append('<div id="numberComment"><p>'+value.commentdate+'</p></div>');
	            	$('#panelComment').append('<div><p id="commentDish">'+value.comment+'</p></div>');
	            	thereIsComment = true;
	            });
			}
		}
	});
}

function modifyComment(cont,dishId) {
	$('#comment'+cont).remove();
	$('#panelComment'+cont).append('<div id="comment'+cont+'"><textarea id="commentDish" class="commentDish'+cont+'">'
			+commentArray[cont]+'</textarea></div>');
	
	$('#modifyButton'+cont).remove();
	$('#deleteButton'+cont).remove();
	$('#panelComment'+cont).append('<button class="okButton" id="okButton'+cont+'" onclick="okComment('+cont+","+dishId+');"'+
		'type="button">Salva</button>');
}


function okComment(cont,dishId) {
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
				insertPanelCommentModified(cont,dishId);
			}
		});
	}
	else 
		insertPanelCommentModified(cont,dishId);
}

function insertPanelCommentModified(cont,dishId) {
	$('#comment'+cont).remove();
	$('#okButton'+cont).remove();
	$('#panelComment'+cont).append('<div id="comment'+cont+'"><p id="commentDish" class="commentDish'+cont+'">'+commentArray[cont]+'</p></div>');
	$('#panelComment'+cont).append('<button class="modifyButton" id="modifyButton'+cont+'" onclick="modifyComment('+cont+');" type="button">Modifica</button>');
	$('#panelComment'+cont).append('<button class="deleteButton" id="deleteButton'+cont+'" onclick="deleteComment('+cont+","+dishId+');"'+
		'type="button">Cancella</button>');
}

function deleteComment(cont,dishId) {
	$.ajax({
		method : "POST",
		url : 'deleteComment',
		data : {
			'commentId' : commentId[cont]
		},
		success : function(data) {
			$('#panelComment'+cont).empty();
			$('#panelComment'+cont).append('<button class="annullaButton" id="annullaButton'+cont+'" onclick="annullaDeleteComment('+cont+","+dishId+');"'+
			'type="button">Annulla</button>');
		}
	});
}

function annullaDeleteComment(cont,dishId) {
	$('#annullaButton'+cont).remove();

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
			
			$('#panelForComment').append('<div id="panelComment'+cont+'" class="panelComment"><div>');

			$('#panelComment'+cont).append('<div id="numberComment"><p id="numberComment'+cont+'">'+dateArray[cont]+'</p></div>');
        	$('#panelComment'+cont).append('<div id="comment'+cont+'"><p id="commentDish" class="commentDish'+cont+'">'+commentArray[cont]+'</p></div>');
        	
        	$('#panelComment'+cont).append('<button class="modifyButton" id="modifyButton'+cont+'" onclick="modifyComment('+cont+","+dishId+');"'+
        			'type="button">Modifica</button>');
        	$('#panelComment'+cont).append('<button class="deleteButton" id="deleteButton'+cont+'" onclick="deleteComment('+cont+","+dishId+');"'+
        			'type="button">Cancella</button>');
        	
		}
	});
	
	
}

function deletePanelComment() {
	
	$('#theme').remove();
	$('#panelForComment').remove();
	
}

