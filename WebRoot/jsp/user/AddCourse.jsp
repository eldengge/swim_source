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
	select{
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
				<td colspan="7">拥有课程</td>
			</tr>
			<tbody id="tbody">
			</tbody>
			<tfoot>
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
		queryTimetable();
	});
	function queryTimetable(){
		var id="${param.id}";
		$.ajax({
			url:"${pageContext.request.contextPath}/UserServlet",
			type:"POST",
			dataType:"json",
			data:{
				method: "queryTimetable",
				id: id
			},
			beforeSend:function(){
				$("#tbody").html("");
			},
			success:function(result){
				var list=result.timetableList;
				var courseList=result.courseList;
				var context='';
				$.each(list,function(i,n){
					context+='<tr>';
					context+='<td>课程名称:'+n.course_name+'&nbsp</td>';
					context+='<td>剩余次数:'+n.number+'&nbsp</td>';
					context+='</tr>';
				});
		 		context+='<tr>';
				context+='<td><select id="selectCourse">';
				$.each(courseList,function(i,n){
					context+='<option value="'+n.id+'">'+n.name+'</option>';
				});
				context+='</select></td>';
				context+='<td>';
				context+='<input type="text" id="courseNumber"/>';
				context+='</td>';
				context+='</tr>'; 
				$("#tbody").html(context);
			}
		});
	}
	$("#submit").click(function(){
		var number=$("#courseNumber").val();
		if(number==""){
			layer.msg("请填写次数", {time:1500, icon:5, shift:6});
			return false;
		}
		var courseId=$("#selectCourse option:selected").val();
		var courseName=''+$("#selectCourse option:selected").html();
		var userId="${param.id}";
		$.ajax({
			url:"${pageContext.request.contextPath}/UserServlet",
			type:"POST",
			dataType:"json",
			data:{
				method: "userAddCourse",
				course_name: courseName,
				course_id: courseId,
				user_id: userId,
				number: number
			},
			success:function(result){
				if(result.success==true){
					layer.msg("添加成功", {time:1000, icon:6},queryTimetable());
				}else{
					layer.msg("课程已经存在，请勿重复添加", {time:1500, icon:5, shift:6});
				}
			}
		});
	});
</script>
</html>