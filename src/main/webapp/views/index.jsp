<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Food Analysis</title>
</head>
<body>
	<!-- Header Jsp  -->
	<%@ include file="header.jsp"%>

	<span>${param.msg eq 'pwd_suc'?'Password changed successfully':''}</span>
	<div style="width: 80%; height: 80%; margin: 0 auto;">
		<div style="text-align: center;">
			<h2>Food Analysis</h2>
		</div>
		<br />
		<section>
			<span style="width: 50%; float: right"> <!--  <img src="img/ingredients.jpg" alt=""> -->
			</span>

			<div style="width: 40%; float: left">
				<h2>
					<strong>Follow a Heart-Healthy Diet</strong>
				</h2>
				<ul>
					<li><em><span>Eat more fruits and veggies.</span></em></li>
					<li><em><span>Choose whole grains. Try brown rice
								instead of white. Switch to whole wheat pasta.</span></em></li>
					<li><em><span>Choose lean proteins like poultry,
								fish, beans, and legumes.</span></em></li>
					<li><em><span>Cut down on processed foods, sugar,
								salt, and saturated fat.</span></em></li>
				</ul>
			</div>

		</section>

	</div>
	<!-- footer Jsp -->
	<%@ include file="footer.jsp"%>

</body>

</html>