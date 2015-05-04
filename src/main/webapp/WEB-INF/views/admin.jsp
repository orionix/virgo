<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page session="false" %>

<!-- Seems I never use it -->
<spring:url value="/admin" var="adminUrl"/> 

<html>
<head>
</head>
<body>
	<!-- Button to trigger modal -->
	<a id="myModalButton" href="#myModal" role="button" class="btn btn-primary btn-large" data-toggle="modal">Add news</a>

	<!-- Modal -->
	<div id="myModal" class="modal modal-add_news hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
		data-backdrop="static" data-keyboard="false" aria-hidden="true">
		<div class="modal-header">
			<h3 id="myModalLabel">Add new post</h3>
		</div>		
		<div class="modal-body">			
			
	 		<form id="newsForm" name="newsForm" class=>
	 			<fieldset>
	 				<div id="newsId" class="notShow"></div>
	 				<label for="messageTitle">Message Title</label>
	 				<input type="text" name="messageTitle" id="messageTitle" />
	 				<br>
	 				
	 				<div id="messageStatus" class="btn-group msgSt" data-toggle="buttons-radio">
					    <button type="button" class="btn btn-primary" data-id="1">Active</button>
					    <button type="button" class="btn btn-primary" data-id="2">Inactive</button>
					    <button type="button" class="btn btn-primary" data-id="3">Draft</button>
					</div>
		 			<div class="summernote container span10">			 				 
		 				<p class="container">
		    				<textarea id="summernote" name="content"></textarea>
						</p>
					</div>
					<div id="incomingDate" class="notShow"></div>
					<div id="changeDate" class="notShow"></div>
					<div id="messageOrder" class="notShow"></div>
				</fieldset>	    		
	    	</form>
	 		
		</div>
		<div class="modal-footer">
			<button id="deleteNews" class="btn btn-danger notShow" data-dismiss="modal" aria-hidden="true">Delete</button>
			<button id="closeNews" class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			<button id="saveNews" class="btn btn-primary">Save changes</button>
			<button id="resetNews" class="btn btn-inverse">Reset</button>
		</div>
	</div>	
		
	 	<br><br><br>
	 	<table class="display dataTable" id="news_table"> 
			<thead> 
				<tr> 
					<th>id</th> 
					<th>incomingDate</th> 
					<th>changeDate</th> 
					<th>title</th>					
					<th>messageStatus</th>
					<th>messageOrder</th>
					<th></th>				
				</tr> 
			</thead>
			<tbody>
				<c:forEach items="${news}" var="news"> 
					<tr>						
						<td id="${news.id}">${news.id}</td>
						<td>${news.incomingDate}</td> 
						<td>${news.changeDate}</td>
						<td>${news.title}</td>						
						<td>
							<c:if test="${news.messageStatus == 1}">Active</c:if>
							<c:if test="${news.messageStatus == 2}">Inactive</c:if>
							<c:if test="${news.messageStatus == 3}">Draft</c:if>
						</td>
						<td class="changeMessageOrder" id="messageOrder${news.id}" data-id="${news.id}">${news.messageOrder}</td>
						<td>
							<a href="#myModal" class="editNews" role="button" data-toggle="modal" data-id="${news.id}">							
								<img src='<c:url value="/resources/img/edit.png" />' ></img>
							</a>
						</td>
	 	 			</tr>
	 	 		</c:forEach> 
			</tbody> 
		</table>

 	<script>
		$( document ).ready( function() {
			
			$( '#summernote' ).summernote({
				codemirror: {
			          theme: 'monokai'
			    }						
			});
			
			$( '#news_table' ).DataTable( {
				"order": [[ 5, "asc" ]],
				"lengthMenu": [5, 10, 20]
			} );
			
		});
	</script>

	<script>		
		// Увеличение поля для ввода новости при фокусировки и уменьшение при исчезновении фокуса
		/*
		$(function() {			
			$( '.note-editable' ).focus(function(e){
				$( this ).height( 300 );
			});
			
			$( '.note-editable' ).blur(function(e){
				$( this ).height( 50 );
			});
		});
		*/
		
		/* Функция отчистки полей формы */
		function erase() {
			$( '#newsForm' ).each( function(){
                this.reset();   	//Here form fields will be cleared.
            });
    		
        	$( 'div#messageStatus button' ).each( function( index ) {
        		$( this ).removeClass( 'active' );      		
			});
    		
            $( '.note-editable' ).html( '' );
		}

		$(function() {
	    	
	    	// Очистка полей формы перед закрытием модального окна
	    	$( '#closeNews' ).on( "click", function(e) {
	    		erase();
	    		$( '#myModalLabel' ).html( 'Add new post' );
	    	});
	    	
	    	// Делаем кнопку Delete невидимой и кнопку Reset видимой
	    	$( '#myModalButton' ).on( "click", function(e) {
	    		$( '#deleteNews' ).addClass( 'notShow' );
	    		// Делаем кнопку Reset невидимой
		    	$( '#resetNews' ).removeClass( 'notShow' );	
	    	});
	    	
	    	// Post реквест.
	        $( '#saveNews' ).on("click",function(e) {	        	
	        	e.preventDefault();
	        	
	        	var id = $( '#newsId' ).text();
	        	var title = $( '#messageTitle' ).val();	        	
	        	var messageStatus;
	        	
	        	$( 'div#messageStatus button.active' ).each( function( index ) {
	        		messageStatus = $( this ).attr( 'data-id' ); 		
				});
	        	
	        	var message = $( '.note-editable' ).html();
	        	
	        	var messageOrder = $( '#messageOrder' ).text();
	        	var incomingDate = $( '#incomingDate' ).text();
	        	//var changeDate = $( '#changeDate' ).text();	Хотел использовать в автоматическом апдейте 
	        	
				//alert("id:" + id + "title:" + title + "message:" + message);
	        	
	        	var myJSON = {id:id, 
	        				  incomingDate:incomingDate,
	        				  message:message, 
	        				  title:title, 
	        				  messageStatus:messageStatus, 
	        				  messageOrder:messageOrder};
	        	
	            myJSON = JSON.stringify( myJSON );
	            
		        $.ajax({
		        	contentType: "application/json",
		            dataType: "json",
		            data: myJSON,
		            type: "POST",
		            
		            beforeSend:function() {
		                $( '#statusMessage' ).html( '<b>Form is being submitted</b>' );
		           	},
		            
		            success:function( response ) {		            	
		                console.log( response );
		            },
		        
		           	complete:function() {		           		
		                $( '#myModal' ).modal( 'hide' );
		                erase();
		                $( '#myModalLabel' ).html( 'Add new post' );
		                
		                /* Автоматический апдейт строки в таблице
		                
		                var tdId = "<td id=" + id + ">" + id + "</td>";
		                var tdIncomingDate = "<td>" + incomingDate + "</td>";
		                var tdChangeDate = "<td>" + changeDate + "</td>";
		                var tdTitle = "<td>" + title + "</td>";
		                var tdMessageStatus = "<td>" + messageStatus + "</td>";		                
		                var tdMessageOrder = "<td class='changeMessageOrder' id=messageOrder" + id + " data-id=" + id + ">" + messageOrder + "</td>";
		                var tdEditButton = "<td><a href='#myModal' class='editNews' role='button' data-toggle='modal' data-id=" + id + "><img src='resources/img/edit.png'></img></a></td>";
		                
		                var newtr = "<tr>" + tdId + tdIncomingDate + tdChangeDate + tdTitle + tdMessageStatus + tdMessageOrder + tdEditButton + "</tr>";
		                $( "td#" + id ).parent().replaceWith( newtr );
		                */
		                window.location = "admin";
		           	}
		        });		        
	    	});
	        
	        // Отчистка формы
	        $( '#resetNews' ).on( "click", function(e) {
	        	//alert("RESET WORKS!");
	        	e.preventDefault();
	        	erase();
	        });
	        
	        // Редактирование новости. Отсылаем id новости на сервер
	        //$( '.editNews' ).click(function(e) {
	        $( 'body' ).on( "click", ".editNews", function(e) {
		       	e.preventDefault();
		       	
		       	// Делаем кнопку Delete видимой
		    	$( '#deleteNews' ).removeClass( 'notShow' );
		       	
		    	// Делаем кнопку Reset невидимой
		    	$( '#resetNews' ).addClass( 'notShow' );
		        
		        var dataId = $( this ).attr( 'data-id' );
		        
		        $.ajax({		        		
			            
			    	type: "GET",
			    	dataType: "json",
		            url: "admin/update/" + dataId,
		            
		            success: function( response ) {		            	
		                console.log( response );
		                
		                $( '#myModalLabel' ).html( "Edit post with id:<span style='color: rgb(255, 0, 0);'>" + response.id + "</span>" );
						
		                $( '#newsId' ).text( response.id );
		                $( '#incomingDate' ).text( response.incomingDate );
		                $( '#changeDate' ).text( response.changeDate );
		                $( '#messageTitle' ).val( response.title );
		                
		                $( 'div#messageStatus button' ).each(function( index ) {
		                	if ( response.messageStatus == index + 1) {
		                		$( this ).addClass( 'active' );
		                	}		            		
		    			});
		        		
		                $( '.note-editable' ).html( response.message );
		                $( '#messageOrder' ).text( response.messageOrder );
		                
		                $( '#myModal' ).modal( 'show' );
		            },
		            complete:function() {
		            }
		       	});
		        
		        return false; //for good measure
		     });
	        
	        // Удаление новости
	        $( '#deleteNews' ).on( "click", function(e) {
	        	if ( confirm( "Do you confirm deletion?" )) {
	        		e.preventDefault();
			        	
			        var dataId = $( '#newsId' ).text();
			        
			        $.ajax({			            
				    	type: "GET",
				    	dataType: "json",
			            url: "admin/delete/" + dataId,
			            
			            success:function( response ) {		            	
			                console.log( response );

			                $( '#myModal' ).modal( 'hide' );
			            },
			        
			        	complete:function() {
			        		window.location = "admin";
			        	}
			       	});

	        	} else {
	        		return false;
	        	}
	        });
	        
	        /* 
	           Валидация messageOrder, если введено некорректное значение, то возвращается предыдущее значение,
	           клетка подсвечивается, сигнализируя, что было введено некорректное значение.
	           Если значение корректно, то оно успешно отсылается на сервер, где обновляет прежнее значение.
	        */
	        //$( 'td.changeMessageOrder' ).click( function() {
	        $( 'body' ).on( "click", "td.changeMessageOrder", function() {
	        	
       	    	var text = $( this ).text();
       	    	
       	    	// Проверка на пустое значение во избежание пустого input
       	    	if ( text !== "" ) {
       	    	
	       	    	var dataId = $( this ).attr( 'data-id' );
	       	    	var messageOrderId = '#' + $( this ).attr( 'id' );
	       	     	var bkGrndColor = $( this ).css( 'background-color' );
	       	     	var fontColor = $( this ).css( 'color' );       	     	
	       	     	
	      	    	$( this ).text( '' );
	      	    	
	       	        $( '<input type="text" class="newValueMessageOrder"/>' ).appendTo( $( this ) ).val( text ).select().blur(function() {

	 	                var newText = $( this ).val();
	 	              	
	 	              	if ( newText !== text ) {
		  	                if ( /^([1-9]\d*)$/.test(newText) ) {
			  	                var messageOrder = "messageOrder=" + newText;
			  	              	//var myJSON = {messageOrder:newText};
			     	        	//myJSON = JSON.stringify( myJSON );
			  	              	$.ajax({
			  		        		//contentType: "application/json",
			  		        		dataType: "json",
							    	type: "GET",
							    	data: messageOrder,				    	
						            url: "admin/updateMessageOrder/" + dataId,
						            
						            success:function( response ) {
						                console.log( response );
						            }
						    	});
		  	                } else {
		  	                	newText = text;
		  	                	
		  	                	// Анимация неправильного значения input
		  	                	$( messageOrderId ).animate( {
		  	                		backgroundColor: "#aa0000",
		  	                		color: "#fff"
		  	                	}, 500);
		  	                	
		  	                	$( messageOrderId ).animate( {
		  	                		backgroundColor: bkGrndColor,
		  	                		color: fontColor
		  	                	}, 500);
		  	               	}
	 	            	}
	 	            
	      	     		// Удаление input
	  	            	$( this ).parent().text( newText ).find( 'input' ).remove();	  	            
	       	    	});       	    
       	    	}
	        });
	        
	        /*
	        $( 'td.changeMessageOrder' ).dblclick( function( e ) {
	        	e.stopPropagation();      //<-------stop the bubbling of the event here
	        	alert("Double click");
	        });
	        */
	        
	    });
	</script>
</body>
</html>