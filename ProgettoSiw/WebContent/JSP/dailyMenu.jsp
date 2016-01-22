 <%@page import="project.*, java.text.*,java.util.*,project.beans.*,com.fasterxml.jackson.databind.*"%>
 
<link rel="stylesheet"  href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="css/mensaCR.css">
<script src="Javascript/star-rating.js" type="text/javascript"></script>
 
<%
	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	Date date = new Date();
	
	int posPrimo = 5, posSecondo = 35, posContorno = 65;
	int posTopPrimo = 0, posTopSecondo = 0, posTopContorno = 0;
	int countPrimo = 1, countSecondo = 1, countContorno = 1;
	
	String dailyMenu = JsonDBManager.getInstance().getMenuDaily(dateFormat.format(date));
	JsonNode arrNode = new ObjectMapper().readTree(dailyMenu);
	if (arrNode.isArray())
	{
		for (final JsonNode objNode : arrNode)
		{ 
			if (objNode.get("category").asText().equals("1")) {
%>
			<div id="dishPrimo" style="text-align:center;">
				<div>
					<p id="categoryDish" style="top:<%=posTopPrimo%>%; left:<%=posPrimo+10%>%">Primo</p>
				</div>
				<div>
					<p id="nameDish" style="top:<%=posTopPrimo+5%>%; left:<%=posPrimo+5%>%"><%=objNode.get("name").asText()%></p>
				</div>
				<div>
					<a id="dishMenu">
						<img onclick="showComment(<%=objNode.get("id").asText()%>)" style=" top:<%=posTopPrimo+15%>%; left:<%=posPrimo%>%" src="<%=objNode.get("image_url").asText()%>"/>
					</a>
				</div>
		            	
	           	<% if(!objNode.get("description").asText().equals("null")) { %>
	            	<div>
	            		<p id="descriptionDish" style="top:<%=posTopPrimo+60%>%; left:<%=posPrimo%>%"><%=objNode.get("description").asText()%></p>
	           		</div>
	           	<% } else { %>
		            <div>
		            	<p id="descriptionDish" style="top:<%=posTopPrimo+60%>%; left:<%=posPrimo%>%">Descrizione non presente</p>
	            	</div>
				<% } %>
				
	  			<div id=container style="position:absolute; top:<%=posTopPrimo+85%>%; left:<%=posPrimo%>%">
	  				<input class="rating" value="<%=objNode.get("rating")%>" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa" disabled>
				</div>
	         </div>   	
			
<%			
				countPrimo++;
				posTopPrimo += 100;
			}
			else if (objNode.get("category").asText().equals("2")) {
%>
			<div id="dishSecondo" style="text-align:center;">
				<div>
					<p id="categoryDish" style="top:<%=posTopSecondo%>%; left:<%=posSecondo+10%>%">Secondo</p>
				</div>
		            	
				<div>
					<p id="nameDish" style="top:<%=posTopSecondo+5%>%; left:<%=posSecondo+5%>%"><%=objNode.get("name").asText()%></p>
				</div>
				<div>
					<a id="dishMenu">
						<img onclick="showComment(<%=objNode.get("id").asText()%>)" style="top:<%=posTopSecondo+15%>%; left:<%=posSecondo%>%" src="<%=objNode.get("image_url").asText()%>"/>
					</a>
				</div>
		            	
	           	<% if(!objNode.get("description").asText().equals("null")) { %>
	            	<div>
	            		<p id="descriptionDish" style="top:<%=posTopSecondo+60%>%; left:<%=posSecondo%>%"><%=objNode.get("description").asText()%></p>
	           		</div>
	           	<% } else { %>
		            <div>
		            	<p id="descriptionDish" style="top:<%=posTopSecondo+60%>%; left:<%=posSecondo%>%">Descrizione non presente</p>
	            	</div>
				<% } %>
				
	  			<div id=container style="position:absolute; top:<%=posTopSecondo+85%>%; left:<%=posSecondo%>%">
	  				<input class="rating" value="<%=objNode.get("rating")%>" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa" disabled>
				</div>
			</div>
<%
				countSecondo++;
				posTopSecondo += 100;
			}
			else if (objNode.get("category").asText().equals("3")) {
%>
			<div id="dishContorno">
				<div>
					<p id="categoryDish" style="top:<%=posTopContorno%>%; left:<%=posContorno+10%>%">Contorno</p>
				</div>
		            	
				<div>
					<p id="nameDish" style="top:<%=posTopContorno+5%>%; left:<%=posContorno+5%>%"><%=objNode.get("name").asText()%></p>
				</div>
				<div>
					<a id="dishMenu">
						<img onclick="showComment(<%=objNode.get("id").asText()%>)" style="top:<%=posTopContorno+15%>%; left:<%=posContorno%>%" src="<%=objNode.get("image_url").asText()%>"/>
					</a>
				</div>
		            	
	           	<% if(!objNode.get("description").asText().equals("null")) { %>
	            	<div>
	            		<p id="descriptionDish" style="top:<%=posTopContorno+60%>%; left:<%=posContorno%>%"><%=objNode.get("description").asText()%></p>
	           		</div>
	           	<% } else { %>
		            <div>
		            	<p id="descriptionDish" style="top:<%=posTopContorno+60%>%; left:<%=posContorno%>%">Descrizione non presente</p>
	            	</div>
				<% } %>
				
	  			<div id=container style="position:absolute; top:<%=posTopContorno+85%>%;  left:<%=posContorno%>%">
	  				<input class="rating" value="<%=objNode.get("rating")%>" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa" disabled>
				</div>	
			</div>
<%
				countContorno++;
				posTopContorno += 100;
			}
		}
	}
%>