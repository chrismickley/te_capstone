<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div>

	<p>Welcome to the Tag ID Page</p>
	<table>
		<c:forEach var="tagId" items="${ tagIdFromController }">
			<tr>
				<td><c:out value="${ tagId }"></c:out></td>
			</tr>
			<tr>
				<td><c:out value="Tag id arrives above here"></c:out></td>
			</tr>
		</c:forEach>
	</table>

</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
