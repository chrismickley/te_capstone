<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div>

	<p>Welcome to the Landing Page</p>
	<div>
		<a href="addSnippet">Add Snippet Page</a>
	</div>

	<table>
		<c:forEach var="snippet" items="${ snippets }">
			<tr>
			<td><c:out value="${ snippet.name }"></c:out></td>
			<td><c:out value="${ snippet.code }"></c:out></td>
			<td><c:out value="${ snippet.description }"></c:out></td>
			</tr>
		</c:forEach>
	</table>

</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
