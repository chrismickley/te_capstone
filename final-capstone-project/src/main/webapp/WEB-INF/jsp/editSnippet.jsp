<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet" href="css/site.css" />
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<c:url value="/submitEditedSnippet" var="urlSubmitChanges" />
<form:form action="${urlSubmitChanges}" method="POST"
	modelAttribute="registration">

	<title>Code Submission Page</title>

	<p>Edit Snippet Page</p>

	<div class="addSnippet-form-items">
		<form action="submitCode" method="POST">
			<div></div>
			<div></div>

			<div>
				<ul>
					<li id="inputlabel"><label for="codeName">Name of Code
							Snippet:</label></li>
				</ul>
			</div>

			<div>
				<ul>
					<li id="inputbox"><textarea rows="1" cols="25"
							name="codeName" id="inputbox">${ snippet.name }</textarea></li>
				</ul>
			</div>

			<div>
				<ul>
					<li id="inputlabel"><label for="codeDescription">Enter
							a code snippet description:</label>
				</ul>
			</div>

			<div>
				<ul>
					<li id="inputbox"><textarea rows="3" cols="50"
							name="codeDescription" id="inputbox"
							placeholder="Please enter a description here">${ snippet.description }</textarea></li>
				</ul>
			</div>

			<div>
				<ul>
					<li id="inputlabel"><label for="codeSnippet">Enter
							code snippet:</label></li>
				</ul>
			</div>
			
			<div>
				<ul>
					<li id="inputbox"><textarea rows="1" cols="25"
							name="codeName" id="inputbox">${ snippet.code }</textarea></li>
				</ul>
			</div>
<!-- 			<div>
				<ul>
					<li id="inputbox"><textarea rows="10" cols="30"
							name="codeSnippet" id="inputbox"></textarea></li>
				</ul>
			</div> -->

			<div>
				<ul>
					<li id="inputlabel"><label for="tag">Enter Key Words:</label></li>
				</ul>
			</div>
			<div>
				<ul>
					<li id="inputbox"><input type="text" name="tag" id="inputbox" />
					</li>
				</ul>
			</div>

			<div>
				<ul>
					<li id="inputlabel"><label for="codeLanguage">Select
							language:</label></li>
				</ul>
			</div>

			<div>
				<ul>
					<li id="inputbox"><select name="codeLanguage">
							<c:forEach items="${languageList}" var="language">
								<option value="${language}">
									<c:out value="${language}" /></option>
							</c:forEach>
					</select></li>
				</ul>
			</div>

			<div>
				<ul>
					<li id="inputlabel"><label for="publicView">Make
							Public? </label></li>
				</ul>
			</div>
			<div>
				<ul>
					<li id="inputbox"><input type="checkbox" name="publicView"
						value="true" /></li>
				</ul>
			</div>

			<div>
				<ul>
					<li id="inputlabel"><label for="publicView">Attribution
					</label></li>
				</ul>
			</div>
			<div>
				<ul>
					<li id="inputbox"><input type="text" name="attribution"
						size="50" id="inputbox" /></li>
				</ul>
			</div>

			<div id="inputbutton">
				<label for="submitForm"></label> <input type="submit"
					value="Submit Edited Snippet" />
			</div>

		</form>
	</div>

</form:form>
