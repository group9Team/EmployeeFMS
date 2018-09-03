<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<spring:url value="/resources/css/style.css"/>">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="<spring:url value="/resources/js/style.js"/>"></script>

</head>
<body>
<jsp:include page="../views/header.jsp"></jsp:include>

<div class="container text-center">
		
		<h3>Add HR-Staff</h3>
	</div>
	
<div class="container">
<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<form method="post" id="adminForm">
					<div class="form-group">
						<label>Payroll</label> <input type="text" name="payroll"
							class="form-control">
					</div>
					<div class="form-group">
						<label>Role</label> <select name="role" class="form-control">
						    <option>ROLE_STAFF</option>
							<option>ROLE_EMPLOYEE</option>
							<option>ROLE_DEPARTMENT</option>
						</select>
					</div>
					<sec:csrfInput />
					<button class="btn btn-success" id="adminButton">Add</button>
				</form>
				<h5 id="adminFormResponse" style="color:green"></h5>
			</div>
			<div class="col-sm-3"></div>
		</div>
</div>
</body>
</html>