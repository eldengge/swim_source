<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/jsp/common/menu.jsp"%>
	<div style="margin: auto; width: 400px; height: 500px;">
		<center>
		<table class="table" cellspacing="0"
			style="font-size: 25px; width: 550px; height: auto;">
			<tr>
				<td colspan="7" style="text-align: center">详细信息</td>
			</tr>
			<tr>
				<td rowspan="4" class="centertd" style="text-align: center"><img
					src="${pageContext.request.contextPath}/photo/${queryUser.img}" style="width: 150px; height: 200px">
				</td>
				<td class="centertd">卡号:${queryUser.id}</td>
			</tr>
			<tr>
				<td class="centertd">姓名:${queryUser.name}</td>
			</tr>
			<tr>
				<td class="centertd">性别:${queryUser.sex}</td>
			</tr>
			<tr>
				<td class="centertd">年龄:${queryUser.age}</td>
			</tr>
			<tr>
				<td colspan="2">生日:${queryUser.birthday}</td>
			</tr>
			<tr>
				<td colspan="2">家长姓名:${queryUser.parent_name}</td>
			</tr>
			<tr>
				<td colspan="2">联系电话:${queryUser.phone}</td>
			</tr>
			<tr>
				<c:choose>
					<c:when test="${queryUser.all_state==1}">
						<td colspan="2">卡类型(通用卡/非通卡):通用卡</td>
					</c:when>
					<c:otherwise>
						<td colspan="2">卡类型(通用卡/非通卡):非通用卡</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<c:if test="${queryUser.all_state==1}">
				<tr>
					<td colspan="2">剩余次数:${queryUser.swim_number}</td>
				</tr>	
			</c:if>
			<c:if test="${queryUser.all_state==0}">
				<c:if test="${empty timetables}">
					<tr>
						<td colspan="2">卡中无课程</td>
					</tr>
				</c:if>
				<c:forEach items="${timetables}" var="timetable">
					<tr>
						<td colspan="2">${timetable.course_name}:剩余${timetable.number}次</td>
					</tr>
				</c:forEach>	
			</c:if>
			<tr>
				<td colspan="2">到期日期:${queryUser.end_date}</td>
			</tr>
		</table>
		</center>
	</div>
</body>
</html>