<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Food Items</title>
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
			<c:if test="${param.msg eq 'user_upd_success'}">
				<span class="alert alert-success">Food Item updated
					successfully</span>
			</c:if>
			<c:if test="${not empty info}">
				<span class="alert alert-success">${info}</span>
			</c:if>
			<h2 class="cen">Manage Food Items</h2>
			<div style="width: 100%; height: 90%; overflow: auto;"
				class="mar-lft-50">

				<a href="${pageContext.request.contextPath}/createFoodItem">Create
					Food Item</a>

				<c:if test="${empty foodItems}">
					No records found.
					</c:if>
				<c:if test="${not empty foodItems}">
					<table border="1" cellpadding="5">
						<tr>
							<th>Sl.no</th>
							<th>Name</th>
							<th>Fats</th>
							<th>Proteins</th>
							<th>Carbohydrates</th>
							<th>Vitamins</th>
							<th>Sugar</th>
							<th>Calorie</th>
							<th>Benefits</th>
							<th>Disadvantages</th>
							<th>BMI-Range</th>
							<th>Actions</th>
						</tr>
						<c:forEach var="searchItem" items="${foodItems}" varStatus="cnt">
							<tr>
								<td><c:out value="${cnt.count}" /></td>
								<td><c:out value="${searchItem.name}" /></td>
								<td><c:out value="${searchItem.fats}" /></td>
								<td><c:out value="${searchItem.proteins}" /></td>
								<td><c:out value="${searchItem.carbohydrates}" /></td>
								<td><c:out value="${searchItem.vitamins}" /></td>
								<td><c:out value="${searchItem.sugar}" /></td>
								<td><c:out value="${searchItem.calorie}" /></td>
								<td><div style="width: 250px">
										<c:out value="${searchItem.benefits}" />
									</div></td>
								<td><div style="width: 250px">
										<c:out value="${searchItem.disadvantages}" />
									</div></td>
								<td><c:out
										value="${searchItem.bmiStart}-${searchItem.bmiEnd}" /></td>
								<td><div class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown"
											role="button" aria-haspopup="true" aria-expanded="false">Actions
											<span class="caret"></span>
										</a>
										<ul class="dropdown-menu">
											<li><a
												href="${pageContext.request.contextPath}/foodItem/${searchItem.id}">Change</a></li>
											<li><a
												href="${pageContext.request.contextPath}/deleteFoodItems/${searchItem.id}">Delete</a></li>
										</ul>
									</div></td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</div>
		</section>
	</div>
	<!-- footer Jsp -->
	<%@ include file="footer.jsp"%>
</body>
</html>