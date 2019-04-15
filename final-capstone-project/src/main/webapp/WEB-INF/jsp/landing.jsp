<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<c:url var="searchFilter" value="/searchFilter" />
<form method="GET" action="${searchFilter}">
	Select a Search Filter: <select name="searchOption">
		<option value="searchTag">Tag</option>
		<option value="searchName">Title</option>
		<option value="searchLanguage">Language</option>
		<input type="text" name="searchParameter"
		placeholder="Enter search filter" />


		<input type="submit" value="Search" />
</form>


<table id="tableproperties">

	<tr>
		<th id="tableheaders">Title of Snippet</th>
		<th id="tableheaders">Code</th>
		<th id="tableheaders">Description</th>
		<th id="tableheaders">Language</th>
		<th id="tableheaders">Attribution</th>
<!-- 		<th id="tableheaders">Public View</th>
 -->		<th id="tableheaders">Snippet Tag</th>
	</tr>
	<c:forEach var="snippet" items="${ snippets }">


		<c:choose>

			<c:when test="${ snippet.publicView != true}">
				<c:set var="publicViewToggle" value="private" />
			</c:when>
			<c:when test="${ snippet.publicView == true }">
				<c:set var="publicViewToggle" value="public" />
			</c:when>

		</c:choose>
		<tr>
			<td id="tabledata"><c:out value="${ snippet.name }"></c:out></td>
			<td id="tabledata"><c:out value="${ snippet.code }"></c:out></td>
			<td id="tabledata"><c:out value="${ snippet.description }"></c:out></td>
			<td id="tabledata"><c:out value="${ snippet.language }"></c:out></td>
			<td id="tabledata"><c:out value="${ snippet.attribution }"></c:out></td>
<%-- 			<td id="tabledata"><c:out value="${ publicViewToggle }"></c:out></td>
 --%>			<td id="tabledata"><c:out value="*To add*"></c:out></td>
		</tr>
	</c:forEach>
</table>

</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
