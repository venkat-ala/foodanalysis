<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${param.page eq 'admin'?'Admin ':'User '}Profile</title>
</head>
<body>
	<!-- Header Jsp  -->
	<%@ include file="header.jsp"%>
	<div style="width: 80%; height: 80%; margin: 0 auto;">
		<section>
			<h2 class="cen">${param.page eq 'admin'?'Admin ':'User '}
				Profile</h2>

			<form:form method="POST" cssClass="cen"
				action="${pageContext.request.contextPath}/doUpdateUser"
				modelAttribute="user">
				<c:if test="${not empty error}">
					<span class="error">Error: ${error}</span>
				</c:if>
				<input hidden="true" id="page" name="page" value="${param.page}"></input>
				<form:hidden path="id" />
				<table>
					<tr>
						<td class="flt_rght">Name <span class="req_start">*</span> :
						</td>
						<td><form:input placeholder="Enter Name" path="name"
								required="required" cssClass="inp" /></td>
						<td><form:errors path="name" cssClass="error" /></td>
					</tr>
					<tr>
						<td class="flt_rght">User Id/Email <span class="req_start">*</span>
							:
						</td>
						<td><form:input path="email" type="email" required="required"
								placeholder="Enter email" cssClass="inp" readonly="true" /></td>
						<td><form:errors path="email" cssClass="error" /></td>
					</tr>
					<tr>
						<td class="flt_rght">Gender :</td>
						<td><form:select path="Gender" cssClass="inp">
								<form:option value="NONE" label="--- Select ---" />
								<form:option value="MALE" label="Male" />
								<form:option value="FEMALE" label="Female" />
							</form:select></td>
						<td><form:errors path="gender" cssClass="error" /></td>
					</tr>
					<tr>
						<td class="flt_rght">Age <span class="req_start">*</span> :
						</td>
						<td><form:select path="age" required="required"
								cssClass="inp" aria-required="true">
								<form:option value="" label="Choose" />
								<form:option value="Between 18 to 30" label="Between 18 to 30" />
								<form:option value="Between 31 to 50" label="Between 31 to 50" />
								<form:option value="Between 51 to 70" label="Between 51 to 70" />
								<form:option value="70 and above" label="70 and above" />
							</form:select></td>
						<td><form:errors path="age" cssClass="error" /></td>
					</tr>
					<tr>
						<td class="flt_rght">Weight :</td>
						<td><form:input path="weight" cssClass="numeric inp"
								placeholder="In Kgs" /></td>
						<td><form:errors path="weight" cssClass="error" /></td>
					</tr>
					<tr>
						<td class="flt_rght">Height :</td>
						<td><form:input path="height" cssClass="numeric inp"
								placeholder="In Cms" /></td>
						<td><form:errors path="height" cssClass="error" /></td>
					</tr>
					<tr>
						<td class="flt_rght">Any Alergies :</td>
						<td><form:input path="alergies" placeholder="Enter alergies"
								cssClass="inp" /></td>
					</tr>
					<tr>
						<td class="flt_rght">Phone :</td>
						<td><form:input path="phone" cssClass="numeric inp"
								placeholder="Enter phone" /></td>
						<td><form:errors path="phone" cssClass="error" /></td>
					</tr>
					<tr style="text-align: center;">
						<td>Security Questions<br /></td>
					</tr>
					<tr>
						<td class="flt_rght">Favourite friend name? <span
							class="req_start">*</span>:
						</td>
						<td><form:input path="favFriendName" required="required"
								cssClass="inp" /></td>
						<td><form:errors path="favFriendName" cssClass="error" /></td>
					</tr>
					<tr>
						<td class="flt_rght">Favourite movie? <span class="req_start">*</span>
							:
						</td>
						<td><form:input path="favMovieName" placeholder=""
								required="required" cssClass="inp" /></td>
						<td><form:errors path="favMovieName" cssClass="error" /></td>
					</tr>
				</table>
				<input type="submit" value="Submit" class="sub-btn" />
				<c:if test="${param.page eq null}">
					<a
						href="${pageContext.request.contextPath}/views/userDashboard.jsp">Back</a>
				</c:if>
				<c:if test="${param.page ne null}">
					<a href="${pageContext.request.contextPath}/viewUsers">Back</a>
				</c:if>
			</form:form>
			<script type="text/javascript">
				$(".numeric")
						.keypress(
								function(e) {
									$(e.target).parent().find('.error')
											.remove();
									if (e.which != 8 && e.which != 0
											&& (e.which<48 || e.which >57)) {
										$(e.target)
												.parent()
												.append(
														$('<span class="error"> Numbers only</span>'));
										return false;
									}
								});
			</script>

		</section>
	</div>
	<!-- footer Jsp -->
	<%@ include file="footer.jsp"%>
</body>
</html>