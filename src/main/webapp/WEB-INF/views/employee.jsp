
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<title>FileManagementSystem</title>
</head>
<body>
	<jsp:include page="../views/header.jsp"></jsp:include>
	<div class="myContainer">
		<div class="row">
			<div class="col-sm-3">
				<div id="side" class="side">
					<ul id="sideUl">
						<li id="empJs">Employee Account</li>
						<li id="formJs">Fill Form</li>
						<li id="updateJs">Update</li>
						<li id="commentJs">Comment</li>
					</ul>
				</div>

			</div>


			<div class="col-sm-8">

				<div id="hide6">
					<h3>Personal Information</h3>
					<div class="media">
						<div class="media-left media-top">
							<img src="data:image/jpg;base64,${empDetails.base64image}"
								class="media-object" id="imageResponse">
						</div>
						<div class="media-body">
							<label>Name : </label><span>${empDetails.firstName}
								${empDetails.lastName}</span> <br> <label>Contact : </label><span>${empDetails.phoneNumber}</span>
							<br> <label>Email : </label><span>${empDetails.email}</span>
							<br> <label>Status : </label><span>${empDetails.status}</span>
							<br> <label>Sex : </label><span>${empDetails.gender}</span>
							<br> <label>D.O.B : </label><span>${empDetails.dob}</span> <br>
							<label>Address : </label><span>${empDetails.address}</span> <br>
							<label>Department : </label><span>${empDetails.department}</span>
						</div>
					</div>

					<br>
					<div class="form-group">
						<form id="uploadForm">
							<label for="upload">Upload Image</label>
							<div class="input-group">
								<label class="input-group-btn"> <span
									class="btn btn-success btn-file"> Browse <input
										type="file" name="image">
								</span>
								</label> <input type="text" class="form-control" readonly
									style="width: 50%"> <span class="btn btn-success"
									id="uploadBtn">Upload</span>
							</div>
							<br>
							<sec:csrfInput />
						</form>
					</div>
					<button class="btn btn-success" data-target="#passwordModal"
						data-toggle="modal">Change Password</button>
					<h5 id="passwordFormResponse" style="color: green"></h5>
				</div>

				<div hidden id="hide7">
					<h3>Fill the form</h3>
					<br>
					<form id="empForm" method="post">
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<label>First Name:</label> <input type="text"
										class="form-control" name="firstName">
								</div>
								<div class="form-group">
									<label>Last Name:</label> <input type="text"
										class="form-control" name="lastName">
								</div>
								<div class="form-group">
									<label>Phone Number:</label> <input type="text"
										class="form-control" name="phoneNumber">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label>Email:</label> <input type="email" class="form-control"
										name="email">
								</div>
								<div class="form-group">
									<label>Marital Status:</label><select name="status"
										class="form-control">
										<option>Single</option>
										<option>Married</option>

									</select>
								</div>
								<div class="form-group">
									<label>Gender:</label> <select name="gender"
										class="form-control">
										<option>Male</option>
										<option>Female</option>

									</select>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label>BirthDate:</label>
									<div class="input-group date" id="datePicker">
										<input type='text' class="form-control" name="dob" /> <span
											class="input-group-addon"> <span
											class="glyphicon glyphicon-calendar"></span>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label>Address:</label> <input type="text" class="form-control"
										name="address">
								</div>
							</div>
						</div>
						<h5 id="fillFormResponse" style="color: green"></h5>
						<div>
							<button class="btn btn-success" id="formButton">Save</button>
						</div>
						<sec:csrfInput />
					</form>
				</div>


				<div hidden id="hide8">
					<h3>Update the form</h3>
					<br>
					<form id="updateForm">
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<label>Phone Number:</label> <input type="text"
										class="form-control" name="phoneNumber">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label>Email:</label> <input type="text" class="form-control"
										name="email">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<label>Address:</label> <input type="text" class="form-control"
										name="address">
								</div>

							</div>
						</div>
						<sec:csrfInput />
						<button class="btn btn-success" id="updateButton">Save</button>
					</form>
					<h5 id="updateFormResponse" style="color: green"></h5>
				</div>

				<div hidden id="hide9">
					<h3>Write your comment</h3>
					<div class="form-group right">
						<textarea rows="6" cols="100" class="form-control"></textarea>
						<br>
						<button class="btn btn-success">Send</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" data-keyboard="false" id="passwordModal"
			tabindex="-1">
			<div class="modal-dialog ">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">
							<span id="closeBtn">&times;</span>
						</button>
						<h4 class="modal-title">Change Password</h4>
					</div>

					<div class="modal-body">
						<form id="passwordForm">
							<div class="form-group">
								<label>Current Password</label> <input type="text"
									class="form-control" name="currentPassword">
							</div>
							<div class="form-group">
								<label>New Password</label> <input type="text"
									class="form-control" name="newPassword">
							</div>
							<button class="btn btn-success" data-dismiss="modal" type="submit" id="passwordButton">Save</button>
							<sec:csrfInput />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../views/footer.jsp"></jsp:include>

</body>
</html>