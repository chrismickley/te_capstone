<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- %-- <c:import url="/WEB-INF/jsp/common/header.jsp" /> --%> 
<link rel="stylesheet" href="css/siteToo.css" />


</head>
<body>

	<div class = "titleBar">
		<header>
		
				<h1 id="headerTitle">Code Catalog</h1>
		</header>
</div>

<div class = "navBar">
	<nav>

		
				<a id= "testing" href="landing">Home</a>
			
			<!-- 			<div>
				<li><a href="landing">Code Samples</a></li>
			</div> -->
			
				<a id= "testing" href="detail">Detail Page</a>
			


			<c:if test="${currentUser.userName != null}">
					<a id= "testing" href="addSnippet">Add Code Snippet</a>
					</c:if>
					<c:if test="${currentUser.userName != null}">
				
					<a id= "testing" href="editSnippet">Edit Code Snippet</a>
				
			</c:if>
			
		
			
		
			
				<c:if test="${currentUser.userName == null}">
					<a id= "testing2" href="register">Register</a>
			
			

				<a id= "testing2"href="login">Login</a>

			</c:if>
		

		<c:if test="${currentUser.userName != null}">
			
				<span id="welcome">Welcome, ${currentUser.userName}</span>
			
		</c:if>


		
			<c:if test="${currentUser.userName != null}">
				<c:url var="formAction" value="/logout" />
				<span><form method="POST" action="${formAction}">
					<input type="hidden" name="destination"
						value="${param.destination}" />
					<button class ="logoutButton" type="Logout">Logout</button> 
				</form></span>
			</c:if>
		

</nav>	
</div>	

