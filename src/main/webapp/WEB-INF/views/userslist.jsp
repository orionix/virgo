<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page session="false" %>

<spring:url value="/admin/users" var="adminUsersUrl"/> 

<html>

<head>
	<script>
		$( document ).ready( function() {
			
			$( '#users_table' ).DataTable( {
				"order": [[ 0, "asc" ]],
				"lengthMenu": [5, 10, 20]
			});
			
		});
	</script>
</head>

<body>
 	<table class="display dataTable" id="users_table"> 
		<thead> 
			<tr> 
				<th>User Id</th>
				<th>User Name</th>
				<th>User1</th>
				<th>User2</th>
				<th>User3</th>
			</tr> 
		</thead>
		<tbody>
			<c:forEach items="${users}" var="users"> 
				<tr>						
					<td id="${users.userId}">${users.userId}</td>
					<td>${users.userName}</td>
					<td>1</td>
					<td>2</td>
					<td>3</td>
 	 			</tr>
 	 		</c:forEach> 
		</tbody> 
	</table>		

 	
</body>
</html>