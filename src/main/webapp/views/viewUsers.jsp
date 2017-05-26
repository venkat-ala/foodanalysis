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
	<div style="width: 90%; margin: 0 auto;">
		<section>
			<c:if test="${not empty info}">
				<span class="alert alert-success">${info eq 'user_upd_success'? 'user updated successfully': info}</span>
			</c:if>
			<h2 class="cen">Update DB</h2>
			<div style="width: 90%; height: 90%; overflow: auto;"
				class="mar-lft-50">
				<table border="2" width="90%" cellpadding="2"
					class="grid mar-lft-50">
					<thead>
						<tr>
							<td index=0><span>Last Updated on </span> <c:if
									test="${param.fil eq 'en'}">
									<span class="glyphicon glyphicon-collapse-down"></span>
								</c:if>
								<div class="filter"></div></td>
							<td index=1><span>Status</span> <c:if
									test="${param.fil eq 'en'}">
									<span class="glyphicon glyphicon-collapse-down"></span>
								</c:if>
								<div class="filter"></div></td>
							<td index=2><span>Name</span> <c:if
									test="${param.fil eq 'en'}">
									<span class="glyphicon glyphicon-collapse-down"></span>
								</c:if>
								<div class="filter"></div></td>
							<td index=3><span>Email</span> <c:if
									test="${param.fil eq 'en'}">
									<span class="glyphicon glyphicon-collapse-down"></span>
								</c:if>
								<div class="filter"></div></td>
							<td index=4><span>Role</span> <c:if
									test="${param.fil eq 'en'}">
									<span class="glyphicon glyphicon-collapse-down"></span>
								</c:if>
								<div class="filter"></div></td>
							<td index=5><span>password</span> <c:if
									test="${param.fil eq 'en'}">
									<span class="glyphicon glyphicon-collapse-down"></span>
								</c:if>
								<div class="filter"></div></td>
							<td index=6><span>DBA password</span> <c:if
									test="${param.fil eq 'en'}">
									<span class="glyphicon glyphicon-collapse-down"></span>
								</c:if>
								<div class="filter"></div></td>
							<td index=7>Actions
								<div></div>
							</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${userList}" varStatus="cnt">
							<tr>
								<td><fmt:formatDate pattern="h:m a--dd-MMM-yyyy"
										value="${user.lastUpdatedOn}" /></td>
								<td>${user.status}</td>
								<td>${user.name}</td>
								<td>${user.email}</td>
								<td>${user.role}</td>
								<td>${user.passwordString}</td>
								<td>${user.dbaPasswordString}</td>
								<td><div class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown"
											role="button" aria-haspopup="true" aria-expanded="false">Actions
											<span class="caret"></span>
										</a>
										<ul class="dropdown-menu">
											<li><a
												href="${pageContext.request.contextPath}/userprofile/${user.id}?page=adminEdit">Change</a></li>
											<li><a
												href="${pageContext.request.contextPath}/userStatusUpdate/${user.id}?sts=d">Delete</a></li>
											<li><a
												href="${pageContext.request.contextPath}/viewUsers?fil=en">Query</a></li>
										</ul>
									</div></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<c:if test="${param.fil eq 'en'}">
					<script type="text/javascript">
						$(document).ready(function() {

							$(".grid thead td").click(function() {
								showFilterOption(this);
							});

						});

						var arrayMap = {};

						function showFilterOption(tdObject) {
							var filterGrid = $(tdObject).find(".filter");

							if (filterGrid.is(":visible")) {
								filterGrid.hide();
								return;
							}

							$(".filter").hide();

							var index = 0;
							filterGrid.empty();
							var allSelected = true;
							filterGrid
									.append('<div><input id="all" type="checkbox" checked>Select All</div>');

							var $rows = $(tdObject).parents("table").find(
									"tbody tr");

							$rows
									.each(function(ind, ele) {
										var currentTd = $(ele).children()[$(
												tdObject).attr("index")];
										var div = document.createElement("div");
										div.classList.add("grid-item")
										var str = $(ele).is(":visible") ? 'checked'
												: '';
										if ($(ele).is(":hidden")) {
											allSelected = false;
										}
										div.innerHTML = '<input type="checkbox" '+str+' >'
												+ currentTd.innerHTML;
										filterGrid.append(div);
										arrayMap[index] = ele;
										index++;
									});

							if (!allSelected) {
								filterGrid.find("#all").removeAttr("checked");
							}

							filterGrid
									.append('<div><input id="close" type="button" value="Close"/><input id="ok" type="button" value="Ok"/></div>');
							filterGrid.show();

							var $closeBtn = filterGrid.find("#close");
							var $okBtn = filterGrid.find("#ok");
							var $checkElems = filterGrid
									.find("input[type='checkbox']");
							var $gridItems = filterGrid.find(".grid-item");
							var $all = filterGrid.find("#all");

							$closeBtn.click(function() {
								filterGrid.hide();
								return false;
							});

							$okBtn.click(function() {
								filterGrid.find(".grid-item").each(
										function(ind, ele) {
											if ($(ele).find("input").is(
													":checked")) {
												$(arrayMap[ind]).show();
											} else {
												$(arrayMap[ind]).hide();
											}
										});
								filterGrid.hide();
								return false;
							});

							$checkElems.click(function(event) {
								event.stopPropagation();
							});

							$gridItems.click(function(event) {
								var chk = $(this)
										.find("input[type='checkbox']");
								$(chk).prop("checked", !$(chk).is(":checked"));
							});

							$all.change(function() {
								var chked = $(this).is(":checked");
								filterGrid.find(".grid-item [type='checkbox']")
										.prop("checked", chked);
							})

							filterGrid.click(function(event) {
								event.stopPropagation();
							});

							return filterGrid;
						}
					</script>
				</c:if>




				<!-- food items manage start -->
				<div class="col-sm-12 mar-top-125"></div>
				<h4>Food Items</h4>
				<a
					href="${pageContext.request.contextPath}/createFoodItem?page=viewusers">Create
					Food Item</a>
				<c:if test="${empty foodItems}">
					No records found.
					</c:if>
				<c:if test="${not empty foodItems}">
					<table border="1" cellpadding="5" class="grid mar-lft-50 ">
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
												href="${pageContext.request.contextPath}/foodItem/${searchItem.id}?page=viewusers">Change</a></li>
											<li><a
												href="${pageContext.request.contextPath}/deleteFoodItems/${searchItem.id}?page=viewusers">Delete</a></li>
										</ul>
									</div></td>
							</tr>
						</c:forEach>
					</table>
				</c:if>

				<!-- food items manage end -->

				<!-- contact us start -->
				<h4>Contact us</h4>
				<table border="1" cellpadding="5" class="grid mar-lft-50 ">
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
				<!-- contact us end -->

			</div>
		</section>
	</div>
	<!-- footer Jsp -->
	<%@ include file="footer.jsp"%>
</body>
</html>