<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FoodItem Edit</title>
</head>
<body>
	<!-- Header Jsp  -->
	<%@ include file="header.jsp"%>
	<div style="width: 100%; height: 100%; margin: 0 auto; overflow: auto;">
		<section>
			<h2 class="cen">FoodItem Edit</h2>

			<form:form method="POST" cssClass="cen"
				action="${pageContext.request.contextPath}/doUpdateSearchItem"
				modelAttribute="foodItem">
				<c:if test="${not empty error}">
					<span class="error">Error: ${error}</span>
				</c:if>
				<input hidden="true" id="page" name="page" value="${param.page}"></input>
				<form:hidden path="id" />
				<table>
					<tr>
						<td class="flt_rght">Name <span class="req_start">*</span> :
						</td>
						<td><form:input placeholder="Apple" path="name"
								required="required" cssClass="inp" /></td>
						<td><form:errors path="name" cssClass="error" /></td>
					</tr>
					<tr>
						<td class="flt_rght">Fats <span class="req_start">*</span> :
						</td>
						<td><form:input path="fats" required="required"
								placeholder="0.2g" cssClass="inp" /></td>
						<td><form:errors path="fats" cssClass="error" /></td>
					</tr>
					<tr>
						<td class="flt_rght">Proteins <span class="req_start">*</span>
							:
						</td>
						<td><form:input path="proteins" required="required"
								placeholder="0.2g" cssClass="inp" /></td>
						<td><form:errors path="proteins" cssClass="error" /></td>
					</tr>

					<tr>
						<td class="flt_rght">Carbohydrates <span class="req_start">*</span>
							:
						</td>
						<td><form:input path="carbohydrates" required="required"
								placeholder="0.2g" cssClass="inp" /></td>
						<td><form:errors path="carbohydrates" cssClass="error" /></td>
					</tr>
					<tr>
						<td class="flt_rght">Vitamins <span class="req_start">*</span>
							:
						</td>
						<td><form:input path="vitamins" required="required"
								placeholder="1%" cssClass="inp" /></td>
						<td><form:errors path="vitamins" cssClass="error" /></td>
					</tr>
					<tr>
						<td class="flt_rght">Sugar <span class="req_start">*</span> :
						</td>
						<td><form:input path="sugar" required="required"
								placeholder="2g" cssClass="inp" /></td>
						<td><form:errors path="sugar" cssClass="error" /></td>
					</tr>
					<tr>
						<td class="flt_rght">Calorie <span class="req_start">*</span>
							:
						</td>
						<td><form:input path="calorie" required="required"
								placeholder="52" cssClass="numeric inp" /></td>
						<td><form:errors path="calorie" cssClass="error" /></td>
					</tr>
					<tr>
						<td class="flt_rght">Benefits <span class="req_start">*</span>
							:
						</td>
						<td><form:textarea path="benefits" required="required"
								rows="10" cols="50"
								placeholder="Apples are extremely rich in important antioxidants, flavanoids, and dietary fiber. "
								cssClass="  inp" /></td>
						<td><form:errors path="benefits" cssClass="error" /></td>
					</tr>
					<tr>
						<td class="flt_rght">Disadvantages <span class="req_start">*</span>
							:
						</td>
						<td><form:textarea path="disadvantages" required="required"
								rows="10" cols="50"
								placeholder="High in Sugar, so Sugar patients avoid Apples"
								cssClass="  inp" /></td>
						<td><form:errors path="disadvantages" cssClass="error" /></td>
					</tr>
					<tr>
						<td class="flt_rght">BMI Start :</td>
						<td><form:input path="bmiStart" cssClass="numeric inp"
								required="required" placeholder="2" /></td>
						<td><form:errors path="bmiStart" cssClass="error" /></td>
					</tr>
					<tr>
						<td class="flt_rght">BMI End :</td>
						<td><form:input path="bmiEnd" cssClass="numeric inp"
								required="required" placeholder="10" /></td>
						<td><form:errors path="bmiEnd" cssClass="error" /></td>
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