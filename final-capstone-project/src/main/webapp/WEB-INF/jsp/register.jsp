<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<c:url value="/register" var= "registerUrl" />

<form:form action="${registerUrl}" method="POST" modelAttribute="register">
<div>

<p>Welcome to the Registration Page</p>
<div>
            <label for="userName">User Name</label>
			<form:input path="userName" />            
            
        </div>
        
        <div>
            <label for="password">Password</label>
			<form:input path="password" />            
        		<form:errors path="password" cssClass="error"/>
        	

            
            
        </div>
        <div>
            <label for="confirmPassword">Confirm Password</label>
            <form:input path="confirmPassword" />
            <form:errors path="confirmPassword" cssClass="error"/>
            <form:errors path="passwordMatching" cssClass="error"/>
        </div>
        <div>
            <button type="submit">Submit</button>
        </div>
</div>

</form:form>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
