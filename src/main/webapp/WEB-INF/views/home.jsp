<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
		<h1>Hey Boys!</h1>

		<p>  The time on the server is ${serverTime}. </p>

		<table>
			<c:forEach items="${array}" varStatus="loop"> 
				<tr> 
					<td>[${loop.index}]: ${array[loop.index]}</td> 
				</tr> 
			</c:forEach> 
		</table>

		<!-- Marketing area -->
        <div class="hero-unit">
        	<h1>Marketing stuff!</h1>
        	<p >Cras justo odio, dapibus ac facilisis in, egestas eget quam. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
        	<a href="#" class="btn btn-large btn-success">Get Started</a>
        </div>
