<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<c:url var="searchForTag" value="/searchForTag" />
<form method="GET" action="${searchForTag}">
<input type="text" name="searchTerm" placeholder="Enter search term" />
<input type="submit" value="Search" />
</form>


<%-- <c:url value="/searchForTag" var="searchForTag" />
<form action="${searchForTag}" method="GET"
	modelAttribute="searchTerm">
</form> --%>
<!-- <ul>
	<li id="searchlabel"><label for="codeSearch">Enter search
			parameter:</label></li>
</ul>

<div>
	<ul>
		<li id="searchbox"><input type="text" name="searchTag"
			id="searchbox" /></li>
	</ul>
</div>
<div id="searchbutton">
	<label for="submitSearch"></label> <input type="submit" value="Search" />
</div> -->


<table id="tableproperties">

	<tr>
		<th id="tableheaders">Name of Snippet</th>
		<th id="tableheaders">Code</th>
		<th id="tableheaders">Description</th>
		<th id="tableheaders">Language</th>
		<th id="tableheaders">Public View</th>
	</tr>
	<%-- <c:forEach var="snippet" items="${ searchResults }">


		<c:choose>

			<c:when test="${ snippet.publicView != true}">
				<c:set var="pubs" value="private" />
			</c:when>
			<c:when test="${ snippet.publicView == true }">
				<c:set var="pubs" value="public" />
			</c:when>

		</c:choose>
		<tr>
			<td id="tabledata"><c:out value="${ snippet.name }"></c:out></td>
			<td id="tabledata"><c:out value="${ snippet.code }"></c:out></td>
			<td id="tabledata"><c:out value="${ snippet.description }"></c:out></td>
			<td id="tabledata"><c:out value="${ snippet.language }"></c:out></td>


			<td id="tabledata"><c:out value="${pubs}"></c:out></td>
		</tr>
	</c:forEach> --%>
	<c:forEach var="snippet" items="${ snippets }">


		<c:choose>

			<c:when test="${ snippet.publicView != true}">
				<c:set var="pubs" value="private" />
			</c:when>
			<c:when test="${ snippet.publicView == true }">
				<c:set var="pubs" value="public" />
			</c:when>

		</c:choose>
		<tr>
			<td id="tabledata"><c:out value="${ snippet.name }"></c:out></td>
			<td id="tabledata"><c:out value="${ snippet.code }"></c:out></td>
			<td id="tabledata"><c:out value="${ snippet.description }"></c:out></td>
			<td id="tabledata"><c:out value="${ snippet.language }"></c:out></td>


			<td id="tabledata"><c:out value="${pubs}"></c:out></td>
		</tr>
	</c:forEach>
</table>

</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
