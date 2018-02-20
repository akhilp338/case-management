<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/tasks" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/assets/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Case Management </title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <!-- Bootstrap core CSS     -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <!--  Case Management CSS    -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/material-dashboard.css?v=1.2.0" rel="stylesheet" />
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/demo.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
</head>

<body>
    <div class="wrapper">
        <div class="sidebar" data-color="purple" data-image="https://seekcdn.com/pacman/company-profiles/logos/433004/ing-direct-logo.jpg">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

        Tip 2: you can also add an image using data-image tag
    -->
            <div class="logo">
                <a href="http://localhost:8081/activiti-example/login.htm" class="simple-text">
                    Case Management
                </a>
            </div>
            <div class="sidebar-wrapper">
                <ul class="nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/index.htm">
                            <i class="material-icons">dashboard</i>
                            <p>Dashboard</p>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/alert-page.htm">
                            <i class="material-icons">person</i>
                            <p>Alerts</p>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/document/list.htm">
                            <i class="material-icons">content_paste</i>
                            <p>Cases</p>
                        </a>
                    </li>
                    <li  class="active">
                        <a href="${pageContext.request.contextPath}/tasks.htm">
                            <i class="material-icons">library_books</i>
                            <p>Tasks</p>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/workflow/index.htm">
                            <i class="material-icons">bubble_chart</i>
                            <p>Work flow</p>
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/users.htm">
                            <i class="material-icons">location_on</i>
                            <p>Users</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <nav class="navbar navbar-transparent navbar-absolute">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="material-icons">dashboard</i>
                                    <p class="hidden-lg hidden-md">Dashboard</p>
                                </a>
                            </li>
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
									</c:choose> <span id="alertCount"> <span
										class="notification">${fn:length(alerts)}</span>
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
                            <li>
                                <a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="material-icons">person</i>
                                    <p class="hidden-lg hidden-md">Profile</p>
                                </a>
                            </li>
                        </ul>
                        <form class="navbar-form navbar-right" role="search">
                            <div class="form-group  is-empty">
                                <input type="text" class="form-control" placeholder="Search">
                                <span class="material-input"></span>
                            </div>
                            <button type="submit" class="btn btn-white btn-round btn-just-icon">
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
                                <div class="card-header" data-background-color="purple">
                                    <h4 class="title">Tasks</h4>
                                    <p class="category">${pageContext.request.remoteUser}</p>
                                </div>
                                <div class="card-content">
                                     <t:candidate candidateTasks="${candidateTasks}" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer">
                <div class="container-fluid">
                    <p class="copyright pull-right">
                        &copy;
                        <script>
                            document.write(new Date().getFullYear())
                        </script>
                        <a href="http://localhost:8081/activiti-example/login.htm">Case Management</a>, 
                    </p>
                </div>
            </footer>
        </div>
    </div>
</body>
<!--   Core JS Files   -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/material.min.js" type="text/javascript"></script>
<!--  Charts Plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/chartist.min.js"></script>
<!--  Dynamic Elements plugin -->
<script src="${pageContext.request.contextPath}/resources/assets/js/arrive.min.js"></script>
<!--  PerfectScrollbar Library -->
<script src="${pageContext.request.contextPath}/resources/assets/js/perfect-scrollbar.jquery.min.js"></script>
<!--  Notifications Plugin    -->
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-notify.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Case Management javascript methods -->
<script src="${pageContext.request.contextPath}/resources/assets/js/material-dashboard.js?v=1.2.0"></script>
<!-- Case Management DEMO methods, don't include it in your project! -->
<script src="${pageContext.request.contextPath}/resources/assets/js/demo.js"></script>

</html>