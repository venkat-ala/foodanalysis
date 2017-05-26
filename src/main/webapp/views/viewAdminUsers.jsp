<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User List</title>
</head>

<%@ include file="header.jsp"%>


<span>${info}</span>
<br />
<a
	href="${pageContext.request.contextPath}/views/adminUserDashboard.jsp"
	class="btn btn-info" role="button">Back</a>
<div class="col-sm-9">
	<div class="table-responsive">
		<table border="2" width="70%" cellpadding="2" class="table">
			<tr>
				<th>Sl.No</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
			<c:forEach var="user" items="${adminUserList}" varStatus="cnt">
				<tr>
					<td>${cnt.count}</td>
					<td>${user.firstName}</td>
					<td>${user.lastName}</td>
					<td>${user.email}</td>
					<td>${user.isActive?'Active':'Inactive'}</td>
					<td><a
						href="${pageContext.request.contextPath}/adminUserStsUpdate/${user.id}?sts=${user.isActive?'false':'true'}">${user.isActive?'Inactivate':'Activate'}</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>