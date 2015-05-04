<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>  
		
	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=8" />
							
	<title>HELLO WORLD!!!</title>
	</head>
	
  	<body>
		<table border="1" cellpadding="2" cellspacing="2" align="center" width="650">
			<tr>
        		<td height="200">
					<tiles:insertAttribute name="header" ignore="true" />
		        </td>
    		</tr>
			<tr>
        		<td height="40">
					<tiles:insertAttribute name="menu" ignore="true" />
		        </td>
    		</tr>						
    		<tr>
        		<td height="400">
					<tiles:insertAttribute name="body" ignore="true" />
				</td>
    		</tr>
		    <tr>
        		<td height="40">
					<tiles:insertAttribute name="footer" ignore="true" />
		        </td>
		    </tr>
		</table>
	</body>
</html>
