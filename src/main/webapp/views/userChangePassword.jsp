<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${param.page eq 'admin'?'Admin ':'User '}Change
	&nbsp;password</title>
</head>
<body>
	<!-- Header Jsp  -->
	<%@ include file="header.jsp"%>
	<div style="width: 80%; height: 80%; margin: 0 auto;">
		<section>
			<h2 class="cen">${param.page eq 'admin'?'Admin ':'User '}Change
				password</h2>
			<c:if test="${not empty error}">
				<span class="error">Error: ${error}</span>
			</c:if>
			<form method="POST" class="cen"
				action="${pageContext.request.contextPath}/doChangeUserPassword">
				<input hidden="true" name="userId" value="${param.userId}"></input>
				<table>
					<tr>
						<td class="flt_rght">password :</td>
						<td><input type="password" id="passwordString"
							placeholder="Enter password" name="passwordString" required
							class="inp"></input></td>
					</tr>
					<tr>
						<td class="flt_rght">Confirm Password :</td>
						<td><input type="password" id="confirmPasswordString"
							placeholder="Enter confirm password" name="confirmPasswordString"
							required class="inp"></input></td>
					</tr>
					<c:if test="${param.page eq 'admin'}">
						<input hidden="true" name="page" value="${param.page}"></input>

						<tr>
							<td class="flt_rght">DBA password :</td>
							<td><input type="password" placeholder="Enter DBA password"
								name="dbaPwd" required class="inp"></input></td>
						</tr>
						<tr>
							<td class="flt_rght">Confirm DBA password :</td>
							<td><input type="password"
								placeholder="Enter confirm DBA password" name="confDbaPwd"
								required class="inp"></input></td>
						</tr>

					</c:if>
				</table>
				<input type="submit" value="Submit" class="sub-btn" />
			</form>
		</section>
	</div>
	<!-- footer Jsp -->
	<%@ include file="footer.jsp"%>
</body>
</html>