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

	<header class="headerimage">
		<h1 id="headerTitle">Code Catalog</h1>
					<div>
				
					<li>Jackass currently logged in: <c:out value="${currentUser.userName}" /></li>
			
					</div>
		

	</header>

	<nav>

		<div class="nav-flex-container">
			<div>
				<li><a href="home">Home</a></li>
			</div>
			<div>
				<li><a href="landing">Code Samples</a></li>
			</div>
			<div>
				<li><a href="addSnippet">Add Snippet</a></li>
			</div>
			<div>
				<li><a href="register">Register</a></li>
			</div>
			<div>
				<a href="login" >Login</a>
			</div>

			<div>

				<c:url var="formAction" value="/logout" />
				<form method="POST" action="${formAction}">
					<input type="hidden" name="destination"
						value="${param.destination}" />
					<button type="Logout">Logout</button>
				</form>
			</div>
		</div>

	</nav>

	<section>
		<div id="pageContent">