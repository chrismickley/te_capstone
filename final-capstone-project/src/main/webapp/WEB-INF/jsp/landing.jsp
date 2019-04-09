<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div>

<p>Welcome to the Landing Page</p>
<div>
<a href="addSnippet">Add Snippet Page</a>
</div>

<c:forEach var="snippet" items="${ snippets }">

<p><c:out value="${ snippet.name }"></c:out></p>
<p><c:out value="${ snippet.code }"></c:out></p>
<p><c:out value="${ snippet.description }"></c:out></p>

</c:forEach>

</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
