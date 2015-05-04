<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
		
	<head>
		<!-- JQuery -->
		<script src='<c:url value="/resources/js/jquery-2.0.3.js" />' ></script>
		
		<!-- JQuery -->
		
		<!-- Color animation jQuery-plugin -->
		<script src='<c:url value="/resources/js/jquery.animate-colors-min.js" />' ></script>
		<!-- Color animation jQuery-plugin -->
		
		<!-- Bootstrap -->
		<link href='<c:url value="/resources/css/bootstrap.min.css" />' rel="stylesheet" >		
		<script src='<c:url value="/resources/js/bootstrap.js" />' ></script>
		<link href='<c:url value="/resources/css/font-awesome.min.css" />' rel="stylesheet" >
		<!-- Bootstrap -->
		
		<!-- DataTables -->
		<link href='<c:url value="/resources/css/jquery.dataTables.min.css" />' rel="stylesheet" >
		<script src='<c:url value="/resources/js/jquery.dataTables.min.js" />' ></script>
		<!-- DataTables -->

		<script src='<c:url value="/resources/js/json2.js" />' ></script>
	
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=8" />
							
		<tiles:insertAttribute name="title" ignore="true" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">		

		<!-- CodeMirror -->
		<link href='<c:url value="/resources/codemirror/css/codemirror.css" />' rel="stylesheet">		
		<script src='<c:url value="/resources/codemirror/js/codemirror.js" />' ></script>
		<script src='<c:url value="/resources/codemirror/js/xml.js" />' ></script>
		<script src='<c:url value="/resources/codemirror/js/formatting.min.js" />' ></script>
		<!-- CodeMirror -->

		<!-- SummerNote -->
		<link href='<c:url value="/resources/css/summernote.css" />' rel="stylesheet" media="screen">
		<script src='<c:url value="/resources/js/summernote.js" />' ></script>
		<!-- SummerNote -->
		
		<!-- jEditable -->
		<script src='<c:url value="/resources/js/jquery.jeditable.js" />' ></script>			
		<!-- jEditable -->

		<!-- Custom CSS & JS -->
		<link href='<c:url value="/resources/css/admin.css" />' rel="stylesheet" >
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
