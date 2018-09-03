<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<spring:url value="/resources/css/style.css"/>">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="<spring:url value="/resources/js/style.js"/>"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>


<title>FileManagementSystem</title>
<title>FileManagementSystem</title>
</head>
<body>
	<jsp:include page="../views/header.jsp"></jsp:include>
	<div class=myContainer>
	<div class="row">
    <div class="col-sm-2"></div>
    
	<div class="col-sm-8">
		<h3>Search an employee</h3>
		<form method="post" id="deptForm">
		<div class="input-group">
			<input type="text" class="form-control" placeholder="payroll" name="payroll">
			<div class="input-group-btn">
			<sec:csrfInput/>
				<button type="button" class="btn btn-success" id="deptButton">Search</button>
			</div>
		</div>
		</form>
	    <br>

	<table id="data-table"
		class="table table-striped table-bordered nowrap" width="100%">
		<thead>
			<tr>
				<th>Description</th>
				<th>Details</th>
			</tr>
		</thead>
		<tbody id="tBody" hidden>
			<tr class="odd gradeX">
				<td>Payroll</td>
				<td id="payrolltd"></td>
			</tr>
			<tr class="odd gradeX">
				<td>Name</td>
				<td id="nametd"></td>
			</tr>
			<tr class="odd gradeX">
				<td>Department</td>
				<td id="departmenttd"></td>
			</tr>
			<tr class="odd gradeX">
				<td>Phone Number</td>
				<td id="phoneNumbertd"></td>
			</tr>
			<tr class="odd gradeX">
				<td>Email</td>
				<td id="emailtd"></td>
			</tr>
			<tr class="odd gradeX">
				<td>Status</td>
				<td id="statustd"></td>
			</tr>
			<tr class="odd gradeX">
				<td>Birth Date</td>
				<td id="dobtd"></td>
			</tr>
			<tr class="odd gradeX">
				<td>Address</td>
				<td id="addresstd"></td>
			</tr>
			
			
		</tbody>

	</table>
	</div>
	
	<div class="col-sm-2"></div>
	</div>
	</div>
	<br>
	<br>
	
	<jsp:include page="../views/footer.jsp"></jsp:include>
</body>
</html>