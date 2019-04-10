<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div>

	<p>Welcome to the Landing Page</p>
	
	


	<table id="tableproperties">

		<tr>
			<th id="tableheaders">Name of Snippet</th>
			<th id="tableheaders">Code</th>
			<th id="tableheaders">Description</th>
			<th id="tableheaders">Language</th>
			<th id="tableheaders">Public View</th>
		</tr>
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
