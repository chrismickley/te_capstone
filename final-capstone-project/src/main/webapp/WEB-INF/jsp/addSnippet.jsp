<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet" href="css/site.css" />
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<c:url value="/addSnippet" var="landingPage" />
<form:form action="${landingPage}" method="POST" modelAttribute="registration">

<title>Code Submission Page</title>


<div class="submitCode">

<form action="submitCode" method="POST">

<table>

<tr>
<td>
<label for="codeName">Name of Code Snippet:</label>
</td>
<td>
<input type="text" name="codeName" id="inputbox" />
</td>
</tr>

<tr>
<td>
<label for="tag">Enter Key Words:</label>
</td>
<td>
<input type="text" name="tag" id="inputbox"/>
</td>
</tr>

<tr>
<td>
<label for="codeSnippet">Enter code snippet below:</label>
</td>
<td>
<input type="text" name="codeSnippet" style="width: 600px; height: 100px" id="inputbox"/>
</td>
</tr>

<tr>
<td>
<label for="codeDescription">Enter a description for the supplied code:</label>
</td>
<td>
<input type="text" name="codeDescription" id="inputbox" />
</td>
</tr>

<tr>
<td>
<label for="codeLanguage">Enter the code language:</label>
</td>
<td>
<input type="text" name="codeLanguage" size="50" id="inputbox"/>
</td></tr>

<tr>
<td>
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
</table>
</form>
</div>

</form:form>
