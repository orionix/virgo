<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
</head>
<body>
	<form action="" method="POST">
		<div> 	
			<span>ADMIN HELLO! What a wonderful world! !!!</span>
		</div>
	
		<!-- Summernote -->
	 	<div class="summernote container">
	    	<div id="summernote" class="span12"><p>blabla</p></div>
	 	</div>
	 	<button id="send">Send</button>
	 	
	 	<script>
			$(document).ready(function() {
				$('#summernote').summernote();
			});
		</script>
	</form>

	<script>
	    $(function() {
	        $("#send").on("click",function(){
	        	var content = $("#summernote p").text();
	        	var myJSON  = {"message":content, "title":"bla title","messageStatus":"1","messageOrder":"30"}; 
	            myJSON = JSON.stringify(myJSON);
	        
		        $.ajax({
		            url:"/admin",
		            dataType:'JSON',
		            data:myJSON,
		            type:"POST",
		            success:function(data){
		                console.log(data);
		            }
		        });
	    	});
	    });
	</script>
</body>
</html>