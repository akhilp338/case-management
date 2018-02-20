<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<style>
#container {
	min-width: 310px;
	max-width: 800px;
	margin: 0 auto
}
</style>
<head>
<jsp:include page="fragments/head.jsp" />
<title>Case Management</title>

</head>

<body>
	<jsp:include page="fragments/navbar-top.jsp" />




	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div id="alert-chart"></div>
			</div>

			<div class="col-sm-6">
				<div id="case-chart">
			</div>
		</div>
	</div>


	</div>

	<jsp:include page="/WEB-INF/pages/fragments/footer.jsp" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/custom-graph-data.js"></script>
	<script>
    (function ($) {
        $(document).ready(function () {
            $('a.navbar-brand').addClass('navbar-brand-active');
        });
    })(jQuery);
    
</script>
</body>
</html>
