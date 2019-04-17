<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- <link rel="stylesheet" href="css/site.css" /> -->
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
					<li class="inputlabel"><label for="codeName">Title of
							Code Snippet:</label></li>
				</ul>
			</div>

			<div>
				<ul>


					<li class="inputbox"><input type="text" size="20" name="name"
						value="${ snippet.name }" /></li>

				</ul>
			</div>

			<div>
				<ul>
					<li class="inputlabel"><label for="codeDescription">Code
							Snippet Description:</label>
				</ul>
			</div>

			<div>
				<ul>
					<li class="inputbox"><textarea rows="10" cols="50"
							name="description" placeholder="Please enter a description here">${ snippet.description }</textarea></li>
				</ul>
			</div>

			<div>
				<ul>
					<li class="inputlabel"><label for="codeSnippet">Code
							Snippet:</label></li>
				</ul>
			</div>

			<div>
				<ul>
					<li class="inputbox"><textarea rows="10" cols="50" name="code">${ snippet.code }</textarea></li>
				</ul>
			</div>

			<div>
				<ul>
					<li class="inputlabel"><label for="tag">Key Word:</label></li>
				</ul>
			</div>

			<div>
				<ul>
					<li class="inputbox"><input type="text" name="tag" size="58"
						value="${ tag.tag }" /></li>
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
					<li class="inputbox"><select name="language">
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
					<li class="inputlabel"><label for="attribution">Attribution
					</label></li>
				</ul>
			</div>

			<div>
				<ul>
					<li class="inputbox"><input type="text" name="attribution"
						size="58" value="${ snippet.attribution }"></li>
				</ul>
			</div>

			<div>
				<ul>
					<li class="inputbox"><input
						type="hidden" name="id" value="${ snippet.id }"></li>
				</ul>
			</div>

			<div class="inputbutton">
				<label for="submitForm"></label> <input type="submit"
					value="Submit Edited Snippet" />
			</div>

		</form>
	</div>

</form:form>
