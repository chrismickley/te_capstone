<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet" href="css/site.css" />
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<c:url var="urlSearchById" value="/searchByIdGoToEditPage" />
<form action="${ urlSearchById }" method="GET">
	<input type="text" name="searchId" placeholder="Enter Snippet ID" /> <input
		type="submit" value="Search By ID" />
</form>

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
					<li id="inputbox"><textarea rows="1" cols="25" name="name"
							id="inputbox">${ snippet.name }</textarea></li>
				</ul>
			</div>

			<div>
				<ul>
					<li id="inputlabel"><label for="codeDescription">Code
							Snippet Description:</label>
				</ul>
			</div>

			<div>
				<ul>
					<li id="inputbox"><textarea rows="3" cols="50"
							name="description" id="inputbox"
							placeholder="Please enter a description here">${ snippet.description }</textarea></li>
				</ul>
			</div>

			<div>
				<ul>
					<li id="inputlabel"><label for="codeSnippet">Code
							Snippet:</label></li>
				</ul>
			</div>

			<div>
				<ul>
					<li id="inputbox"><textarea rows="8" cols="35"
							name="code" id="inputbox">${ snippet.code }</textarea></li>
				</ul>
			</div>

			<div>
				<ul>
					<li id="inputlabel"><label for="tag">Key Word:</label></li>
				</ul>
			</div>

			<div>
				<ul>
					<li id="inputbox"><textarea rows="1" cols="25" name="tag"
							id="inputbox">${ tag }</textarea></li>
				</ul>
			</div>


			<!-- 			<div>
				<ul>
					<li id="inputbox"><input type="text" name="tag" id="inputbox" /> Need to create method to return code tag to jsp
					</li>
				</ul>
			</div> -->

			<div>
				<ul>
					<li id="inputlabel"><label for="codeLanguage">Select
							language:</label></li>
				</ul>
			</div>

			<div>
				<ul>
					<li id="inputbox"><select name="language">
							<!-- Need to create method to return language to jsp -->
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
					<!-- Need to create method to check box as needed -->
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
					<li id="inputbox"><textarea rows="1" cols="50"
							name="attribution" id="inputbox">${ snippet.attribution }</textarea></li>
					<!-- Maybe make separate attribution (name of source) and reference link -->
				</ul>
			</div>
			
			<ul>
				<li><textarea rows="1" cols="3" name="id">${ snippet.id }</textarea></li>
			</ul>

			<div id="inputbutton">
				<label for="submitForm"></label> <input type="submit"
					value="Submit Edited Snippet" />
			</div>

		</form>
	</div>

</form:form>
