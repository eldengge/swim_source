<%@page import="util.Constant"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ page import="Dao.userDao"%>
<%@ page import="model.user"%>
<%@ page import="Dao.timetableDao"%>
<%@ page import="model.timetable"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'showUserbase.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.table td {
	border: 1px solid black;
}

.centertd {
	text-align: center;
}

select {
	font-size: 25px;
}
</style>
</head>

<body>
	<center>
		<c:choose>
			<c:when test="${empty queryUser}">
				<h1>${message}</h1>
			</c:when>
			<c:otherwise>
				<form action="${pageContext.request.contextPath}/UserServlet" method="post">
					<input id="id" type="hidden" name="id" value="${queryUser.id}">
					<input id="all_state" type="hidden" name="all_state" value="${queryUser.all_state}">
					<input id="method" type="hidden" name="method" value="swipeCard">
					<table class="table" cellspacing="0"
						style="font-size: 25px; width: 550px; height: auto;">
						<tr>
							<td rowspan="4" class="centertd"><img
								src="photo/${queryUser.img}"
								style="width: 150px; height: 200px"></td>
							<td class="centertd">卡号:${queryUser.id}</td>
						</tr>
						<tr>
							<td class="centertd">姓名:${queryUser.name}</td>
						</tr>
						<c:choose>
							<c:when test="${queryUser.all_state==1}">
								<tr>
									<td class="centertd">卡类型(通用卡/非通卡):通用卡</td>
								</tr>
								<tr>
									<td class="centertd">当前次数:${queryUser.swim_number}</td>
									<c:if test="${queryUser.swim_number==0}">
										<c:set var="flag" value="false"></c:set>
									</c:if>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td class="centertd">卡类型(通用卡/非通卡):非通用卡</td>
								</tr>
								<tr>
									<td class="centertd">选择课程:
										<select name="timetable_id" id="timetable_id">
											<c:forEach items="${timetables}" var="timetable">
												<option  value="${timetable.id}">${timetable.course_name}:${timetable.number}次</option>
											</c:forEach>
											<c:if test="${empty timetables}">
												<c:set var="flag" value="false"></c:set>
											</c:if>
										</select>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
					<c:choose>
						<c:when test="${flag==false}">
							卡为空无法进行刷卡，请充次数或者添加课程。
						</c:when>
						<c:otherwise>
							<input id="button" type="button" value="提交" style="font-size: 20px; width: 100px;">
						</c:otherwise>
					</c:choose>
				</form>
			</c:otherwise>
		</c:choose>
		<form id="hiddenform" action="${pageContext.request.contextPath}/UserServlet" method="post">
              <input type="hidden" name="method" value="queryUserById">
              <input type="hidden" value="${queryUser.id}" name="id">
        </form>
	</center>
</body>
<script type="text/javascript" src="static/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" src="static/jquery/layer/layer.js"></script>
<script type="text/javascript">
	$("#button").click(function(){
		var id=$("#id").val();
		var all_state=$("#all_state").val();
		var timetable_id=$("#timetable_id :selected").val();
		var user_name="${queryUser.name}";
		var method=$("#method").val();
		$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/UserServlet",
			dataType: "json",
			data: {
				user_name: user_name,
				method: method,
				id: id,
				all_state: all_state,
				timetable_id: timetable_id
			},
			success: function(result){
				layer.confirm("刷卡成功,是否继续刷卡", {icon: 3, title:'提示'}, 
				function(cindex){
					layer.close(cindex);
					$("#hiddenform").submit();
				}, function(cindex){
					layer.close(cindex);
					window.location='${pageContext.request.contextPath}'+
					'/UserServlet?method=queryUserMessageById&id='+"${queryUser.id}";
				});
			}
		});
	});
</script>
</html>
