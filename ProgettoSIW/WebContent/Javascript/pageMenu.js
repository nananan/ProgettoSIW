 
function deletePanelMenu() {
	$("#panelForMenu").toggle();
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
            			$('#panelForMenu').append('<div><p id="categoryDish" style="left:'+(posLeft+10)+'%">Primo</p> </div>');
//            		else
//        			{
//            			$('#panelForMenu').append('<div><p id="nameDish" style="top:100%; left:'+(posLeft+5)+'%">' + value.name + '</p> </div>');
//        			}
//            		indPrimo++;
            	}
            	else if (category == "2")
            		$('#panelForMenu').append('<div><p id="categoryDish" style="left:'+(posLeft+10)+'%">Secondo</p> </div>');
            	else if (category == "3")
            		$('#panelForMenu').append('<div><p id="categoryDish" style="left:'+(posLeft+10)+'%">Contorno</p> </div>');
            	
            	$('#panelForMenu').append('<div><p id="nameDish" style="left:'+(posLeft+5)+'%">' + value.name + '</p> </div>');
            	$('#panelForMenu').append('<div><a id="dish""><img style="left:'+posLeft+'%" src="' + value.image_url + '"/></a> </div>');
            	
            	if(value.description != null)
                	$('#panelForMenu').append('<div><p id="descriptionDish" style="left:'+(posLeft)+'%">' + value.description + '</p> </div>');
            	else
                	$('#panelForMenu').append('<div><p id="descriptionDish" style="left:'+(posLeft)+'%">Descrizione non presente</p> </div>');
                
            	$.ajax({
	          		  url: "library.html"
	          		}).done(function(data){
	          			$('#panelForMenu').append(data);
          		});
            	$('#panelForMenu').append(
        			'<div id=container style="position:absolute; top:90%; left:'+posLeft+'%; "><input class="rating" value="'+value.rating+'" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa" disabled></div>');
              
            	posLeft += 30;
                });
            }
		}
	});
}