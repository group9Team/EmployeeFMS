<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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

</head>
<body>
	<jsp:include page="../views/header.jsp"></jsp:include>
	<div class="myContainer">
		<div class="row">
			<div class="col-sm-3">
				<div id="side" class="side">
					<ul id="sideUl">
						<li id="registerJs">Register Employee</li>
						<li id="limitJs">Limit Access</li>
						<li id="requestJs">Post Notification</li>
						<li id="archiveJs">Add to Archive</li>
						<li id="roleJs">Change Role</li>
						<li id="empView">View Employee</li>
					</ul>
				</div>

			</div>


			<div class="col-sm-8">
				<div class="row" id="hide2">
					<br>

					<div class="col-sm-1"></div>
					<div class="col-sm-9">
						<form class="form-horizontal" method="post" id="registerForm">
							<div class="form-group">
								<label for="payroll">Payroll:</label> <input type="text"
									class="form-control" id="payroll" name="payroll"
									placeholder="payroll">

							</div>
							<div class="form-group">
								<label for="pwd">Password:</label> <input type="password"
									class="form-control" id="pwd" name="password"
									placeholder="Enter payroll as password">

							</div>
							<div class="form-group">
								<label for="dept">Department:</label> <select
									class="form-control" name="department">
									<option disabled selected hidden>Select Department</option>
									<option value="Computer Science">Computer Science</option>
									<option value="Maths">Maths</option>
									<option value="Human Nutrition">Human Nutrition</option>
								</select>
							</div>
							<div class="form-group right">
								<sec:csrfInput />
								<a href="#" id="submitEmp" class="btn btn-success">Register</a>
								<br>
								<p id="param" style="color: green"></p>
							</div>
						</form>
					</div>
					<div class="col-sm-2"></div>
				</div>

				<div hidden id="hide3">

					<!-- 	<div class="dropdown">
						<button class="btn btn-primary dropdown-toggle" type="button"
							data-toggle="dropdown">
							Department <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#">Computer Science</a></li>
							<li><a href="#">Maths</a></li>
							<li><a href="#">Human Nutrition</a></li>
						</ul>
					</div>   -->
					<br>
					<form method="post" id="limitForm">
						<select class="form-control" name="department">
							<option disabled selected hidden>Select Department</option>s
							<option value="Computer Science">Computer Science</option>
							<option value="Maths">Maths</option>
							<option value="Human Nutrition">Human Nutrition</option>
						</select> <br>

						<table id="data-table"
							class="table table-striped table-bordered nowrap" width="100%">
							<thead>
								<tr>

									<th>Details</th>

								</tr>
							</thead>
							<tbody>
								<tr class="odd gradeX">

									<td>Name</td>
									<td><input type="checkbox" name="name" value="Name" /></td>
								</tr>
								<tr class="odd gradeX">

									<td>Phone Number</td>
									<td><input type="checkbox" name="number"
										value="Phone Number" /></td>
								</tr>
								<tr class="odd gradeX">

									<td>Email</td>
									<td><input type="checkbox" name="email" value="Email" /></td>
								</tr>
								<tr class="odd gradeX">

									<td>Marital Status</td>
									<td><input type="checkbox" name="maritalStatus"
										value="Marital Status" /></td>
								</tr>
								<tr class="odd gradeX">

									<td>Gender</td>
									<td><input type="checkbox" name="gender" value="Gender" /></td>
								</tr>
								<tr class="odd gradeX">

									<td>Age</td>
									<td><input type="checkbox" name="age" value="Age" /></td>
								</tr>
								<tr class="odd gradeX">

									<td>Address</td>
									<td><input type="checkbox" name="address" value="Address" /></td>
								</tr>


							</tbody>

						</table>
						<sec:csrfInput />
					</form>
					<div class="right">

						<button class="btn btn-success" id="deptData">Limit
							access</button>
					</div>
					<p style="color: green" id="limitResponse"></p>
				</div>



				<div hidden id="hide4">
					<h3>Send Notifications to All Employees</h3>
					<form id="notificationForm">
					<div class="form-group right">
					    <input class="form-control" name="subject" placeholder="Subject"/>
					    <br>
						<textarea rows="6" cols="100" class="form-control" name="message" placeholder="message"></textarea>
						<br>
						<button class="btn btn-success" id="notificationButton">Request</button>
						<h5 style="color: green" id="notificationResponse"></h5>
					</div>
					<sec:csrfInput />
					</form>
				</div>

				<div hidden id="hide5">
					<h3>Enter payroll number to archive</h3>

					<form class="input-group" method="post" id="archiveForm">
						<input type="text" class="form-control" placeholder="payroll"
							name="payroll">
						<div class="input-group-btn">
							<sec:csrfInput />
							<button type="button" class="btn btn-success" id="archiveFind">Search</button>
						</div>
					</form>
					<br>
					<h5 style="color: green" id="archiveRespo"></h5>

					<div hidden id="archiveDiv">
						<form method="post" id="archivePayrollForm" hidden>
							<input type="text" class="form-control" id="archiveResponse"
								name="payroll" value="" />
							<sec:csrfInput />
						</form>
						<h5 id="archiveResponse1"></h5>
						<h5 id="archiveResponse2"></h5>
						<h5 id="archiveResponse3"></h5>
						<button class="btn btn-success" id="archiveBtn">Archive</button>
					</div>

				</div>

				<div hidden id="hideRole">
					<h3>Change Employee Role</h3>
					<form id="roleForm">
						<div class="form-group">
							<label>Payroll</label> <input type="text" name="payroll"
								class="form-control">
						</div>
						<div class="form-group">
							<label>Role</label> <select name="role" class="form-control">
								<option>ROLE_EMPLOYEE</option>
								<option>ROLE_DEPARTMENT</option>
							</select>
						</div>
						<sec:csrfInput />
						<button class="btn btn-success" id="roleButton">Change</button>
					</form>
					<h5 id="roleFormResponse" style="color: green"></h5>
				</div>

				<div hidden id="hideEmp">

					<h3>Search an employee</h3>
					<form method="post" id="deptForm">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="payroll"
								name="payroll">
							<div class="input-group-btn">
								<sec:csrfInput />
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

			</div>
		</div>

	</div>

	<jsp:include page="../views/footer.jsp"></jsp:include>
</body>
</html>