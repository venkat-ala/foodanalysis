<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update DB</title>
<style type="text/css">
table thead tr td {
	min-width: 100px;
	position: relative;
}

.filter {
	position: absolute;
	border: solid 1px;
	top: 20px;
	background-color: white;
	width: 200px;
	right: 0;
	display: none;
	overflow: auto;
	height: 400px;
}

.mar-lft-50 {
	margin-left: 50px;
}
</style>
</head>
<body>
	<!-- Header Jsp  -->
	<%@ include file="header.jsp"%>
	<div style="width: 90%; height: 80%; margin: 0 auto;">
		<section>
			<h2>Welcome ${sessionScope.user.name}</h2>
			<br />
			<c:if test="${not empty info}">
				<span class="alert alert-success">${info}</span>
			</c:if>
			<c:if test="${param.suc eq 'usr_upd_suc'}">
				<span class="alert alert-success">User updated successfully</span>
			</c:if>
			<br /> <br />
			<c:if test="${sessionScope.user.role eq 'user'}">
				<a href="${pageContext.request.contextPath}/views/searchItems.jsp">Search
					Items</a>
			</c:if>
			<c:if test="${sessionScope.user.role eq 'admin'}">
				<a href="${pageContext.request.contextPath}/manageFoodItems">Manage
					Food Items</a>
			</c:if>
		</section>
	</div>
	<!-- footer Jsp -->
	<%@ include file="footer.jsp"%>
</body>
</html>