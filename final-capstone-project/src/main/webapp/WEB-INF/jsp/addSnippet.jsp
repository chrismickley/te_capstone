<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet" href="css/site.css" />
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
					<li id="inputlabel"><label for="codeName">Name of Code
							Snippet:</label></li>
				</ul>
			</div>
			<div>
				<ul>
					<li id="inputbox"><input type="text" name="codeName"
						id="inputbox" /></li>
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
					<li id="inputbox"><textarea rows="10" cols="50"
							name="codeDescription" id="inputbox"
							placeholder="Please enter a description here"></textarea></li>
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
					<li id="inputbox"><textarea rows="10" cols="30"
							name="codeSnippet" id="inputbox">
</textarea></li>
				</ul>
			</div>

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

			<!-- <div>
<ul>
<li id="inputlabel"><label for="codeLanguage">Enter the code language:</label></li>
</ul>
</div>
<div>
<ul>
<li id="inputbox"><input type="text" name="codeLanguage" size="50" id="inputbox"/>
</li>
</ul>
</div> -->

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
				<label for="submitForm"></label> <input type="submit" value="Submit" />
			</div>
			<!-- <table>
<tr>
<td id="tabledata">
<label for="codeName">Name of Code Snippet:</label>
</td>
<td>
<input type="text" name="codeName" id="inputbox" />
</td>
</tr>
<tr>
<td id="tabledata">
<label for="tag">Enter Key Words:</label>
</td>
<td>
<input type="text" name="tag" id="inputbox"/>
</td>
</tr>

<tr>
<td id="tabledata">
<label for="codeSnippet">Enter code snippet below:</label>
</td>
<td>
<textarea rows="10" cols="30" name="codeSnippet" id="inputbox">
</textarea>
</td>
</tr>

<tr>
<td id="tabledata">
<label for="codeDescription">Enter a description for the supplied code:</label>
</td>
<td id="tabledata">
<textarea rows="10" cols="50" name="codeDescription" id="inputbox" placeholder="Please enter a description here"></textarea>
</td>
</tr>
<tr>
<td id="tabledata">
<label for="codeLanguage">Enter the code language:</label>
</td>
<td>
<input type="text" name="codeLanguage" size="50" id="inputbox"/>
</td></tr>

<tr>
<td id="tabledata">
<label for="publicView">Make Public? </label>
</td>
<td>
<input type="checkbox" name="publicView" value = "true" />
</td>
</tr>
<tr>
<td>
<label for="submitForm"></label>
 <input type="submit" value="Submit" />
 </td>
 </tr>
</table> -->


		</form>
	</div>

</form:form>
