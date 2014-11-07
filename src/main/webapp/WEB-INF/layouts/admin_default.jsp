<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
		
	<head>
		<!-- JQuery -->
		<script src="resources/js/jquery-2.0.3.js"></script>
		<!-- JQuery -->
		
		<!-- Color animation jQuery-plugin -->
		<script src="resources/js/jquery.animate-colors-min.js"></script>
		<!-- Color animation jQuery-plugin -->
		
		<!-- Bootstrap -->
		<link href="resources/css/bootstrap.min.css" rel="stylesheet" >		
		<script src="resources/js/bootstrap.js"></script>
		<link href="resources/css/font-awesome.min.css" rel="stylesheet" >
		<!-- Bootstrap -->
		
		<!-- TableSort -->
		<link href="resources/css/tablesort/blue/style.css" rel="stylesheet" >					
		<script src="resources/js/jquery.tablesorter.js"></script>
		<link href="resources/css/tablesort/pager/pager.css" rel="stylesheet" >
		<script src="resources/js/jquery.tablesorter.pager.js"></script>
		<!-- TableSort -->	

		<script src="resources/js/json2.js"></script>
	
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=8" />
							
		<tiles:insertAttribute name="title" ignore="true" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">		

		<!-- CodeMirror -->
		<link href="resources/codemirror/css/codemirror.css" rel="stylesheet">		
		<script src="resources/codemirror/js/codemirror.js"></script>
		<script src="resources/codemirror/js/xml.js"></script>
		<script src="resources/codemirror/js/formatting.min.js"></script>
		<!-- CodeMirror -->

		<!-- SummerNote -->
		<link href="resources/css/summernote.css" rel="stylesheet" media="screen">
		<script src="resources/js/summernote.js"></script>
		<!-- SummerNote -->
		
		<!-- jEditable -->
		<script src="resources/js/jquery.jeditable.js"></script>			
		<!-- jEditable -->

		<!-- Custom CSS & JS -->
		<link href="resources/css/admin.css" rel="stylesheet" >
		<!-- Custom CSS & JS -->
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
