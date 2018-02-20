<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png" />
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Case Management</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<!-- Bootstrap core CSS     -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<!--  Case Management CSS    -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/material-dashboard.css?v=1.2.0"
	rel="stylesheet" />
<!--  CSS for Demo Purpose, don't include it in your project     -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/demo.css"
	rel="stylesheet" />
<!--     Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>
</head>

<body>
<div class="main-panel">
	<div class="content">
		<div class="container-fluid">
			<div class="row">

				<div class="col-lg-6">
					<div class="card card-stats">
						<div class="card-header" data-background-color="orange">
							<i class="material-icons">track_changes</i>
						</div>
						<div class="card-content">
							<form style="margin: 20px;" class="form-horizontal" role="form"
								action="j_spring_security_check" method="post">
								<div class="form-group">
									<label for="j_username" class="col-sm-2 control-label"></label>

									<div class="col-sm-6">
										<input type="text" class="form-control" id="j_username"
											name="j_username" required placeholder="User Name" autofocus>
									</div>
								</div>
								<div class="form-group">
									<label for="j_password" class="col-sm-5 control-label"></label>

									<div class="col-sm-6">
										<input type="password" class="form-control" id="j_password"
											name="j_password" placeholder="Password" required>
									</div>
								</div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />

								<button class="btn btn-primary btn-default pull-right"
									name="submit" type="submit">Sign in</button>
							</form>
						</div>
					</div>
				</div>





			</div>
		</div>
		<footer class="footer"> </footer>
	</div>
	</div>
</body>
<!--   Core JS Files   -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/jquery-3.2.1.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/material.min.js"
	type="text/javascript"></script>
<!--  Charts Plugin -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/chartist.min.js"></script>
<!--  Dynamic Elements plugin -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/arrive.min.js"></script>
<!--  PerfectScrollbar Library -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/perfect-scrollbar.jquery.min.js"></script>
<!--  Notifications Plugin    -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-notify.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Case Management javascript methods -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/material-dashboard.js?v=1.2.0"></script>
<!-- Case Management DEMO methods, don't include it in your project! -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/demo.js"></script>

</html>