<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

 <c:import url="/WEB-INF/jsp/common/header.jsp" />

<p>Detail Page</p>

<c:url var="searchFilter" value="/searchFilter" />
<form method="GET" action="${searchFilter}">
	Select a Search Filter: <select name="searchOption">
		<option value="searchTag">Key Word</option>
		<option value="searchName">Title</option>
		<option value="searchLanguage">Language</option>
	</select> <input type="text" name="searchParameter"
		placeholder="Enter search filter" /> <input type="submit"
		value="Search" />
</form>

<c:url var="urlSearchById" value="/searchOneById" />
<form action="${ urlSearchById }" method="GET">
	<input type="text" name="searchId" placeholder="Enter Snippet ID" /> <input
		type="submit" value="Search By ID" />
</form>
<script src="<c:url value="/js/markdown.js" />"> </script> 
<table class="tableproperties">
	<tr>
		<th class="tableheaders">Title of Snippet</th>
		<td class="tabledata"><c:out value="${ snippet.name }"></c:out></td>
	</tr>
	
	<tr>
		<th class="tableheaders">Description</th>
		<td class="tabledata"><c:out value="${ snippet.description }"></c:out></td>
	</tr>
	<tr>
	
		<th class="tableheaders">Code</th>
		<td class="tabledata2"><c:out value="${ snippet.code }"></c:out></td>
	</tr>
	
	<tr>
		<th class="tableheaders">Key word</th>
		<td class="tabledata"><c:out value="${ tag.tag }"></c:out></td>
	</tr>
	
	<tr>
		<th class="tableheaders">Language</th>
		<td class="tabledata"><c:out value="${ snippet.language }"></c:out></td>
	</tr>

	<tr>
		<th class="tableheaders">Attribution</th>
		<td class="tabledata"><c:out value="${ snippet.attribution }"></c:out></td>
	</tr>

	<tr>
		<th class="tableheaders">Snippet ID</th>
		<td class="tabledata"><a href="http://localhost:8080/capstone/searchByIdGoToEditPage?searchId=${ snippet.id }">${ snippet.id }</a></td>
	</tr>

	<c:choose>
		<c:when test="${ snippet.publicView != true}">
			<c:set var="visibility" value="private" />
		</c:when>
		<c:when test="${ snippet.publicView == true }">
			<c:set var="visibility" value="public" />
		</c:when>
	</c:choose>

	<tr>
		<th class="tableheaders">Public View</th>
		<td class="tabledata"><c:out value="${visibility}"></c:out></td>

	</tr>
</table>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />

