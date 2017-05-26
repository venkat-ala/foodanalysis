<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
ul.topnav {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: overflow !important;
}

ul.topnav li.left {
	float: left;
}

ul.topnav li.right {
	float: right;
}

ul.topnav li a {
	display: block;
	color: Black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

ul.topnav li a:hover:not (.active ) ul.topnav li a.active 

ul.topnav li.left {
	float: left;
}

ul.topnav li.right {
	float: right;
}

.error {
	color: #ff0000;
	font-style: italic;
}

.req_start {
	color: red;
	content: "*";
}

@media screen and (max-width: 600px) {
	ul.topnav li.left, ul.topnav li.right, ul.topnav li {
		float: none;
	}
}

.header {
	top: 10px;
}

.cen {
	margin: auto;
	width: 50%;
	padding: 10px;
}

.flt_rght {
	float: right;
}

.inp {
	margin: 0 0 10px 9px;
}

.mar-lft-125 {
	margin-left: 125px;
}

.mar-top-125 {
	margin-top: 125px;
}

.sub-btn {
	margin: 10 10px 0 100;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${pageContext.request.contextPath}"><img
				src="${pageContext.request.contextPath}/img/logo.png"
				style="height: 35px;" alt="Food analysis"></a> <a
				class="navbar-brand" href="${pageContext.request.contextPath}">Home</a>
			<c:if test="${sessionScope.user ne null}">
				<a class="navbar-brand"
					href="${pageContext.request.contextPath}/views/userDashboard.jsp">Dashboard</a>
			</c:if>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<c:if test="${sessionScope.user eq null}">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Login <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a
								href="${pageContext.request.contextPath}/userloginview">User
									Login</a></li>
							<li><a
								href="${pageContext.request.contextPath}/userloginview?page=admin">Admin
									Login</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Register <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a
								href="${pageContext.request.contextPath}/usrregistration">User
									Register</a></li>
							<li><a
								href="${pageContext.request.contextPath}/usrregistration?page=admin">Admin
									Register</a></li>
						</ul></li>
				</ul>
			</c:if>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Reports <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<c:if test="${sessionScope.user.role eq 'admin'}">
							<li><a href="${pageContext.request.contextPath}/viewUsers">Update
									DB</a></li>
						</c:if>
						<c:if test="${sessionScope.user.role eq 'user'}">
							<li><a
								href="${pageContext.request.contextPath}/userprofile/${sessionScope.user.id}">My
									Profile</a></li>
						</c:if>
						<c:if test="${sessionScope.user eq null}">
							<li><a
								href="${pageContext.request.contextPath}/userloginview?page=admin&req_log=y">Update
									DB</a></li>
							<li><a
								href="${pageContext.request.contextPath}/userloginview?req_log=y">My
									Profile</a></li>
						</c:if>
					</ul></li>
				<c:if test="${sessionScope.user ne null}">
					<li><a href="${pageContext.request.contextPath}/logout">logout</a></li>
				</c:if>
				<li><a
					href="${pageContext.request.contextPath}/views/aboutus.jsp">About
						us</a></li>
				<li><a href="${pageContext.request.contextPath}/contactus">Contact
						us</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
