 <%@page import="project.*, java.text.*,java.util.*,project.beans.*,com.fasterxml.jackson.databind.*"%>
 
<link rel="stylesheet"  href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
<!-- <link rel="stylesheet" type="text/css" href="css/mensaCR.css"> -->
<script src="Javascript/star-rating.js" type="text/javascript"></script>

<%
	String bestDishFirst = JsonDBManager.getInstance().bestDish("1");
	JsonNode arrNodeFirst = new ObjectMapper().readTree(bestDishFirst);
	
	int somm = 33;
	int posPrimo = 5;
	int posTop = 0;
	
	if (arrNodeFirst.isArray()) {
%>
		<div id="dishPrimo" style="text-align:center;">
				<div>
					<a id="dishMenu">
						<img style=" top:<%=posTop%>%; left:<%=posPrimo%>%" src="<%=arrNodeFirst.get(0).get("image_url").asText()%>"/>
					</a>
				</div>
				<div>
					<p id="categoryDish" style="top:<%=posTop%>%; left:<%=posPrimo+somm%>%">Primo</p>
				</div>
				<div>
					<p id="nameDish" style="top:<%=posTop+2%>%; left:<%=posPrimo+somm%>%"><%=arrNodeFirst.get(0).get("name").asText()%></p>
				</div>
		            	
	           	<% if(!arrNodeFirst.get(0).get("description").asText().equals("null")) { %>
	            	<div>
	            		<p id="descriptionDish" style="top:<%=posTop+5%>%; left:<%=posPrimo+somm%>%"><%=arrNodeFirst.get(0).get("description").asText()%></p>
	           		</div>
	           	<% } else { %>
		            <div>
		            	<p id="descriptionDish" style="top:<%=posTop+5%>%; left:<%=posPrimo+somm%>%">Descrizione non presente</p>
	            	</div>
				<% } %>
				
	  			<div id=container style="position: absolute; top:<%=posTop+23%>%; left:<%=posPrimo+somm%>%">
	  				<input class="rating" value="<%=arrNodeFirst.get(0).get("rating")%>" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa" disabled>
				</div>
				
				<hr id="lineBottom" style="top:<%=posTop+29%>%;" class="hr"></hr>
	         </div>

<%			
	}

	posTop += 33;
	
	String bestDishSecond = JsonDBManager.getInstance().bestDish("2");
	JsonNode arrNodeSecond = new ObjectMapper().readTree(bestDishSecond);
	if (arrNodeSecond.isArray())
	{
%>
		<div id="dishSecondo" style="text-align:center;">
			<div>
				<a id="dishMenu">
					<img style=" top:<%=posTop%>%; left:<%=posPrimo%>%" src="<%=arrNodeSecond.get(0).get("image_url").asText()%>"/>
				</a>
			</div>
			<div>
				<p id="categoryDish" style="top:<%=posTop%>%; left:<%=posPrimo+somm%>%">Secondo</p>
			</div>
			<div>
				<p id="nameDish" style="top:<%=posTop+2%>%; left:<%=posPrimo+somm%>%"><%=arrNodeSecond.get(0).get("name").asText()%></p>
			</div>
	            	
           	<% if(!arrNodeSecond.get(0).get("description").asText().equals("null")) { %>
            	<div>
            		<p id="descriptionDish" style="top:<%=posTop+5%>%; left:<%=posPrimo+somm%>%"><%=arrNodeSecond.get(0).get("description").asText()%></p>
           		</div>
           	<% } else { %>
	            <div>
	            	<p id="descriptionDish" style="top:<%=posTop+5%>%; left:<%=posPrimo+somm%>%">Descrizione non presente</p>
            	</div>
			<% } %>
			
  			<div id=container style="position: absolute; top:<%=posTop+23%>%; left:<%=posPrimo+somm%>%">
  				<input class="rating" value="<%=arrNodeSecond.get(0).get("rating")%>" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa" disabled>
			</div>
			
			<hr id="lineBottom" style="top:<%=posTop+29%>%;" class="hr"></hr>
         </div>

<%			
	}			

	posTop += 33;
	
	String bestDishThirt = JsonDBManager.getInstance().bestDish("3");
	JsonNode arrNodeThirt = new ObjectMapper().readTree(bestDishThirt);
	if (arrNodeThirt.isArray())
	{
%>
		<div id="dishContorno" style="text-align:center;">
			<div>
				<a id="dishMenu">
					<img style=" top:<%=posTop%>%; left:<%=posPrimo%>%" src="<%=arrNodeThirt.get(0).get("image_url").asText()%>"/>
				</a>
			</div>
			<div>
				<p id="categoryDish" style="top:<%=posTop%>%; left:<%=posPrimo+somm%>%">Contorno</p>
			</div>
			<div>
				<p id="nameDish" style="top:<%=posTop+2%>%; left:<%=posPrimo+somm%>%"><%=arrNodeThirt.get(0).get("name").asText()%></p>
			</div>
	            	
           	<% if(!arrNodeThirt.get(0).get("description").asText().equals("null")) { %>
            	<div>
            		<p id="descriptionDish" style="top:<%=posTop+5%>%; left:<%=posPrimo+somm%>%"><%=arrNodeSecond.get(0).get("description").asText()%></p>
           		</div>
           	<% } else { %>
	            <div>
	            	<p id="descriptionDish" style="top:<%=posTop+5%>%; left:<%=posPrimo+somm%>%">Descrizione non presente</p>
            	</div>
			<% } %>
			
  			<div id=container style="position: absolute; top:<%=posTop+23%>%; left:<%=posPrimo+somm%>%">
  				<input class="rating" value="<%=arrNodeThirt.get(0).get("rating")%>" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa" disabled>
			</div>
			
			<hr id="lineBottom" style="top:<%=posTop+29%>%;" class="hr"></hr>
         </div>
<%			
	}
%>
	