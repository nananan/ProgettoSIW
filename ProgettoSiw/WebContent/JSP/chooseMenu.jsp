 <%@page import="org.json.JSONArray,org.json.JSONException,org.json.JSONObject,project.*, java.text.*,java.util.*,project.beans.*,com.fasterxml.jackson.databind.*"%>
 
<link rel="stylesheet"  href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="css/mensaCR.css">
<script src="Javascript/star-rating.js" type="text/javascript"></script>
 
<% 
User user = (User) session.getAttribute("user");

ArrayList<String> dishId = new ArrayList<String>();
ArrayList<Boolean> isSelected = new ArrayList<Boolean>();

String dishesId = JsonDBManager.getInstance().getDishesId();
JsonNode arrDishId = new ObjectMapper().readTree(dishesId);
int i = 0;
if (arrDishId.isArray()) {
	for (final JsonNode objNode : arrDishId)
		dishId.add(i++, objNode.get("id").asText());
}
%>
 

<%
	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	Date date = new Date();
	
	int posPrimo = 5, posSecondo = 35, posContorno = 65;
	int posTopPrimo = 0, posTopSecondo = 0, posTopContorno = 0;
	int countPrimo = 1, countSecondo = 1, countContorno = 1;
	int contImage = 0;
	
	String dailyMenu = JsonDBManager.getInstance().getMenuDaily(dateFormat.format(date));
	JsonNode arrNode = new ObjectMapper().readTree(dailyMenu);
	if (arrNode.isArray())
	{
		for (final JsonNode objNode : arrNode)
		{ 
			String pointRating = JsonDBManager.getInstance().getRating(Integer.parseInt(objNode.get("id").asText()), user.getUsername());
			JsonNode arrNodeRating = new ObjectMapper().readTree(pointRating);
			if (arrNodeRating.isArray())
			{
				for (final JsonNode objNodeRating : arrNodeRating)
				{ 
				
			if (objNode.get("category").asText().equals("1")) {
				
%>
			<div id="dishPrimo">
					<p id="categoryDish" style="top:<%=posTopPrimo%>%; left:<%=posPrimo+10%>%">Primo</p>
					<p id="nameDish" style="top:<%=posTopPrimo+5%>%; left:<%=posPrimo+5%>%"><%=objNode.get("name").asText()%></p>
					<a id="dish" class="dish<%=contImage%>">
						<img onclick="setBorderSelect(<%=posTopPrimo+15%>,<%=posPrimo%>,<%=contImage%>,<%=objNode.get("category").asText()%>)" style=" top:<%=posTopPrimo+15%>%; left:<%=posPrimo%>%" src="<%=objNode.get("image_url").asText()%>"/>
					</a>
		            	
	           		<textarea id="<%=contImage%>" class="inputCommento" type="text" name="commento" style="top:<%=posTopPrimo+60%>%; left:<%=posPrimo+1%>%" ></textarea>
				
				<!-- <script>
					checkDishSelected();
				</script> -->
				<div id="rating<%=contImage%>">
		  			<div id=container style="position:absolute; top:<%=posTopPrimo+85%>%; left:<%=posPrimo%>%">
		  				<input id="valueRating<%=contImage%>" class="rating" value="<%=objNodeRating.get("points")%>" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa">
					</div>
				</div>
			</div>
<%			
				countPrimo++;
				posTopPrimo += 100;
			}
			else if (objNode.get("category").asText().equals("2")) {
%>

			<div id="dishSecondo">
					<p id="categoryDish" style="top:<%=posTopSecondo%>%; left:<%=posSecondo+10%>%">Secondo</p>
		            	
					<p id="nameDish" style="top:<%=posTopSecondo+5%>%; left:<%=posSecondo+5%>%"><%=objNode.get("name").asText()%></p>
					<a id="dish"">
						<img onclick="setBorderSelect(<%=posTopSecondo+15%>,<%=posSecondo%>,<%=contImage%>,<%=objNode.get("category").asText()%>)" style="top:<%=posTopSecondo+15%>%; left:<%=posSecondo%>%" src="<%=objNode.get("image_url").asText()%>"/>
					</a>
		            	
	           		<textarea id="<%=contImage%>" class="inputCommento" type="text" name="commento" style="top:<%=posTopSecondo+60%>%; left:<%=posSecondo+1%>%" ></textarea>
				
				<div id="rating<%=contImage%>">
		  			<div id=container style="position:absolute; top:<%=posTopSecondo+85%>%; left:<%=posSecondo%>%">
		  				<input id="valueRating<%=contImage%>" class="rating" value="<%=objNodeRating.get("points")%>" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa">
					</div>
				</div>
			</div>
<%
				countSecondo++;
				posTopSecondo += 100;
			}
			else if (objNode.get("category").asText().equals("3")) {
%>
			<div id="dishContorno">
					<p id="categoryDish" style="top:<%=posTopContorno%>%; left:<%=posContorno+10%>%">Contorno</p>
		            	
					<p id="nameDish" style="top:<%=posTopContorno+5%>%; left:<%=posContorno+5%>%"><%=objNode.get("name").asText()%></p>
					<a id="dish"">
						<img onclick="setBorderSelect(<%=posTopContorno+15%>,<%=posContorno%>,<%=contImage%>,<%=objNode.get("category").asText()%>)" style="top:<%=posTopContorno+15%>%; left:<%=posContorno%>%" src="<%=objNode.get("image_url").asText()%>"/>
					</a>
		            	
	           		<textarea id="<%=contImage%>" class="inputCommento" type="text" name="commento" style="top:<%=posTopContorno+60%>%; left:<%=posContorno+1%>%" ></textarea>
				
				<div id="rating<%=contImage%>">
		  			<div id=container style="position:absolute; top:<%=posTopContorno+85%>%;  left:<%=posContorno%>%">
		  				<input id="valueRating<%=contImage%>" class="rating" value="<%=objNodeRating.get("points")%>" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa">
					</div>	
				</div>
			</div>
<%				
						countContorno++;
						posTopContorno += 100;
					}
				}
			}
			contImage++;
		}
	}
%>


<!-- <script>
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
</script> -->
