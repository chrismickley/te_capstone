<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title></title>
<link rel="stylesheet" href="css/site.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Ubuntu">

</head>
<body>

	<div class="headerimage">
		<header>
			<div>
				<h1 id="headerTitle">Code Catalog</h1>

			</div>



		</header>
	</div>

	<nav>

		<div class="nav-flex-container">
			<div>
				<li><a href="landing">Home</a></li>
			</div>
			<!-- 			<div>
				<li><a href="landing">Code Samples</a></li>
			</div> -->
			<div>
				<li><a href="detail">Detail Page</a></li>
			</div>


			<c:if test="${currentUser.userName != null}">
				<div>
					<li><a href="addSnippet">Add Code Snippet</a></li>
				</div>
				<div>
					<li><a href="editSnippet">Edit Code Snippet</a></li>
				</div>
			</c:if>
			</div>
</nav>
			<div id="userfunctions">
				<c:if test="${currentUser.userName == null}">
					<li><a href="register">Register</a></li>
			
			

				<li><a href="login">Login</a></li>

			</c:if>
		

		<c:if test="${currentUser.userName != null}">
			
					<li id="welcome">Welcome ${currentUser.userName}</li>
			
		</c:if>


		
			<c:if test="${currentUser.userName != null}">
				<c:url var="formAction" value="/logout" />
				<form method="POST" action="${formAction}">
					<input type="hidden" name="destination"
						value="${param.destination}" />
					<button type="Logout">Logout</button>
				</form>
			</c:if>
		</div>
		


	







	<%-- 	<div class="nav-flex-container">
<div>
<li><a href="home">Home</a></li>
</div>
<div>
<li><a href="landing">Code Samples</a></li>
</div>
<div>
<li><a href="detail">Detail Page</a></li>
</div>
<div>

        <c:if test="${currentUser.userName != null}">
        <li> <a href="addSnippet">Add Snippet</a></li>
        <li> <a href="editSnippet">Edit Snippet</a></li>
            <c:set var="addSnippet" value="Add Snippet" />
            <c:set var="editSnippet" value="Edit Snippet" />
        </c:if>
    
        
            <li><a href="register">Register</a></li>
        </div>
</div> --%>


	<section>
		<div id="pageContent">