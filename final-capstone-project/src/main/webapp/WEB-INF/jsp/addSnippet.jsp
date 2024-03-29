<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- <link rel="stylesheet" href="css/site.css" /> -->
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<c:url value="/addSnippet" var="landingPage" />
<form:form action="${landingPage}" method="POST"
	modelAttribute="registration">

	<title>Code Submission Page</title>


	<div class="addSnippet-form-items">
		<form action="submitCode" method="POST">
			<div></div>
			<div></div>

			<div>
				<ul>
					<li class="inputlabel"><label for="codeName">Title of Code
							Snippet:</label></li>
				</ul>
			</div>
			<div>
				<ul>
					<li class="inputbox"><input type="text" name="codeName"
						/></li>
				</ul>
			</div>

			<div>
				<ul>
					<li class="inputlabel"><label for="codeDescription">Enter
							a code snippet description:</label>
				</ul>
			</div>
			<div>
				<ul>
					<li class="inputbox"><textarea rows="10" cols="50"
							name="codeDescription"
							placeholder="Please enter a description here"></textarea></li>
				</ul>
			</div>

			<div>
				<ul>
					<li class="inputlabel"><label for="codeSnippet">Enter
							code snippet:</label></li>
				</ul>
			</div>
			<div>
				<ul>
					<li class="inputbox"><textarea rows="10" cols="50"
							name="codeSnippet">
</textarea></li>
				</ul>
			</div>

			<div>
				<ul>
					<li class="inputlabel"><label for="tag">Enter Key Word:</label></li>
				</ul>
			</div>
			<div>
				<ul>
					<li class="inputbox"><input type="text" name="tag" />
					</li>
				</ul>
			</div>

			<div>
				<ul>
					<li class="inputlabel"><label for="codeLanguage">Select
							language:</label></li>
				</ul>
			</div>

			<div>
				<ul>
					<li class="inputbox"><select name="codeLanguage">
							<c:forEach items="${languageList}" var="language">
								<option value="${language}">
									<c:out value="${language}" /></option>
							</c:forEach>
					</select></li>
				</ul>
			</div>

			<!-- <div>
				<ul>
					<li class="inputlabel"><label for="publicView">Make
							Public? </label></li>
				</ul>
			</div>
			<div>
				<ul>
					<li class="inputbox"><input type="checkbox" name="publicView"
						value="true" /></li>
				</ul>
			</div>
 -->
			<div>
				<ul>
					<li class="inputlabel"><label for="publicView">Attribution
					</label></li>
				</ul>
			</div>
			<div>
				<ul>
					<li class="inputbox"><input type="text" name="attribution"
						size="50" /></li>
				</ul>
			</div>

			<div class="inputbutton">
				<label for="submitForm"></label> <input type="submit" value="Submit" />
			</div>

		</form>
	</div>

</form:form>
