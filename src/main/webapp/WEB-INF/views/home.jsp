<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<spring:url value="/resources/css/style.css"/>" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<title>FileManagementSystem</title>
</head>
<body>
	<jsp:include page="../views/header.jsp"></jsp:include>
	<div class="container text-center">
		<h2>
			<strong>Egerton University</strong>
		</h2>
		<h3>Employee File Management System Portal</h3>


	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<form method="post"
					action="<c:url value="/j_spring_security_check"></c:url>">
					<div class="form-group">
						<label>Payroll</label> <input type="text" name="customUsername"
							class="form-control">
					</div>

					<div class="form-group">
						<label>Password</label> <input type="password"
							name="customPassword" class="form-control">
					</div>
					<sec:csrfInput />
					<button class="btn btn-success">Login</button>
				</form>
				<c:if test="${param.logout == true }">
				<br>
					<p style="color: green">You have successfully been logged out.</p>
				</c:if>
			    <c:if test="${param.failed == true}">
			    <br>
			      <p style="color: red">Wrong payroll number or password</p>
			    </c:if>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>

	<jsp:include page="../views/footer.jsp"></jsp:include>  
	
</body>
</html>