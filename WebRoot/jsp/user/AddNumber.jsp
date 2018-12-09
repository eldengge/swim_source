<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	input {
		width: 100px;
		height: 30px;
		font-size: 20px;
	}
</style>
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
					<td colspan="2">剩余次数:
					<input class="number" type="text" name="${queryUser.id}" value="${queryUser.swim_number}">
					</td>
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
						<td colspan="2">${timetable.course_name}:剩余
							<input class="timetable" type="text" name="${timetable.id}" value="${timetable.number}">次
							<input type="hidden" id="${timetable.id}" value="${timetable.number}">
						</td>
					</tr>
				</c:forEach>	
			</c:if>
			<tr>
				<td colspan="7" style="text-align: center">
					<input type="button" value="提交" id="submit">
				</td>
			</tr>
		</table>
		</center>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/layer/layer.js"></script>
<script type="text/javascript">
	$("#submit").click(function(){
		var all_state="${queryUser.all_state}";
		var jsonObj=new Object();
		if(all_state==1){
			var id=$(".number").attr("name");
			var number=$(".number").val();
			var reg=/^[0-9]*$/;
			if(!reg.test(number)){
				layer.msg("请输入数字", {time:1000, icon:5, shift:6});
				$(".number").val("${queryUser.swim_number}");
				return false;
			}
			if(Number(number)<Number("${queryUser.swim_number}")){
				layer.msg("输入次数不得少于原有次数", {time:1000, icon:5, shift:6});
				$(".number").val("${queryUser.swim_number}");
				return false;
			}else if(Number(number)>Number("${queryUser.swim_number}")){
				//操作
				jsonObj.allState=1;
				jsonObj.userId=id;
				jsonObj.number=number;
				addNumber(jsonObj);
			}else{
				layer.msg("次数未更改无需提交", {time:1000, icon:5, shift:6});
				return false;
			}
		}else{
			var timetables=$(".timetable");
			var ids=new Array();
			var nums=new Array();
			for(var i=0;i<timetables.length;++i){
				//验证
				var str='#'+timetables[i].name;
				var num=$(str).val();
				var reg=/^[0-9]*$/;
				if(!reg.test(timetables[i].value)){
					layer.msg("请输入数字", {time:1000, icon:5, shift:6});
					timetables[i].value=num;
					return false;
				}
				
				if(Number(timetables[i].value)<Number(num)){
					layer.msg("输入次数不得少于原有次数", {time:1000, icon:5, shift:6});
					timetables[i].value=num;
					return false;
				}else if(Number(timetables[i].value)>Number(num)){
					ids[i]=timetables[i].name;
					nums[i]=timetables[i].value;
				}
			}
			if(nums.length==0){
				layer.msg("次数未更改无需提交", {time:1000, icon:5, shift:6});
				return false;
			}else{
				jsonObj.allState=0;
				jsonObj.ids=ids;
				jsonObj.nums=nums;
				addNumber(jsonObj);
			}
		}
	});
	function addNumber(jsonObj){
		//var json=JSON.stringify(jsonObj);
		//alert(json);
		jsonObj.method="AddNumber";
		layer.confirm("确定添加?", {icon: 3, title:'提示'}, 
				function(cindex){
					layer.close(cindex);
					$.ajax({
						url:"${pageContext.request.contextPath}/UserServlet",
						type:"POST",
						dataType:"json",
						data:jsonObj,
						success:function(result){
							window.location='${pageContext.request.contextPath}'+
							'/UserServlet?method=queryUserMessageById&id='+"${queryUser.id}";
						}
					});
				}, function(cindex){
					layer.close(cindex);
				});
	}
</script>
</html>