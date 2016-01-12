 <%@page import="project.*, java.text.*,java.util.*,project.beans.*,com.fasterxml.jackson.databind.*"%>
 
<link rel="stylesheet"  href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="css/mensaCR.css">
<script src="Javascript/star-rating.js" type="text/javascript"></script>

<%
	String bestDishFirst = JsonDBManager.getInstance().bestDish("1");
	JsonNode arrNodeFirst = new ObjectMapper().readTree(bestDishFirst);
	
	if (arrNodeFirst.isArray()) {
%>
		<div>
			<p id="categoryDish" style="left:15%">Primo</p> 
		</div>
        <div>
        	<p id="nameDish" style="left:10%"><%=arrNodeFirst.get(0).get("name").asText()%></p> 
       	</div>
		<div>
			<a id="dish"><img style="left:5%" src="<%=arrNodeFirst.get(0).get("image_url").asText()%>"/></a>
		 </div>

       	<% if(!arrNodeFirst.get(0).get("description").asText().equals("null")) {	%>
          	<div><p id="descriptionDish" style="left:5%"><%=arrNodeFirst.get(0).get("description").asText()%></p> </div>
       	<% } else { %>
           <div><p id="descriptionDish" style="left:5%">Descrizione non presente</p> </div>
		<% } %>
		<div id=container style="position:absolute; top:85%; left:5%; ">
			<input class="rating" value="<%=arrNodeFirst.get(0).get("rating")%>" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa" disabled>
		</div>

<%			
	}

	String bestDishSecond = JsonDBManager.getInstance().bestDish("2");
	JsonNode arrNodeSecond = new ObjectMapper().readTree(bestDishSecond);
	if (arrNodeSecond.isArray())
	{
%>
			<div>
				<p id="categoryDish" style="left:45%">Secondo</p> 
			</div>
	        <div>
	        	<p id="nameDish" style="left:40%"><%=arrNodeSecond.get(0).get("name").asText()%></p> 
        	</div>
			<div>
				<a id="dish"><img style="left:35%" src="<%=arrNodeSecond.get(0).get("image_url").asText()%>"/></a>
			 </div>

	       	<% if(!arrNodeSecond.get(0).get("description").asText().equals("null")) {	%>
            	<div><p id="descriptionDish" style="left:35%"><%=arrNodeSecond.get(0).get("description").asText()%></p> </div>
           	<% } else { %>
	            <div><p id="descriptionDish" style="left:35%">Descrizione non presente</p> </div>
			<% } %>
  			<div id=container style="position:absolute; top:85%; left:35%; ">
  				<input class="rating" value="<%=arrNodeSecond.get(0).get("rating")%>" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa" disabled>
			</div>
		

<%			
	}			

	String bestDishThirt = JsonDBManager.getInstance().bestDish("3");
	JsonNode arrNodeThirt = new ObjectMapper().readTree(bestDishThirt);
	if (arrNodeThirt.isArray())
	{
%>
			<div>
				<p id="categoryDish" style="left:75%">Contorno</p> 
			</div>
	        <div>
	        	<p id="nameDish" style="left:70%"><%=arrNodeThirt.get(0).get("name").asText()%></p> 
        	</div>
			<div>
				<a id="dish"><img style="left:65%" src="<%=arrNodeThirt.get(0).get("image_url").asText()%>"/></a>
			 </div>

	       	<% if(!arrNodeThirt.get(0).get("description").asText().equals("null")) { %>
            	<div><p id="descriptionDish" style="left:65%"><%=arrNodeThirt.get(0).get("description").asText()%></p> </div>
           	<% } else { %>
	            <div><p id="descriptionDish" style="left:65%">Descrizione non presente</p> </div>
			<% } %>
  			<div id=container style="position:absolute; top:85%; left:65%; ">
  				<input class="rating" value="<%=arrNodeThirt.get(0).get("rating")%>" min="0" max="5" data-size="sm" data-symbol="&#xf005;" data-glyphicon="false" data-rating-class="rating-fa" disabled>
			</div>
		

<%			
	}
%>
	