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

	<div class="titleBar">
		<header>
			<div>
				<h1 id="headerTitle">Code Catalog</h1>

			</div>
		</header>
	</div>

	<nav>
		<div class="navBar">


			<a id="testing" href="home">Home</a> <a id="testing" href="about">About
				Us</a>


			<c:if test="${currentUser.userName != null}">
				<a id="testing" href="landing">Sample Snippets</a>
			</c:if>
			
			<c:if test="${currentUser.userName != null}">
				<a id="testing" href="addSnippet">Add Code Snippet</a>
			</c:if>
			

			<c:if test="${currentUser.userName == null}">
				<a id="testing2" href="register">Register</a>

				<a id="testing2" href="login">Login</a>

			</c:if>


			<c:if test="${currentUser.userName != null}">

				<span id="welcome">Welcome, ${currentUser.userName}</span>

			</c:if>
			
			<c:if test="${currentUser.userName != null}">
				<c:url var="formAction" value="/logout" />
				<span><form method="POST" action="${formAction}">
						<input type="hidden" name="destination"
							value="${param.destination}" />
						<button class="logoutButton" type="Logout">Logout</button>
					</form></span>
			</c:if>

		</div>
	</nav>



	<section>
		<div id="pageContent">