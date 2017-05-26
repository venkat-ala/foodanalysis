<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${param.page eq 'admin'?'Admin ':'User '}login</title>
</head>
<body>
	<!-- Header Jsp  -->
	<%@ include file="header.jsp"%>
	<div style="width: 80%; height: 80%; margin: 0 auto;">
		<section>
			${param.req_log eq 'y'?'You need to login to access the page':''}
			<h2 class="cen">${param.page eq 'admin'?'Admin ':'User '}login</h2>
			<c:if test="${not empty error}">
				<span class="error">Error: ${error}</span>
			</c:if>
			<form method="post" class="cen"
				action="${pageContext.request.contextPath}/doLogin">
				<table>
					<tr>
						<td class="flt_rght">Email :</td>
						<td><input type="email" id="email" name="email" required
							placeholder="Enter email" class="inp"></td>
					</tr>
					<tr>
						<td class="flt_rght">Password :</td>
						<td><input type="password" id="password" name="password"
							placeholder="Enter password" class="inp"></td>
					</tr>
					<c:if test="${page eq 'admin'}">
						<input hidden="true" id="page" name="page" value="${param.page}"></input>
						<tr>
							<td class="flt_rght">DBA Password :</td>
							<td><input type="password" name="dbapassword"
								placeholder="Enter DBA password" class="inp"></td>
						</tr>
					</c:if>
				</table>
				<a class="mar-lft-125"
					href="${pageContext.request.contextPath}/views/userForgotPwd.jsp?page=${page}">Forgot
					Password?</a> <br /> <input type="submit" name="loginBtn"
					value="Submit" class="sub-btn" /> <a
					href="${pageContext.request.contextPath}" role="button">Back</a>
			</form>


		</section>
	</div>
	<!-- footer Jsp -->
	<%@ include file="footer.jsp"%>
</body>
</html>
