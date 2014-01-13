<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en"> 
		
	<head>
		<script src="resources/js/jquery-2.0.3.js"></script>
		<link href="resources/css/bootstrap.min.css" rel="stylesheet" >
		<script src="resources/js/bootstrap.js"></script>
		<link href="resources/css/font-awesome.min.css" rel="stylesheet" >

		<script src="resources/js/json2.js"></script>
	
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=8" />
							
		<tiles:insertAttribute name="title" ignore="true" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Bootstrap -->

		<link href="resources/css/summernote.css" rel="stylesheet" media="screen">
		<script src="resources/js/summernote.js"></script>


	</head>
	
  	<body>
		<!-- The Main wrapper div starts -->
		<div class="container">
	    	<div class="row-fluid">
				<tiles:insertAttribute name="body" ignore="true" />
	    	</div>
		</div>

	</body>
</html>
