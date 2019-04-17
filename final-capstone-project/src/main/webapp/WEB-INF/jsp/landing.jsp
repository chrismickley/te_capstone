<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<c:url var="searchFilter" value="/searchFilter" />
<form method="GET" action="${searchFilter}">
	Select a Search Filter: <select name="searchOption">
		<option value="searchTag">Key Word</option>
		<option value="searchName">Title</option>
		<option value="searchLanguage">Language</option>
		<input type="text" name="searchParameter"
		placeholder="Enter search filter" />


		<input type="submit" value="Search" />
</form>

<script src="<c:url value="/js/markdown.js" />">
	
</script>
<ul class="landing"></ul>
<table class="tableproperties">

	<tr>
		<th class="tableheaders">Title of Snippet</th>
		<th class="tableheaders">Code</th>
		<th class="tableheaders">Description</th>
		<th class="tableheaders">Language</th>
		<th class="tableheaders">Attribution</th>
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
			<td class="tabledata" id="landing_details"><a
				href="http://localhost:8080/capstone/searchOneById?searchId=${ snippet.id }">${ snippet.name }</a></td>
			<td class="tabledata2"><c:out value="```${ snippet.code }```"></c:out></td>
			<td class="tabledata"><c:out value="${ snippet.description }"></c:out></td>
			<td class="tabledata"><c:out value="${ snippet.language }"></c:out></td>
			<td class="tabledata"><c:out value="${ snippet.attribution }"></c:out></td>
			<!-- Need to create the method to display the tag here -->
			<%-- 			<td id="tabledata"><c:out value="The Tag"></c:out></td>
 --%>
		</tr>
	</c:forEach>
</table>

</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
