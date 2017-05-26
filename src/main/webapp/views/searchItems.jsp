<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FAS-Contact</title>
</head>
<body>
	<!-- Header Jsp  -->
	<%@ include file="header.jsp"%>
	<div style="width: 90%; height: 80%; margin: 0 auto;">
		<section>
			<div class="col-sm-12">
				<div class="col-sm-7">
					<span>${searchInfo}</span> <br /> <br />
					<form action="${pageContext.request.contextPath}/searchItem"
						method="get">
						<c:choose>
							<c:when test="${view ne 'view1'}">
								Search : <input type="text" id="search" name="search" required
									placeholder="Enter Item">
							</c:when>
							<c:otherwise>
								<input hidden="true" name="search" value="${param.search}"></input>
								<input hidden="true" name="view" value="${view}"></input>
								Ingredient 1  : <input type="text" name="ing1" required>
								<br />
								Ingredient 2  : <input type="text" name="ing2" required>
								<br />
							</c:otherwise>
						</c:choose>
						<input type="submit" value="Search" />
						<c:if test="${view ne 'view1'}">
							<a
								href="${pageContext.request.contextPath}/views/userDashboard.jsp">Back</a>
						</c:if>
						<c:if test="${view eq 'view1'}">
							<a
								href="${pageContext.request.contextPath}/views/searchItems.jsp">Back</a>
						</c:if>
					</form>
				</div>
			</div>
			<div class="col-sm-12">
				<c:if test="${param.search ne null}">
					<h2>${view eq 'view1' and param.ing1 ne null?'Ingredient 1 : ':''}</h2>
					<c:if test="${empty search1 and param.ing1 ne null}">
					No records found.
					</c:if>
					<c:if test="${not empty search1}">
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
								<th>BMI-status</th>
							</tr>
							<c:forEach var="searchItem" items="${search1}" varStatus="cnt">
								<tr>
									<td><c:out value="${cnt.count}" /></td>
									<td><c:out value="${searchItem.name}" /></td>
									<td><c:out value="${searchItem.fats}" /></td>
									<td><c:out value="${searchItem.proteins}" /></td>
									<td><c:out value="${searchItem.carbohydrates}" /></td>
									<td><c:out value="${searchItem.vitamins}" /></td>
									<td><c:out value="${searchItem.sugar}" /></td>
									<td><c:out value="${searchItem.calorie}" /></td>
									<td><c:out value="${searchItem.benefits}" /></td>
									<td><c:out value="${searchItem.disadvantages}" /></td>
									<td><c:out
											value="${(searchItem.bmiStart<=(sessionScope.user.bmi) and (sessionScope.user.bmi)<=searchItem.bmiEnd)?'good':'bad'}" /></td>
								</tr>
							</c:forEach>
						</table>
					</c:if>

					<h2>${view eq 'view1' and param.ing2 ne null?'Ingredient 2 : ':''}</h2>
					<c:if test="${empty search2 and param.ing2 ne null}">
					No records found.
					</c:if>
					<c:if test="${not empty search2}">
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
								<th>BMI-status</th>
							</tr>
							<c:forEach var="searchItem" items="${search2}" varStatus="cnt">
								<tr>
									<td><c:out value="${cnt.count}" /></td>
									<td><c:out value="${searchItem.name}" /></td>
									<td><c:out value="${searchItem.fats}" /></td>
									<td><c:out value="${searchItem.proteins}" /></td>
									<td><c:out value="${searchItem.carbohydrates}" /></td>
									<td><c:out value="${searchItem.vitamins}" /></td>
									<td><c:out value="${searchItem.sugar}" /></td>
									<td><c:out value="${searchItem.calorie}" /></td>
									<td><c:out value="${searchItem.benefits}" /></td>
									<td><c:out value="${searchItem.disadvantages}" /></td>
									<td><c:out
											value="${(searchItem.bmiStart<=(sessionScope.user.bmi) and (sessionScope.user.bmi)<=searchItem.bmiEnd)?'good':'bad'}" /></td>
								</tr>
							</c:forEach>
						</table>
					</c:if>

				</c:if>
			</div>
		</section>
	</div>
	<!-- footer Jsp -->
	<%@ include file="footer.jsp"%>
</body>
</html>