<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../../fragments/head.jsp" />
<title>Add Case Report</title>

</head>

<body>
	<jsp:include page="../../fragments/navbar-top.jsp" />
	<div class="container">
		<div class="start-template">
			<div class="page-header">
				<h2>
					New Case <small>${pageContext.request.remoteUser}</small>
				</h2>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<span class="glyphicon glyphicon-paperclip pull-right"></span>

					<h3 class="panel-title">New Case</h3>
				</div>
				<div class="panel-body">
					<form:form cssStyle="margin: 20px" cssClass="form-horizontal"
						method="POST" commandName="bookReport"
						action="${pageContext.request.contextPath}/document/bookReport">
						<div class="form-group">
							<form:errors path="*" cssClass="errorblock" />
						</div>

						<div class="form-group">
							<label for="author" class="col-sm-2 control-label">Case
								Created By</label>

							<div class="col-sm-10">
								<form:input path="author" id="author" cssClass="form-control"
									readonly="true" />
							</div>						</div>
						<div class="form-group" style="display: none;">
							<label for="groupId" class="col-sm-2 control-label">Group</label>

							<div class="col-sm-10">
								<form:select path="groupId" cssClass="form-control" id="groupId"
									autofocus="true">
									<c:forEach var="group" items="${groups}">
										<form:option value="${group.id}" label="${group.name}" />
									</c:forEach>
								</form:select>
							</div>
						</div>
						<div class="form-group">
							<label for="title" class="col-sm-2 control-label">Case
								Title</label>
							<div class="col-sm-10">
								<form:input cssClass="form-control" id="title" path="title" />
							</div>
						</div>
						<div class="form-group">
							<label for="bookAuthor" class="col-sm-2 control-label">Client</label>
							<div class="col-sm-10">
								<form:input cssClass="form-control" id="bookAuthor"
									path="bookAuthor" />
							</div>
						</div>
						<div class="form-group">
							<label for="bookTitle" class="col-sm-2 control-label">Book
								Title</label>
							<div class="col-sm-10">
								<form:input cssClass="form-control" id="bookTitle"
									path="bookTitle" value="Dummy" />
							</div>
						</div>
						<div class="form-group">
							<label for="bookTitle" class="col-sm-2 control-label">Alerts</label>
							<div class="col-sm-10">
								<!-- <a href="#"
									onClick="MyWindow=window.open('http://localhost:8081/activiti-example/alert-page.htm','MyWindow', 'width=200','height=100'); return false;">Click
									Here</a> -->
									<input class="selected-alerts" disabled="disabled">
									</input>
							</div>
						</div>
						<div class="form-group">
							<label for="content" class="col-sm-2 control-label">Comments</label>
							<div class="col-sm-10">
								<form:textarea cssClass="form-control" id="content"
									path="content" rows="6" />
							</div>
						</div>
						<div class="form-group">
							<label for="summary" class="col-sm-2 control-label">Summary</label>
							<div class="col-sm-10">
								<form:textarea cssClass="form-control" id="summary"
									path="summary" rows="3" />
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
						<form:hidden path="id" />
						<form:hidden path="docType" />
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
							<button type="submit" class="btn btn-primary btn-default">Save
								Case Report</button>

						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/pages/fragments/footer.jsp" />
	<script>
    $(document).ready(function () {
        $("#content").attr('required', '');
        $("#author").attr('required', '');
        $("#group").attr('required', '');
        $("#summary").attr('required', '');
        $("#bookAuthor").attr('required', '');
        $("#bookTitle").attr('required', '');
        $("#title").attr('required', '');
        $('li#nav-docs').addClass('active');
        $(".selected-alerts").val(localStorage["selectedAlerts"]);
    });

</script>
</body>
</html>
