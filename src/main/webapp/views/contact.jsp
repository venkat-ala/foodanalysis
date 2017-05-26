<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FAS-Contact</title>
</head>
<body>
	<!-- Header Jsp  -->
	<%@ include file="header.jsp"%>
	<div style="width: 80%; height: 80%; margin: 0 auto;">
		<section>
			<c:if test="${not empty info}">
				<span>${info}</span>
			</c:if>
			<c:if test="${not empty error}">
				<span class="error">${error}</span>
			</c:if>
			<br />
			<br />
			<div class="col-sm-7">
				<form method="post"
					action="${pageContext.request.contextPath}/contactusSendEmail">
					<table>
						<tr>
							<td>From Email :</td>
							<td><input type="email" name="fromEmail" id="fromEmail"
								required></td>
						</tr>
						<tr>
							<td>To Email :</td>
							<td><input type="email" name="toEmail" id="toEmail" required></td>
						</tr>
					</table>
					<br />
					<textarea rows="10" cols="50" required="required" name="cQuery"
						id="cQuery"
						placeholder="Please ask your question here in 50-100 words and you can send it to any of the recipient mentioned below"></textarea>
					<br /> <input type="submit" name="loginBtn" value="Submit" /> <br />
				</form>
				<br />
				<div class="table-responsive">
					<table border="2" width="70%" cellpadding="2" class="table">
						<tr>
							<th>Sl.No</th>
							<th>Name</th>
							<th>Email</th>
							<th>phone</th>
						</tr>
						<c:forEach var="contactus" items="${contactus}" varStatus="cnt">
							<tr>
								<td>${cnt.count}</td>
								<td>${contactus.name}</td>
								<td>${contactus.email}</td>
								<td>${contactus.phone}</td>
							</tr>
						</c:forEach>
					</table>
				</div>

			</div>
		</section>
	</div>
	<!-- footer Jsp -->
	<%@ include file="footer.jsp"%>
</body>
</html>