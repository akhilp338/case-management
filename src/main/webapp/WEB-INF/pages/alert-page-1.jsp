<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags/tasks"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="fragments/head.jsp" />
<title>Alerts</title>
</head>

<body>
	<jsp:include page="fragments/navbar-top.jsp" />

	<div class="container">

		<div class="start-template">
			<c:if test="${error == true}">
				<div class="errorblock">
					<c:if test="${not empty errors}">
						<div class="errorBox">
							<c:forEach var="objError" items="${errors}">
                            ${objError.field} - ${objError.defaultMessage}<br>
							</c:forEach>
						</div>
					</c:if>
					<c:if test="${not empty errorMsg}">
						<div class="errorBox">
							<p>
								<strong>${errorMsg}</strong>
							</p>
						</div>
					</c:if>
				</div>
			</c:if>

			<c:if test="${not empty msg}">
				<div class="flash">
					<p>
						<strong>${msg}</strong>
					</p>
				</div>
			</c:if>
		</div>

		<t:candidate candidateTasks="${candidateTasks}" />
		<button type="button" class="btn btn-primary" onclick="getAlerts()"
			style="border-color: #204d74;">
			<a
				href="${pageContext.request.contextPath}/document/caseReport/create.htm"
				style="color: white;">Create Case</a>
		</button>
		<%-- <section>
			<!--for demo wrap-->
			<div class="tbl-header">
				<table cellpadding="0" cellspacing="0" border="0">
					<thead>
						<tr>
							<th></th>
							<th>alertId</th>
							<th>security Class</th>
							<th>Alert Text Id</th>
							<th>Instrument Id</th>
							<th>Party Id</th>
							<th>Party Name</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="tbl-content">
				<table cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<c:forEach items="${tradeAlerts}" var="mapElement">
							<tr>
								<td><input class="customClass" type="checkbox"
									value=${mapElement.alertId}></td>
								<td>${mapElement.alertId}</td>
								<td>${mapElement.securityClass}</td>

								<td>${mapElement.alertTextId}</td>
								<td>${mapElement.instrumentId}</td>

								<td>${mapElement.partyId}</td>
								<td>${mapElement.partyName}</td>


							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</section> --%>
	</div>

	<!-- new section -->
	<section class="mb-5">
		<!--Top Table UI-->
		<div class="card p-2 mb-5">

			<!--Grid row-->
			<div class="row">

				<!--Grid column-->
				<div class="col-lg-3 col-md-12">

					<!--Name-->
					<div
						class="select-wrapper mdb-select colorful-select dropdown-primary mx-2">
						<span class="caret">▼</span><input type="text"
							class="select-dropdown" readonly="true"
							data-activates="select-options-fd8e305c-d301-4c9b-bc85-7614f42b97b2"
							value="Bulk actions">
						<ul id="select-options-fd8e305c-d301-4c9b-bc85-7614f42b97b2"
							class="dropdown-content select-dropdown"
							style="width: 246.781px; position: absolute; top: 0px; left: 0px; opacity: 1; display: none;">
							<li class="disabled"><span class="filtrable">Bulk
									actions</span></li>
							<li class=""><span class="filtrable">Delate</span></li>
							<li class=""><span class="filtrable">Export</span></li>
							<li class=""><span class="filtrable">Change segment</span></li>
						</ul>
						<select
							class="mdb-select colorful-select dropdown-primary mx-2 initialized">
							<option value="" disabled="" selected="">Bulk actions</option>
							<option value="1">Delate</option>
							<option value="2">Export</option>
							<option value="3">Change segment</option>
						</select>
					</div>

				</div>
				<!--Grid column-->

				<!--Grid column-->
				<div class="col-lg-3 col-md-6">

					<!--Blue select-->
					<div
						class="select-wrapper mdb-select colorful-select dropdown-primary mx-2">
						<span class="caret">▼</span><input type="text"
							class="select-dropdown" readonly="true"
							data-activates="select-options-595e26f1-201e-410b-816b-c93ac51be733"
							value="Show only">
						<ul id="select-options-595e26f1-201e-410b-816b-c93ac51be733"
							class="dropdown-content select-dropdown ">
							<li class="disabled "><span class="filtrable">Show
									only</span></li>
							<li class=""><span class="filtrable">All (2000) </span></li>
							<li class=""><span class="filtrable">Never opened
									(200) </span></li>
							<li class=""><span class="filtrable">Opened but
									unanswered (1800) </span></li>
							<li class=""><span class="filtrable">Answered (200) </span></li>
							<li class=""><span class="filtrable">Unsunscribed
									(50) </span></li>
						</ul>
						<select
							class="mdb-select colorful-select dropdown-primary mx-2 initialized">
							<option value="" disabled="" selected="">Show only</option>
							<option value="1">All (2000)</option>
							<option value="2">Never opened (200)</option>
							<option value="3">Opened but unanswered (1800)</option>
							<option value="4">Answered (200)</option>
							<option value="5">Unsunscribed (50)</option>
						</select>
					</div>
					<!--/Blue select-->

				</div>
				<!--Grid column-->

				<!--Grid column-->
				<div class="col-lg-3 col-md-6">

					<!--Blue select-->
					<div
						class="select-wrapper mdb-select colorful-select dropdown-primary mx-2">
						<span class="caret">▼</span><input type="text"
							class="select-dropdown" readonly="true"
							data-activates="select-options-09ab844b-0567-4a6a-b19b-392e6bb658b4"
							value="Filter segments">
						<ul id="select-options-09ab844b-0567-4a6a-b19b-392e6bb658b4"
							class="dropdown-content select-dropdown ">
							<li class="disabled "><span class="filtrable">Filter
									segments</span></li>
							<li class=""><span class="filtrable">Contacts in no
									segments (100) </span></li>
							<li class=""><span class="filtrable">Segment 1 (2000)
							</span></li>
							<li class=""><span class="filtrable">Segment 2 (1000)
							</span></li>
							<li class=""><span class="filtrable">Segment 3 (4000)
							</span></li>
						</ul>
						<select
							class="mdb-select colorful-select dropdown-primary mx-2 initialized">
							<option value="" disabled="" selected="">Filter segments</option>
							<option value="1">Contacts in no segments (100)</option>
							<option value="1">Segment 1 (2000)</option>
							<option value="2">Segment 2 (1000)</option>
							<option value="3">Segment 3 (4000)</option>
						</select>
					</div>
					<!--/Blue select-->

				</div>
				<!--Grid column-->

				<!--Grid column-->
				<div class="col-lg-3 col-md-6">

					<form class="form-inline mt-2 ml-2">
						<input class="form-control my-0 py-0" type="text"
							placeholder="Search" style="max-width: 150px;">
						<button
							class="btn btn-sm btn-info ml-2 px-2 waves-effect waves-light">
							<i class="fa fa-search"></i>
						</button>
					</form>

				</div>
				<!--Grid column-->

			</div>
			<!--Grid row-->

		</div>
		<!--Top Table UI-->

		<!--Card-->
		<div class="card card-cascade narrower">

			<!--Card header-->
			<div
				class="view py-3 gradient-card-header info-color-dark mx-4 d-flex justify-content-between align-items-center">

				<div>
					<button type="button"
						class="btn btn-outline-white btn-rounded btn-sm px-2 waves-effect waves-light">
						<i class="fa fa-th-large mt-0"></i>
					</button>
					<button type="button"
						class="btn btn-outline-white btn-rounded btn-sm px-2 waves-effect waves-light">
						<i class="fa fa-columns mt-0"></i>
					</button>
				</div>

				<a href="" class="white-text mx-3">Table name</a>

				<div>
					<button type="button"
						class="btn btn-outline-white btn-rounded btn-sm px-2 waves-effect waves-light">
						<i class="fa fa-pencil mt-0"></i>
					</button>
					<button type="button"
						class="btn btn-outline-white btn-rounded btn-sm px-2 waves-effect waves-light"
						data-toggle="modal" data-target="#modalConfirmDelete">
						<i class="fa fa-remove mt-0"></i>
					</button>
					<button type="button"
						class="btn btn-outline-white btn-rounded btn-sm px-2 waves-effect waves-light">
						<i class="fa fa-info-circle mt-0"></i>
					</button>
				</div>

			</div>
			<!--/Card header-->

			<!--Card content-->
			<div class="card-body">

				<div class="table-responsive">

					<table class="table">
						<thead>
							<tr>
								<th><input type="checkbox" id="checkbox"> <label
									for="checkbox" class="label-table"></label></th>
								<th class="th-lg">AlertId</th>
								<th class="th-lg">Security Class</th>
								<th class="th-lg">Alert Text Id</th>
								<th class="th-lg">Instrument Id</th>
								<th class="th-lg">Party Id</th>
								<th class="th-lg">Party Name</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${tradeAlerts}" var="mapElement">
								<tr>
									<th scope="row"><input class="customClass" type="checkbox"
										id="checkbox1" value=${mapElement.alertId}> <label
										for="checkbox1" class="label-table"></label></th>

									<td>${mapElement.alertId}</td>
									<td>${mapElement.securityClass}</td>

									<td>${mapElement.alertTextId}</td>
									<td>${mapElement.instrumentId}</td>

									<td>${mapElement.partyId}</td>
									<td>${mapElement.partyName}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>

				<hr class="my-0">

				<!--Bottom Table UI-->
				<div class="d-flex justify-content-between">

					<!--Name-->
					<div
						class="select-wrapper mdb-select colorful-select dropdown-primary mt-2 hidden-md-down">
						<span class="caret">▼</span><input type="text"
							class="select-dropdown" readonly="true"
							data-activates="select-options-86f378b7-3fbb-4bbd-b918-01a2ea9ce13c"
							value="10 rows">
						<ul id="select-options-86f378b7-3fbb-4bbd-b918-01a2ea9ce13c"
							class="dropdown-content select-dropdown"
							style="width: 181px; position: absolute; top: 0px; left: 0px; opacity: 1; display: none;">
							<li class="disabled"><span class="filtrable">Rows
									number</span></li>
							<li class=""><span class="filtrable">10 rows</span></li>
							<li class=""><span class="filtrable">25 rows</span></li>
							<li class="active selected"><span class="filtrable">50
									rows</span></li>
							<li class=""><span class="filtrable">100 rows</span></li>
						</ul>
						<select
							class="mdb-select colorful-select dropdown-primary mt-2 hidden-md-down initialized">
							<option value="" disabled="">Rows number</option>
							<option value="1" selected="">10 rows</option>
							<option value="2">25 rows</option>
							<option value="3">50 rows</option>
							<option value="4">100 rows</option>
						</select>
					</div>

					<!--Pagination -->
					<nav class="my-4">
						<ul class="pagination pagination-circle pg-blue mb-0">

							<!--First-->
							<li class="page-item disabled"><a
								class="page-link waves-effect waves-effect">First</a></li>

							<!--Arrow left-->
							<li class="page-item disabled"><a
								class="page-link waves-effect waves-effect"
								aria-label="Previous"> <span aria-hidden="true">«</span> <span
									class="sr-only">Previous</span>
							</a></li>

							<!--Numbers-->
							<li class="page-item active"><a
								class="page-link waves-effect waves-effect">1</a></li>
							<li class="page-item"><a
								class="page-link waves-effect waves-effect">2</a></li>
							<li class="page-item"><a
								class="page-link waves-effect waves-effect">3</a></li>
							<li class="page-item"><a
								class="page-link waves-effect waves-effect">4</a></li>
							<li class="page-item"><a
								class="page-link waves-effect waves-effect">5</a></li>

							<!--Arrow right-->
							<li class="page-item"><a
								class="page-link waves-effect waves-effect" aria-label="Next">
									<span aria-hidden="true">»</span> <span class="sr-only">Next</span>
							</a></li>

							<!--First-->
							<li class="page-item"><a
								class="page-link waves-effect waves-effect">Last</a></li>

						</ul>
					</nav>
					<!--/Pagination -->

				</div>
				<!--Bottom Table UI-->

			</div>
			<!--/.Card content-->

		</div>
		<!--/.Card-->

	</section>

	<jsp:include page="fragments/footer.jsp" />

	<%--<script src="${pageContext.request.contextPath}/resources/js/json2.js"></script>--%>
	<%--<script src="${pageContext.request.contextPath}/resources/js/underscore.js"></script>--%>
	<%--<script src="${pageContext.request.contextPath}/resources/js/backbone.js"></script>--%>
	<%--<script src="${pageContext.request.contextPath}/resources/js/app/tasks/main.js"></script>--%>
	<script>
		(function($) {
			$(document).ready(function() {
				$('li#nav-tasks').addClass('active');
			});
		})(jQuery);
		var tempArray = [];
		function getAlerts() {
			localStorage.setItem("selectedAlerts", tempArray);
			$.each($('.customClass:checkbox:checked'), function(i, v) {
				var a = $(v).val();
				console.log(a);
				tempArray.push(a);
				localStorage.setItem("selectedAlerts", tempArray);
			});

		}
		$(window).on("load resize ", function() {
			  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
			  $('.tbl-header').css({'padding-right':scrollWidth});
			}).resize();
	</script>

</body>
</html>
