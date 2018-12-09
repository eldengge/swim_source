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
		width: 150px;
		height: 30px;
		font-size: 20px;
	}
	#maintable td{
		text-align: center
	}
</style>
</head>
<body>
	<%@ include file="/jsp/common/menu.jsp"%>
	<div style="margin: auto; width: 400px; height: 500px;">
		<center>
		<table id="maintable" class="table" cellspacing="0"
			style="font-size: 25px; width: 550px; height: auto;">
			<tr>
				<td colspan="7">全部课程</td>
			</tr>
			<tbody id="tbody">
			</tbody>
			<tfoot>
				<tr>
					<td colspan="7">
						<input type="text" id="courseName">
					</td>
				</tr>
				<tr>
					<td colspan="7">
						<input type="button" id="submit" value="添加">
					</td>
				</tr>
			</tfoot>
		</table>
		</center>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/layer/layer.js"></script>
<script type="text/javascript">
	$(function(){
		queryCourse();
	});
	function queryCourse(){
		$("#courseName").val("")
		$.ajax({
			url:"${pageContext.request.contextPath}/CourseServlet",
			type:"POST",
			dataType:"json",
			data:{
				method: "queryCourse"
			},
			beforeSend:function(){
				$("#tbody").html("");
			},
			success:function(result){
				var list=result.courseList;
				var createDates=result.createDates;
				var context='';
				if(list.length==0){
					context+='没找到对应信息';
				}
				$.each(list,function(i,n){
					context+='<tr>';
					context+='<td>课程名称:'+n.name+'&nbsp</td>';
					context+='<td>添加日期:'+createDates[i]+'&nbsp</td>';
					context+='</tr>';
				});
				$("#tbody").html(context);
			}
		});
	}
	$("#submit").click(function(){
		var courseName=$("#courseName").val();
		if(courseName==""){
			alert("信息不能为空");
		}
		$.ajax({
			url:"${pageContext.request.contextPath}/CourseServlet",
			type:"POST",
			dataType:"json",
			data:{
				method: "insertCourse",
				courseName: courseName
			},
			success:function(result){
				if(result.success==true){
					layer.msg("添加成功", {time:1000, icon:6},queryCourse());
				}else{
					layer.msg("课程已经存在，请勿重复添加", {time:1500, icon:5, shift:6});
				}
			}
		});
	});
</script>
</html>