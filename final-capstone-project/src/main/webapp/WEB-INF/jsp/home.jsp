<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="css/home.css" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Ubuntu">
<title>Code Catalog</title>
</head>

<body>

	<header>
		<div>
			<i class="fas fa-atom"></i>
		</div>
		<nav>
		<div class="navBar">
<!-- 			<ul>

				<li><a href="about">About</a>
				<li><a href="landing">Sample Sippets</a></li>
				<li><a href="addSnippet">Add Code Snippet</a></li>
				<li><a href="login">Login</a></li>
				<li><a href="register">Register</a></li>

			</ul> -->

			
				<a id="testing" href="home">Home</a> <a id="testing" href="about">About
				Us</a>


			<c:if test="${currentUser.userName != null}">
				<a id="testing" href="landing">Sample Snippets</a>
			</c:if>
			
			<c:if test="${currentUser.userName != null}">
				<a id="testing" href="addSnippet">Add Code Snippet</a>
			</c:if>
			

			<c:if test="${currentUser.userName == null}">
				<a id="testing2" href="login">Login</a>
				<a id="testing2" href="register">Register</a>
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
	</header>

	<section class="titles">

		<h1>Code Catalog</h1>
		<p>Reusability of code is a foundational principle which helps
			create efficiency and consistency in the coding process. The Code
			Catalog is a website intended to help beginning coders store
			code snippets, and create a working repository for learning and
			reusing coding artifacts.</p>

	</section>

	<section class="container-boxes">
		<div class="box">

			<!--       <div class="icon">
        <a href=""><i class="fas fa-fire"></i></a>
      </div> -->

			<div class="text">
	
					<h3>Language Trends</h3>
					<p> Click the
						graph below to see the most utilized development
						languages compared to what is anticipated for 2019.</p>
							<a href="img/mostpopularlanguages.png"><img src="img/mostpopularlanguages.png">	</a>
					<p>
						SOURCE: <a
							href="https://codingsans.com/state-of-software-development-2018">
							State of Software Development In 2018</a>
					</p>
			
			</div>

		</div>

		<div class="box">

			<!--       <div class="icon">
        <a href=""><i class="fas fa-seedling"></i></a>
      </div> -->

			<div class="text">
		
					<h3>Methods of Learning</h3>
					<p>Developers
					are increasingly learning new languages on their own using self-taught methods.</p>
					<a href="img/learningmethods.png"><img src="img/learningmethods.png">	</a>
						<p>SOURCE:<a href="https://insights.stackoverflow.com/survey/2018"> StackOver Flow 2018 Survey</a></p>
			</div>

		</div>

		<div class="box">

			<div class="icon">
				<!--         <a href=""><i class="fas fa-address-card"></i></a> -->
			</div>

			<div class="text">

				<h3>Links to Popular Code Snippets</h3>
				<ul>
				<li class="links"><a href="https://www.analyticbridge.datasciencecentral.com/group/codesnippets/forum/topics/credit-card-number-and-password-encoder-decoder" target="_blank"><font class="fontcolorjs">JavaScript </font>Credit card number and password encoder / decoder</a></li>
				<li class="links"><a href="https://html-online.com/articles/common-javascript-jquery-code-snippets/ " target="_blank"><font class="fontcolorjs">JavaScript </font>Show an element when another is clicked</a></li>
				<li class="links"><a href="https://www.htmlgoodies.com/beyond/javascript/article.php/3887346/Top-10-JavaScript-Snippets-for-Common-Tasks.htm" target="_blank"><font class="fontcolorjs">JavaScript </font>Date Display</a></li>
				<li class="links"><a href="https://www.webhostingsecretrevealed.net/blog/featured-articles/15-cool-javascript-sample-snippets/" target="_blank"><font class="fontcolorjs">JavaScript </font>E-mail Validation</a></li>
				<li class="links"><a href="https://jaxenter.com/15-useful-code-snippets-java-developers-131796.html" target="_blank"><font class="fontcolorj" target="_blank">Java </font>Using Java JDBC to connect to Oracle</a></li>
				<li class="links"><a href="https://viralpatel.net/blogs/20-useful-java-code-snippets-for-java-developers/" target="_blank"><font class="fontcolorj">Java </font>Append text to file in Java</a></li>
				<li class="links"><a href="https://jaxenter.com/15-useful-code-snippets-java-developers-131796.html" target="_blank"><font class="fontcolorj">Java </font>Converting Array to Map in Java</a></li>
				<li class="links"><a href="https://www.pythonforbeginners.com/code-snippets-source-code/python-script-log-checker/" target="_blank"><font class="fontcolorpy">Python </font>Log checker</a></li>
				<li class="links"><a href="https://www.pythonforbeginners.com/code-snippets-source-code/date-and-time-script/" target="_blank"><font class="fontcolorpy">Python </font>Date and Time Script</a></li>
				<li class="links"><a href="https://snippets.readthedocs.io/en/latest/list.html#sort-a-list-of-dictionaries-by-values-of-the-dictionary" target="_blank"><font class="fontcolorpy">Python </font>Multiple snippets for list manipulation</a></li>
				</ul>
				
				

			</div>

		</div>
	</section>

</body>

</html>
