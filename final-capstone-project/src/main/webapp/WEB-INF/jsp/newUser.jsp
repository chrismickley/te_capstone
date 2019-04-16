<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<c:import url="/WEB-INF/jsp/common/header.jsp" />



<c:url var="formAction" value="/users" />
<form:form method="POST" action="${formAction}" modelAttribute="user">
<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
	<div>
		<div>
			<div class="form-group">
				<label for="userName">User Name: </label>
				<form:input type="text" id="userName" name="userName" placeHolder="User Name" class="form-control" path="userName"/>
				<form:errors path="userName" style="color:red" />
			</div>
			<div class="form-group">
				<label for="password">Password: </label>
				<form:input type="password" id="password" name="password" placeHolder="Password" class="form-control" path="password"/>
				<form:errors path="password" style="color:red" />
			</div>
			<div class="form-group">
				<label for="confirmPassword">Confirm Password: </label>
				<form:input type="password" id="confirmPassword" name="confirmPassword" placeHolder="Re-Type Password" class="form-control" path="confirmPassword"/>
				<form:errors path="confirmPassword" style="color:red" />
			</div>
			<button type="submit" class="btn btn-primary">Create User</button>
		</div>
	</div>
</form:form>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
		