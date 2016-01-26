 <%@page import="project.*, java.text.*,java.util.*,project.beans.*,com.fasterxml.jackson.databind.*"%>
 
<link rel="stylesheet"  href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
<script src="Javascript/star-rating.js" type="text/javascript"></script>
 
<%
	DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	Date date = new Date();
	
	int somm = 33;
	int posPrimo = 5;
	int posTop = 0;
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
					<a id="dishMenu">
						<img onclick="showComment(<%=objNode.get("id").asText()%>)" style=" top:<%=posTop%>%; left:<%=posPrimo%>%" src="<%=objNode.get("image_url").asText()%>"/>
					</a>
				</div>
				<div>
					<p id="categoryDish" style="top:<%=posTop%>%; left:<%=posPrimo+somm%>%">Primo</p>
				</div>
				<div>
					<p id="nameDish" style="top:<%=posTop+2%>%; left:<%=posPrimo+somm%>%"><%=objNode.get("name").asText()%></p>
				</div>
		            	
	           	<% if(!objNode.get("description").asText().equals("null")) { %>
	            	<div>
	            		<p id="descriptionDish" style="top:<%=posTop+5%>%; left:<%=posPrimo+somm%>%"><%=objNode.get("description").asText()%></p>
	           		</div>
	           	<% } else { %>
		            <div>
		            	<p id="descriptionDish" style="top:<%=posTop+5%>%; left:<%=posPrimo+somm%>%">Descrizione non presente</p>
	            	</div>
				<% } %>
				
	  			<div id=container style="position: absolute; top:<%=posTop+23%>%; left:<%=posPrimo+somm%>%">
	  				<input class="rating" value="<%=objNode.get("rating")%>" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa" disabled>
				</div>
				
				<hr id="lineBottom" style="top:<%=posTop+29%>%;" class="hr"></hr>
	         </div>   	
<%			
				countPrimo++;
				posTop += 33;
			}
			else if (objNode.get("category").asText().equals("2")) {
%>
			<div id="dishSecondo" style="text-align:center;">
				<div>
					<a id="dishMenu">
						<img onclick="showComment(<%=objNode.get("id").asText()%>)" style=" top:<%=posTop%>%; left:<%=posPrimo%>%" src="<%=objNode.get("image_url").asText()%>"/>
					</a>
				</div>
				<div>
					<p id="categoryDish" style="top:<%=posTop%>%; left:<%=posPrimo+somm%>%">Secondo</p>
				</div>
				<div>
					<p id="nameDish" style="top:<%=posTop+2%>%; left:<%=posPrimo+somm%>%"><%=objNode.get("name").asText()%></p>
				</div>
		            	
	           	<% if(!objNode.get("description").asText().equals("null")) { %>
	            	<div>
	            		<p id="descriptionDish" style="top:<%=posTop+5%>%; left:<%=posPrimo+somm%>%"><%=objNode.get("description").asText()%></p>
	           		</div>
	           	<% } else { %>
		            <div>
		            	<p id="descriptionDish" style="top:<%=posTop+5%>%; left:<%=posPrimo+somm%>%">Descrizione non presente</p>
	            	</div>
				<% } %>
				
	  			<div id=container style="position: absolute; top:<%=posTop+23%>%; left:<%=posPrimo+somm%>%">
	  				<input class="rating" value="<%=objNode.get("rating")%>" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa" disabled>
				</div>
				
				<hr id="lineBottom" style="top:<%=posTop+29%>%;" class="hr"></hr>
	         </div>
<%
				countSecondo++;
				posTop += 33;
			}
			else if (objNode.get("category").asText().equals("3")) {
%>
				<div id="dishContorno" style="text-align:center;">
				<div>
					<a id="dishMenu">
						<img onclick="showComment(<%=objNode.get("id").asText()%>)" style=" top:<%=posTop%>%; left:<%=posPrimo%>%" src="<%=objNode.get("image_url").asText()%>"/>
					</a>
				</div>
				<div>
					<p id="categoryDish" style="top:<%=posTop%>%; left:<%=posPrimo+somm%>%">Contorno</p>
				</div>
				<div>
					<p id="nameDish" style="top:<%=posTop+2%>%; left:<%=posPrimo+somm%>%"><%=objNode.get("name").asText()%></p>
				</div>
		            	
	           	<% if(!objNode.get("description").asText().equals("null")) { %>
	            	<div>
	            		<p id="descriptionDish" style="top:<%=posTop+5%>%; left:<%=posPrimo+somm%>%"><%=objNode.get("description").asText()%></p>
	           		</div>
	           	<% } else { %>
		            <div>
		            	<p id="descriptionDish" style="top:<%=posTop+5%>%; left:<%=posPrimo+somm%>%">Descrizione non presente</p>
	            	</div>
				<% } %>
				
	  			<div id=container style="position: absolute; top:<%=posTop+23%>%; left:<%=posPrimo+somm%>%">
	  				<input class="rating" value="<%=objNode.get("rating")%>" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa" disabled>
				</div>
				
				<hr id="lineBottom" style="top:<%=posTop+29%>%;" class="hr"></hr>
	         </div>
<%
				countContorno++;
				posTop += 33;
			}
		}
	}
%>