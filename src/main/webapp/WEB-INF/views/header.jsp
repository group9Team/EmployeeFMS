<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<img class="logo" src="/FileManagement/resources/images/logo.png" />
</div>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<ul class="nav navbar-nav" id="change">
			<li><a href="<spring:url value="/"/>">Home</a></li>

			<sec:authorize url="/employee">
				<li><a href="<spring:url value="/employee"/>">Employee</a></li>
			</sec:authorize>

			<sec:authorize url="/staff">
				<li><a href="<spring:url value="/staff"/>">HR Staff</a></li>
			</sec:authorize>

			<sec:authorize url="/department">
				<li><a href="<spring:url value="/department"/>">Department</a></li>
			</sec:authorize>

			<sec:authorize url="/admin">
				<li><a href="<spring:url value="/admin"/>">Admin</a></li>
			</sec:authorize>

		</ul>

		<sec:authorize access="authenticated" var="authenticated">
			<c:choose>
				<c:when test="${authenticated}">

					<ul class="nav navbar-nav navbar-right">
						<li><a style="text-align: center; color: white"> Payroll:
								<sec:authentication property="name" />
						</a></li>
						<li><a id="logout" href="#" style="text-align: center; color: white"><span
								class="glyphicon glyphicon-log-out"></span>Log out </a>
							<form id="logout-form" action="<spring:url value="/logout"/>"
								method="post">
								<sec:csrfInput />
							</form></li>
					</ul>
				</c:when>
			</c:choose>
		</sec:authorize>

	</div>

</nav>
