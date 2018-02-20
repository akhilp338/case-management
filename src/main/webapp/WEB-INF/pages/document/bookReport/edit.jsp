<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/tasks"%>
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

<style type="text/css">
@import url(//fonts.googleapis.com/css?family=Open+Sans);

body {
	margin: 5px 20px;
	font-family: 'Open Sans';
	font-weight: 300;
}

h2 {
	margin-bottom: 30px;
	color: #4679bd;
	font-weight: 400;
	text-align: center;
}

p.footer {
	margin-bottom: 20px;
	color: #999999;
	font-size: 18px;
	text-align: center;
}

/* -----------------------------------------------
 * Timeline
 * --------------------------------------------- */
.timeline {
	list-style: none;
	padding: 10px 0;
	position: relative;
	font-weight: 300;
	margin: 16px;
}

.fa {
	color: orange;
}

.timeline:before {
	top: 0;
	bottom: 0;
	position: absolute;
	content: " ";
	width: 2px;
	background: #ff9800;
	left: 50%;
	margin-left: -1.5px;
}

.timeline>li {
	margin-bottom: 20px;
	position: relative;
	width: 50%;
	float: left;
	clear: left;
}

.timeline>li:before, .timeline>li:after {
	content: " ";
	display: table;
}

.timeline>li:after {
	clear: both;
}

.timeline>li:before, .timeline>li:after {
	content: " ";
	display: table;
}

.timeline>li:after {
	clear: both;
}

.timeline>li>.timeline-panel {
	width: calc(100% - 25px);
	width: -moz-calc(100% - 25px);
	width: -webkit-calc(100% - 25px);
	float: left;
	border: 1px solid #dcdcdc;
	background: #ffffff;
	position: relative;
	box-shadow: 0 12px 20px -10px rgba(156, 39, 176, 0.28), 0 4px 20px 0px
		rgba(0, 0, 0, 0.12), 0 7px 8px -5px rgba(156, 39, 176, 0.2);
}

.timeline>li>.timeline-panel:before {
	position: absolute;
	top: 26px;
	right: -15px;
	display: inline-block;
	border-top: 15px solid transparent;
	border-left: 15px solid #dcdcdc;
	border-right: 0 solid #dcdcdc;
	border-bottom: 15px solid transparent;
	content: " ";
}

.timeline>li>.timeline-panel:after {
	position: absolute;
	top: 27px;
	right: -14px;
	display: inline-block;
	border-top: 14px solid transparent;
	border-left: 14px solid #ffffff;
	border-right: 0 solid #ffffff;
	border-bottom: 14px solid transparent;
	content: " ";
}

.timeline>li>.timeline-badge {
	color: #ffffff;
	width: 24px;
	height: 24px;
	line-height: 50px;
	text-align: center;
	position: absolute;
	top: 16px;
	right: -12px;
	z-index: 100;
}

.timeline>li.timeline-inverted>.timeline-panel {
	float: right;
}

.timeline>li.timeline-inverted>.timeline-panel:before {
	border-left-width: 0;
	border-right-width: 15px;
	left: -15px;
	right: auto;
}

.timeline>li.timeline-inverted>.timeline-panel:after {
	border-left-width: 0;
	border-right-width: 14px;
	left: -14px;
	right: auto;
}

.timeline-badge>a {
	color: #ffffff !important;
}

.timeline-badge a:hover {
	color: #dcdcdc !important;
}

.timeline-title {
	margin-top: 0;
	color: inherit;
}

.timeline-heading h4 {
	font-weight: 400;
	padding: 0 15px;
	color: #4679bd;
}

.timeline-body>p, .timeline-body>ul {
	padding: 10px 15px;
	margin-bottom: 0;
}

.timeline-footer {
	padding: 5px 15px;
	background-color: #f4f4f4;
}

.timeline-footer p {
	margin-bottom: 0;
}

.timeline-footer>a {
	cursor: pointer;
	text-decoration: none;
}

.timeline>li.timeline-inverted {
	float: right;
	clear: right;
}

.timeline>li:nth-child(2) {
	margin-top: 60px;
}

.timeline>li.timeline-inverted>.timeline-badge {
	left: -12px;
}

.no-float {
	float: none !important;
}

@media ( max-width : 767px) {
	ul.timeline:before {
		left: 40px;
	}
	ul.timeline>li {
		margin-bottom: 0px;
		position: relative;
		width: 100%;
		float: left;
		clear: left;
	}
	ul.timeline>li>.timeline-panel {
		width: calc(100% - 65px);
		width: -moz-calc(100% - 65px);
		width: -webkit-calc(100% - 65px);
	}
	ul.timeline>li>.timeline-badge {
		left: 28px;
		margin-left: 0;
		top: 16px;
	}
	ul.timeline>li>.timeline-panel {
		float: right;
	}
	ul.timeline>li>.timeline-panel:before {
		border-left-width: 0;
		border-right-width: 15px;
		left: -15px;
		right: auto;
	}
	ul.timeline>li>.timeline-panel:after {
		border-left-width: 0;
		border-right-width: 14px;
		left: -14px;
		right: auto;
	}
	.timeline>li.timeline-inverted {
		float: left;
		clear: left;
		margin-top: 30px;
		margin-bottom: 30px;
	}
	.timeline>li.timeline-inverted>.timeline-badge {
		left: 28px;
	}
}
</style>
</head>

<body>
	<div class="wrapper">
		<div class="sidebar" data-color="purple"
			data-image="https://seekcdn.com/pacman/company-profiles/logos/433004/ing-direct-logo.jpg">
			<!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
			<div class="logo">
				<a href="http://localhost:8081/activiti-example/login.htm" class="simple-text"> Case
					Management </a>
			</div>
			<div class="sidebar-wrapper">
				<ul class="nav">
					<li><a href="${pageContext.request.contextPath}/index.htm">
							<i class="material-icons">dashboard</i>
							<p>Dashboard</p>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/alert-page.htm"> <i
							class="material-icons">person</i>
							<p>Alerts</p>
					</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/document/list.htm"> <i
							class="material-icons">content_paste</i>
							<p>Cases</p>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/tasks.htm">
							<i class="material-icons">library_books</i>
							<p>Tasks</p>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/workflow/index.htm">
							<i class="material-icons">bubble_chart</i>
							<p>Work flow</p>
					</a></li>
					<li><a href="${pageContext.request.contextPath}/users.htm">
							<i class="material-icons">location_on</i>
							<p>Users</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<nav class="navbar navbar-transparent navbar-absolute">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="#pablo" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="material-icons">dashboard</i>
									<p class="hidden-lg hidden-md">Dashboard</p>
							</a></li>
							<li class="dropdown" id="nav-alerts"><a
								class="dropdown-toggle" data-toggle="dropdown"
								href="${pageContext.request.contextPath}/alerts.htm"> <c:choose>
										<c:when test="${not empty alerts}">
											<span style="color: red"><i class="material-icons">notifications</i>
											</span>
										</c:when>
										<c:otherwise>
											<i class="material-icons">notifications</i>
										</c:otherwise>
									</c:choose> <span id="alertCount"> <span class="notification">${fn:length(alerts)}</span>
								</span><b class="caret"></b></a>
								<ul id="alertMenuGroup"
									class="dropdown-menu list-group alert-dropdown">
									<c:choose>
										<c:when test="${empty alerts}">
											<li class="list-group-item">
												<div class="alert alert-info alert-dropdown-div">You
													have no alerts</div>
											</li>
										</c:when>
										<c:when test="${not empty alerts}">
											<c:forEach var="alert" items="${alerts}">
												<c:choose>
													<c:when test="${alert.priority == 1}">
														<c:set var="alertClass" value="alert-success" />
													</c:when>
													<c:when test="${alert.priority == 2}">
														<c:set var="alertClass" value="alert-info" />
													</c:when>
													<c:when test="${alert.priority == 3}">
														<c:set var="alertClass" value="alert-warning" />
													</c:when>
													<c:when test="${alert.priority == 4}">
														<c:set var="alertClass" value="alert-danger" />
													</c:when>
												</c:choose>
												<li class="alert list-group-item alert-dismissable"
													data-id="${alert.id}">
													<div class="alert-dropdown-div ${alertClass}">
														<button type="button" class="close" style="margin: 20px;"
															data-dismiss="alert" aria-hidden="true">&times;</button>
														<p class="list-group-item-text alert-date">
															Created: <strong><spring:eval
																	expression="alert.createdDate" /></strong>
														</p>
														<br />
														<p class="list-group-item-text">
															From: <strong>${alert.createdBy}</strong>
														</p>
														<br />
														<p class="list-group-item-text">${alert.message}</p>
														<br />
													</div>
												</li>
											</c:forEach>
										</c:when>
									</c:choose>

								</ul></li>
							<li><a href="#pablo" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="material-icons">person</i>
									<p class="hidden-lg hidden-md">Profile</p>
							</a></li>
						</ul>
						<form class="navbar-form navbar-right" role="search">
							<div class="form-group  is-empty">
								<input type="text" class="form-control" placeholder="Search">
								<span class="material-input"></span>
							</div>
							<button type="submit"
								class="btn btn-white btn-round btn-just-icon">
								<i class="material-icons">search</i>
								<div class="ripple-container"></div>
							</button>
						</form>
					</div>
				</div>
			</nav>
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">

							<div class="card">
								<div class="card-header" data-background-color="orange">
									<h4 class="title">Case Details / History</h4>
								</div>
								<div class="card-content table-responsive">
									<form:form cssStyle="margin: 20px" cssClass="form-horizontal"
										method="POST" commandName="document">
										<div class="form-group">
											<label for="docId" class="col-sm-2 control-label">ID</label>

											<div class="col-sm-10">
												<p id="docId" class="form-control-static">${document.id}</p>
											</div>
										</div>
										<div class="form-group">
											<label for="title" class="col-sm-2 control-label">Doc
												Title</label>

											<div class="col-sm-10">
												<form:input path="title" id="title" cssClass="form-control"
													autofocus="true" />
											</div>
										</div>
										<div class="form-group">
											<label for="author" class="col-sm-2 control-label">Author</label>

											<div class="col-sm-10">
												<form:input path="author" id="author"
													cssClass="form-control" readonly="true" />
											</div>
										</div>
										<div class="form-group" style="display: none;">
											<label for="groupId" class="col-sm-2 control-label">Group</label>

											<div class="col-sm-10">
												<form:input path="groupId" id="groupId"
													cssClass="form-control" readonly="true" />
											</div>
										</div>
										<div class="form-group">
											<label for="bookTitle" class="col-sm-2 control-label">Case
												Title</label>

											<div class="col-sm-10">
												<form:input cssClass="form-control" id="bookTitle"
													path="bookTitle" readonly="false" />
											</div>
										</div>
										<div class="form-group" style="display: none;">
											<label for="bookAuthor" class="col-sm-2 control-label">Book
												Author</label>

											<div class="col-sm-10">
												<form:input cssClass="form-control" id="bookAuthor"
													path="bookAuthor" readonly="false" />
											</div>
										</div>
										<div class="form-group">
											<label for="content" class="col-sm-2 control-label">Content</label>

											<div class="col-sm-10">
												<form:textarea cssClass="form-control" id="content"
													path="content" rows="6" readonly="false" />
											</div>
										</div>
										<div class="form-group">
											<label for="summary" class="col-sm-2 control-label">Summary</label>

											<div class="col-sm-10">
												<form:textarea cssClass="form-control" id="summary"
													path="summary" rows="3" readonly="false" />
											</div>
										</div>
										<div class="form-group">
											<label for="createdDate" class="col-sm-2 control-label">Created
												Date</label>

											<div class="col-sm-10">
												<form:input cssClass="form-control" id="createdDate"
													path="createdDate" readonly="true" />
											</div>
										</div>
										<div class="form-group">
											<label for="docState" class="col-sm-2 control-label">State</label>

											<div class="col-sm-10">
												<form:input cssClass="form-control" id="docState"
													path="docState" readonly="true" />
											</div>
										</div>
										<div class="form-group" style="display: none;">
											<label for="docType" class="col-sm-2 control-label">Case
												Type</label>

											<div class="col-sm-10">
												<form:input cssClass="form-control" id="docType"
													path="docType" readonly="true" />
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												<div class="checkbox">
													<label for="isSubmit"> <input name="isSubmit"
														id="isSubmit" type="checkbox"> Submit to Workflow?
													</label>
												</div>
											</div>
										</div>
										<div class="pull-right">
											<button type="submit" class="btn btn-primary btn-default">Update
												Document</button>
										</div>
										<%--<div class="pull-right">--%>
										<%--<button type="submit" class="btn btn-primary btn-lg">Submit for Approval</button>--%>
										<%--</div>--%>
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<t:historic tagList="${historicTasks}" document="${document}" />
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
<script
	src="https://cdn.jsdelivr.net/scrollreveal.js/3.3.1/scrollreveal.min.js"></script>

</html>