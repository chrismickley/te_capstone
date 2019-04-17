<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- <link rel="stylesheet" href="css/site.css" /> -->
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<%-- <c:url var="urlSearchById" value="/searchByIdGoToEditPage" />
<form action="${ urlSearchById }" method="GET">
	<input type="text" name="searchId" placeholder="Enter Snippet ID" /> <input
		type="submit" value="Search By ID" />
</form> --%>

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
<<<<<<< HEAD
					<li class="inputbox"><input type="text" name="name" /> ${ snippet.name }</li>
=======
					<li class="inputbox"><input type="text" size="20" name="name" value="${ snippet.name }"/>
						</li>
>>>>>>> a2e745e46608c1d06597923de75151a8f83f16c7
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
<<<<<<< HEAD
					<li class="inputbox"><input type="text" name="tag" /> ${ tag.tag }</li>
=======
					<li class="inputbox"><input type="text" name="tag" size="58" value="${ tag.tag }"/>
							</li>
>>>>>>> a2e745e46608c1d06597923de75151a8f83f16c7
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
<<<<<<< HEAD
					<li class="inputbox"><input type="text" name="attribution"
						size="50" />${ snippet.attribution }</li>
=======
					<li class="inputbox"><input type="text"
							name="attribution" size="58" value="${ snippet.attribution }"></li>
>>>>>>> a2e745e46608c1d06597923de75151a8f83f16c7
					<!-- Maybe make separate attribution (name of source) and reference link -->
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
					Need to create method to check box as needed
					<li class="inputbox"><input type="checkbox" name="publicView"
						value="true" /></li>
				</ul>
			</div>
 -->
			<!-- 			<div>
				<ul>
					<li class="inputlabel"><label for="publicView">Snippet
							ID: </label></li>
				</ul>
			</div>
 -->
			<div>
				<ul>
					<li class="inputbox"><a class="inputbox">${ snippet.id }</a> <input
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
