<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>  
		
	<head>
		<script src="resources/js/jquery-2.0.3.js"></script>
		<script src="resources/js/bootstrap.js"></script>
	
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=8" />
							
		<tiles:insertAttribute name="title" ignore="true" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Bootstrap -->
		<link href="resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="resources/css/virgo.css" rel="stylesheet" media="screen">

	</head>
	
  	<body>
		<!-- The Main wrapper div starts -->
		<div class="container">
	    	<div class="row-fluid">
    			<div class="span2"></div>
		    	<div class="span8">
					<tiles:insertAttribute name="header" ignore="true" />
					<tiles:insertAttribute name="menu" ignore="true" />
					<tiles:insertAttribute name="body" ignore="true" />
					<tiles:insertAttribute name="footer" ignore="true" />
				</div>
		    	<div class="span2"></div>
	    	</div>
		</div>

	</body>
</html>
