<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${param.page eq 'admin'?'Admin ':'User '}Forgotpassword</title>
</head>
<body>
	<!-- Header Jsp  -->
	<%@ include file="header.jsp"%>
	<div style="width: 80%; height: 80%; margin: 0 auto; overflow: auto;">
		<section>
			<h2 class="cen">${param.page eq 'admin'?'Admin ':'User '}Forgot
				password</h2>
			<c:if test="${not empty error}">
				<span class="error">Error: ${error}</span>
			</c:if>
			<span>${info}</span>

			<form method="post" class="cen"
				action="${pageContext.request.contextPath}/forgotpwd">
				<input hidden="true" id="page" name="page" value="${param.page}"></input>
				<table>
					<tr>
						<td class="flt_rght">Email :</td>
						<td><input type="email" id="email" name="email" required
							class="inp" placeholder="Enter email"></td>
					</tr>
					<tr>
						<td class="flt_rght">Favourite friend name? :</td>
						<td><input name="favFriendName"
							placeholder="Enter friend name" class="inp" /></td>
					</tr>
					<tr>
						<td class="flt_rght">Favourite movie name? :</td>
						<td><input name="favMovieName" placeholder="Enter movie name"
							class="inp" /></td>
					</tr>
				</table>

				<input type="submit" name="loginBtn" value="Submit" class="sub-btn" />
				<a href="${pageContext.request.contextPath}/views/userLogin.jsp">Back</a>

			</form>
		</section>
	</div>
	<!-- footer Jsp -->
	<%@ include file="footer.jsp"%>
</body>
</html>