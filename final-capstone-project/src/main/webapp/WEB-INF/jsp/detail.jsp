<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<p>Detail Page</p>

<c:url var="searchFilter" value="/searchFilter" />
<form method="GET" action="${searchFilter}">
	Select a Search Filter: <select name="searchOption">
		<option value="searchTag">Tag</option>
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

<table id="tableproperties">
	<tr>
		<th id="tableheaders">Title of Snippet</th>
		<td id="tabledata"><c:out value="${ snippet.name }"></c:out></td>
	</tr>
	
	<tr>
		<th id="tableheaders">Description</th>
		<td id="tabledata"><c:out value="${ snippet.description }"></c:out></td>
	</tr>
	<tr>
		<th id="tableheaders">Code</th>
		<td id="tabledata"><c:out value="${ snippet.code }"></c:out></td>
	</tr>
	
	<tr>
		<th id="tableheaders">Key word</th>
		<td id="tabledata"><c:out value="${ tag.tag }"></c:out></td>
	</tr>
	
	<tr>
		<th id="tableheaders">Language</th>
		<td id="tabledata"><c:out value="${ snippet.language }"></c:out></td>
	</tr>

	<tr>
		<th id="tableheaders">Attribution</th>
		<td id="tabledata"><c:out value="${ snippet.attribution }"></c:out></td>
	</tr>

	<tr>
		<th id="tableheaders">Snippet ID</th>
		<td id="tabledata"><c:out value="${ snippet.id }"></c:out></td>
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
		<th id="tableheaders">Public View</th>
		<td id="tabledata"><c:out value="${visibility}"></c:out></td>

	</tr>
</table>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
