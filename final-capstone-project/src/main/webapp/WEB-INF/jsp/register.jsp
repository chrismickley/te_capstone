<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<c:url value="/register" var= "registerUrl" />

<form:form action="${registerUrl}" method="POST" modelAttribute="register">

<div class="registerlist">
<p>Welcome to the Registration Page</p>


<ul>
           <li class="registerlabel"> <label for="userName">User Name</label></li>
			<li class="registerinput"><form:input path="userName" /> </li>           
  </ul>          
     
        
       <ul>
            <li class="registerlabel"><label for="password">Password</label></li>
			<li class="registerinput"><form:input path="password" />            
        		<form:errors path="password" cssClass="error"/></li>
        </ul>

            
            
      
        <ul>
           <li class="registerlabel"> <label for="confirmPassword">Confirm Password</label></li>
           <li class="registerinput"> <form:input path="confirmPassword" />
            <form:errors path="confirmPassword" cssClass="error"/>
            <form:errors path="passwordMatching" cssClass="error"/></li>
       </ul>
        <ul>
        <li>
            <button type="submit">Submit</button>
            </li>
        </ul>
</div>

</form:form>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
