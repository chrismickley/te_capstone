<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<c:import url="/WEB-INF/jsp/common/header.jsp" />
<c:url value="/addSnippet" var="landingPage" />
<form:form action="${landingPage}" method="POST" modelAttribute="registration">
<title>Code Submission Page</title>


<div class="submitCode">

<form action="submitCode" method="POST">
<ul>
<li><label for="codeName">Name of Code Snippet:</label><input type="text" name="codeName" /></li>
<li><label for="codeSnippet">Enter code snippet below:</label><input type="text" name="codeDetails" /></li>
<li><label for="codeDescription">Enter a description for the supplied code:</label><input type="text" name="codeDescription" /></li>
<li><label for="codeLanguage">Enter the code language:</label><input type="text" name="codeLanguage" /></li>
<li>
<li><label for="submitForm">Submit </label>
 <input type="submit" value="next" /></li>
 </ul>
</form>
</div>

</form:form>
