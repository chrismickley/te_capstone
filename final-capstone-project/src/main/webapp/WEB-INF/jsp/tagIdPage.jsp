<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div>

	<p>Welcome to the Tag ID Page</p>
	<table>
		<tr>
			<td><c:out value="${ tagIdFromController }"></c:out></td>
		</tr>
		<tr>
			<td><c:out value="Tag id arrives above here"></c:out></td>
		</tr>
	</table>

</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
