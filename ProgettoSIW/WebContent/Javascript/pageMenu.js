
var contImage = 0;
var bool = [];
var arrayDishId = [];
var arrayComment = [];
var arrayRating = [];
var positionImage = [];

var json = eval("("+localStorage["user"]+")");

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
						'username' : json["username"],
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
						'username' : json["username"],
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
	
	realComment = [];
	arrayComment = [];
	contImage = 0;
}

function showDailyMenu() {
	$("#panelForMenu").toggle();
	
	var posLeft = 5;
	var indPrimo = 1;
	var indSecondo = 1;
	var indContorno = 1;
	$.ajax({
		method : "POST",
		url : 'GetMenuDaily',
		dataType: 'json',
		success : function(data) {
			var responseJson = eval(data);
			if(responseJson != null) {
	            $.each(responseJson, function(key,value) {
	            	var category = eval(value.category);
	            	if (category == "1")
	            	{
	//            		if (indPrimo == 1)
	            			$('#quadMenu').append('<div><p id="categoryDish" style="left:'+(posLeft+10)+'%">Primo</p> </div>');
	//            		else
	//        			{
	//            			$('#panelForMenu').append('<div><p id="nameDish" style="top:100%; left:'+(posLeft+5)+'%">' + value.name + '</p> </div>');
	//        			}
	//            		indPrimo++;
	            	}
	            	else if (category == "2")
	            		$('#quadMenu').append('<div><p id="categoryDish" style="left:'+(posLeft+10)+'%">Secondo</p> </div>');
	            	else if (category == "3")
	            		$('#quadMenu').append('<div><p id="categoryDish" style="left:'+(posLeft+10)+'%">Contorno</p> </div>');
	            	
	            	$('#quadMenu').append('<div><p id="nameDish" style="left:'+(posLeft+5)+'%">' + value.name + '</p> </div>');
	            	$('#quadMenu').append('<div><a id="dish""><img onclick="showComment()" style="left:'+posLeft+'%" src="' + value.image_url + '"/></a> </div>');
	            	
	            	if(value.description != null)
	                	$('#quadMenu').append('<div><p id="descriptionDish" style="left:'+(posLeft)+'%">' + value.description + '</p> </div>');
	            	else
	                	$('#quadMenu').append('<div><p id="descriptionDish" style="left:'+(posLeft)+'%">Descrizione non presente</p> </div>');
	                
	            	$.ajax({
		          		  url: "library.html"
		          		}).done(function(data){
		          			$('#quad').append(data);
	          		});
	            	$('#quadMenu').append(
	        			'<div id=container style="position:absolute; top:85%; left:'+posLeft+'%; "><input class="rating" value="'+value.rating+'" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa" disabled></div>');
	              
	            	posLeft += 30;
	                }
	            );
            }
		}
	});
}


function showChoiseMenu() {
	$("#panelForChooseMenu").toggle();

	var posLeft = 5;
	
	if (json != null) {
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
		            });
				}
			}
		}).done(function() {
		
			for (i = 0; i < arrayDishId.length; i++) {
				$.ajax({
					method : "POST",
					url : 'getRating',
					data : {
						'dishId' : arrayDishId[i],
						'username' : json["username"]
					},
					success : function(data) {
						var resp = eval(data);
						arrayRating.splice(i,1,resp[0]["points"]);
						console.log(resp[0]);
					}
				});
			}
		}).done(function(){
		
			$.ajax({
				method : "POST",
				url : 'GetMenuDaily',
				dataType: 'json',
				success : function(data) {
					var responseJson = eval(data);
					if(responseJson != null) {
			            $.each(responseJson, function(key,value) {
			            	var category = eval(value.category);
			            	if (category == "1")
		            			$('#quad').append('<div><p id="categoryDish" style="left:'+(posLeft+10)+'%">Primo</p> </div>');
			            	else if (category == "2")
			            		$('#quad').append('<div><p id="categoryDish" style="left:'+(posLeft+10)+'%">Secondo</p> </div>');
			            	else if (category == "3")
			            		$('#quad').append('<div><p id="categoryDish" style="left:'+(posLeft+10)+'%">Contorno</p> </div>');
			            	
			            	$('#quad').append('<div><p id="nameDish" style="left:'+(posLeft+5)+'%">' + value.name + '</p> </div>');
			            	$('#quad').append('<div><a id="dish""><img style="left:'+posLeft+'%" onclick="setBorderSelect('+posLeft+","+contImage+')" src="' + value.image_url + '"/></a> </div>');

			            	bool[contImage] = false;
			            	arrayComment.splice(contImage,1,"");
		
			            	$('#quad').append('<div><textarea id="'+(contImage)+'" class="inputCommento" type="text" name="commento" style="left:'+(posLeft+1)+'%" ></textarea></div>')
			            	
			            	$.ajax({
				          		  url: "library.html"
				          		}).done(function(data){
				          			$('#quad').append(data);
			          		});
			            	
			            	if (arrayRating[contImage] == null)
			            		arrayRating.splice(contImage,1,0);
			            	
			            	$('#quad').append(
			        			'<div id="rating'+contImage+'"><div id=container style="position:absolute; top:85%; left:'+(posLeft+2)+'%; "><input id="valueRating'+contImage+'" class="rating" value="'+arrayRating[contImage]+'" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa"></div></div>');
			            	
			            	posLeft += 30;
			            	contImage++;
		                });
		            }
				}
			});
		});
	}
	else
		alert("Esegui il login per scegliere il menù");
}

function showBestDishes(){
	$('#panelForBestDish').toggle();

	$.ajax({
		method : "POST",
		url : 'BestDish',
		data : {
			'category' : "1"
		},
		success : function(data) {
			var resp = eval(data);
			console.log(resp[0]);
			if(resp[0]!= null) {
				$('#quadBestDish').append('<div><p id="categoryDish" style="left:15%">Primo</p> </div>');
	        	
	        	$('#quadBestDish').append('<div><p id="nameDish" style="left:10%">' + resp[0]["name"] + '</p> </div>');
	        	$('#quadBestDish').append('<div><a id="dish""><img style="left:5%" src="' + resp[0]["image_url"] + '"/></a> </div>');
	        	
	        	if(resp[0]["description"] != null)
                	$('#quadBestDish').append('<div><p id="descriptionDish" style="left:5%">' + resp[0]["description"] + '</p> </div>');
            	else
                	$('#quadBestDish').append('<div><p id="descriptionDish" style="left:5%">Descrizione non presente</p> </div>');
                
	        	$.ajax({
	          		  url: "library.html"
	          		}).done(function(data){
	          			$('#quadBestDish').append(data);
          		});
	        	
	        	$('#quadBestDish').append(
        			'<div id=container style="position:absolute; top:85%; left:5%; "><input class="rating" value="'+resp[0]["rating"]+'" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa" disabled></div>');
			}
		}
	});
	
	$.ajax({
		method : "POST",
		url : 'BestDish',
		data : {
			'category' : "2"
		},
		success : function(data) {
			var resp = eval(data);
			console.log(resp[0]);
			if(resp[0]!= null) {
				$('#quadBestDish').append('<div><p id="categoryDish" style="left:45%">Secondo</p> </div>');
	        	
	        	$('#quadBestDish').append('<div><p id="nameDish" style="left:40%">' + resp[0]["name"] + '</p> </div>');
	        	$('#quadBestDish').append('<div><a id="dish""><img style="left:35%" src="' + resp[0]["image_url"] + '"/></a> </div>');
	        	
	        	if(resp[0]["description"] != null)
                	$('#quadBestDish').append('<div><p id="descriptionDish" style="left:35%">' + resp[0]["description"] + '</p> </div>');
            	else
                	$('#quadBestDish').append('<div><p id="descriptionDish" style="left:35%">Descrizione non presente</p> </div>');
                
	        	$.ajax({
	          		  url: "library.html"
	          		}).done(function(data){
	          			$('#quadBestDish').append(data);
          		});
	        	
	        	$('#quadBestDish').append(
        			'<div id=container style="position:absolute; top:85%; left:35%; "><input class="rating" value="'+resp[0]["rating"]+'" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa" disabled></div>');
			}
		}
	});
	
	$.ajax({
		method : "POST",
		url : 'BestDish',
		data : {
			'category' : "3"
		},
		success : function(data) {
			var resp = eval(data);
			console.log(resp[0]);
			if(resp[0]!= null) {
				$('#quadBestDish').append('<div><p id="categoryDish" style="left:75%">Terzo</p> </div>');
	        	
	        	$('#quadBestDish').append('<div><p id="nameDish" style="left:70%">' + resp[0]["name"] + '</p> </div>');
	        	$('#quadBestDish').append('<div><a id="dish""><img style="left:65%" src="' + resp[0]["image_url"] + '"/></a> </div>');
	        	
	        	if(resp[0]["description"] != null)
                	$('#quadBestDish').append('<div><p id="descriptionDish" style="left:65%">' + resp[0]["description"] + '</p> </div>');
            	else
                	$('#quadBestDish').append('<div><p id="descriptionDish" style="left:65%">Descrizione non presente</p> </div>');
                
	        	$.ajax({
	          		  url: "library.html"
	          		}).done(function(data){
	          			$('#quadBestDish').append(data);
          		});
	        	
	        	$('#quadBestDish').append(
        			'<div id=container style="position:absolute; top:85%; left:65%; "><input class="rating" value="'+resp[0]["rating"]+'" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa" disabled></div>');
			}
		}
	});
	
}


function setBorderSelect(pos,cont) {
	console.log(cont);
	if (bool[cont] == false) {
		$('#quad').append('<div id="dishBorder"><a id="dishBorder'+cont+'"><img style="left:'+pos+'%;" onclick="setBorderSelect('+pos+","+cont+')" /></a></div>');
		bool[cont] = true;
	}
	else {
		var id = "#dishBorder"+cont;
		$(id).remove();
		bool[cont] = false;
	}
}

function checkIfThereIsAComment(cont, realComment) {
	
	var isCommented = false;
	
	for (i=0; i<cont; i++) {
		if (document.getElementById(i).value != "") {
			arrayComment.splice(i,1,document.getElementById(i).value);
			isCommented = true;
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



function showComment() {
	
	
}

