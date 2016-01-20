<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
       pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/fileChooser.css">

<div class="form2">
	<div class="closeButton"><img onclick="removePanelImage()" src="images/closeButton.png"></div>

	<form method="post" action="UploadServlet" enctype="multipart/form-data">
<!-- 	Select file to upload: -->
	<input type="file" name="dataFile" id="fileChooser"/><br/><br/>
	<input type="submit" value="Upload" />
	</form>
</div>


<script type="text/javascript">

	function removePanelImage(){
		$('.form2').remove();
	}
</script>

