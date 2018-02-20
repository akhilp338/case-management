<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true"%>

<%@ attribute name="tagList" required="true" type="java.util.Collection"%>
<%@ attribute name="document" required="true"
	type="com.studerw.activiti.model.document.Document"%>

<c:if test="${not empty historicTasks}">
	<c:if
		test="${document.docState  ne 'DRAFT' && document.docState ne 'PUBLISHED' && document.docState ne 'EMAILED'}">
		<div id="diagram" class="center-block" style="display: none">
			<h4>Workflow</h4>

			<p>
				<img class="img-responsive img-rounded proc-diagram"
					style="width: 100%"
					src="${pageContext.request.contextPath}/workflow/diagram/documents/${document.id}"
					<%--src="http://placehold.it/800x150.png"--%>
                     alt="Workflow Process Diagram">
			</p>
		</div>
	</c:if>
</c:if>

<%-- <div class="panel-body">
			<table class="table table-striped">
				<thead>
					<tr>
						<td>Task ID</td>
						<td>Description</td>
						<td>User</td>
						<td>Date Completed</td>
						<td>Action</td>
						<td>Comment</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="hTask" items="${historicTasks}">
						<tr>

							<td>${hTask.id}</td>
							<td>${hTask.name}</td>
							<td>${hTask.userId}</td>
							<td><spring:eval expression="hTask.completedDate" /></td>
							<td>${hTask.localVars['taskOutcome']}</td>
							<td>${hTask.comments[0].fullMessage}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
 --%>

<!-- Workflow History -->

<%-- <section id="timeline">
		<c:forEach var="hTask" items="${historicTasks}">
			<article>
				<div class="inner">
					<span class="date"> <!-- <span class="day">30<sup>th</sup></span>
						<span class="month">Jan</span> <span class="year">2014</span> -->
						<spring:eval expression="hTask.completedDate" />
					</span>
					<h2>${hTask.name}</h2>
					<p>${hTask.userId}</p>
					<p>Status : ${hTask.localVars['taskOutcome']}</p>
					<p>Comments : ${hTask.comments[0].fullMessage}</p>
				</div>
			</article>
		</c:forEach>
	</section> --%>

<ul class="timeline">

	<c:forEach var="hTask" items="${historicTasks}" varStatus="loopStatus">
		<li
			class="${loopStatus.index % 2 == 0 ? 'even' : 'timeline-inverted'}">
			<div class="timeline-badge">
				<a><i class="fa fa-circle" id=""></i></a>
			</div>
			<div class="timeline-panel">
				<div class="timeline-heading">
					<h4>${hTask.name}</h4>
				</div>
				<div class="timeline-body">
					<p>${hTask.userId}</p>
					<p>Status : ${hTask.localVars['taskOutcome']}</p>
					<p>Comments : ${hTask.comments[0].fullMessage}</p>
				</div>
				<div class="timeline-footer">
					<p class="text-right">
						<spring:eval expression="hTask.completedDate" />
					</p>
				</div>
			</div>
		</li>
	</c:forEach>
	<li class="clearfix no-float"></li>
</ul>