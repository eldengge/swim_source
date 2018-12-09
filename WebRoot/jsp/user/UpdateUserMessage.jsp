<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改信息</title>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link
	href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/static/bootstrap-datepicker-1.6.4-dist/css/bootstrap-datepicker.min.css"
	rel="stylesheet">
<style type="text/css">
label {
	font-size: 20px;
}

input {
	width: 300px;
	height: 30px;
	font-size: 20px;
	background-color: #FFFFFF;
	border-color: #99BBFF;
}
select{
    background-color: #FFFFFF;
}
.file {
    cursor:pointer;
    width:86px;
    height:22px;
	font-size: 1px;
	left: 0px;
	opacity: 0;
	filter: alpha(opacity = 0)
}
  
</style>

</head>

<body style="text-align: center;">
	<%@ include file="/jsp/common/menu.jsp" %>
<div>
   <center>
		<form action="${pageContext.request.contextPath}/UserUpdateServlet"  method="post" enctype="multipart/form-data">
		<input name="id" type="hidden" value="${queryUser.id}">
		<input name="img" type="hidden" value="${queryUser.img}">
			<table>
				<tr>
					<td><label>姓名:</label> <br> <input class="input" name="name"
						type="text" value="${queryUser.name}"></td>
					<td rowspan="3" valign="top"><label>照片</label><br><img src="${pageContext.request.contextPath}/photo/${queryUser.img}" height="150" width="120">
					</td>
				</tr>
				<tr>
					<td><label>年龄:</label> <br> <input id="age" class="input" name="age" type="text" value="${queryUser.age}" >
					</td>
				</tr>
				<tr>
				    <td>
				        <label>性别:</label> <br>
				        <select class="input" name="sex" style="width: 150px;height: 30px;font-size: 20px">
                                      <option value="男">男</option>
                                      <option value="女" >女</option>
                        </select>
				    </td>
				</tr>
				<tr>
				<tr>
					<td><label>生日:</label> <br> 
					<input id="birthday" class="input" name="birthday" type="text" readonly="readonly" value="${queryUser.birthday}"/>
					</td>
				</tr>
				<tr>
					<td><label>修改照片:</label><br> 
						<input name="file" type="file" id="file">
					</td>
				</tr>
				<tr>
					<td>
					    <label>家长姓名:</label>
					    <br>
						<input class="input" name="parent_name" type="text" value="${queryUser.parent_name}">
					</td>
				</tr>
				<tr>
					<td>
					    <label>家长电话:</label>
					    <br>
						<input id="phone" class="input" name="phone" type="text" value="${queryUser.phone}">
					</td>
				</tr>
				<tr>
					<td><label>到期时间:</label><br> <input class="input" id="end_date"
						name="end_date" type="text" value="${queryUser.end_date}" readonly="readonly"></td>
				</tr>
				<tr >
					<td >
						 <input id="submit" type="submit" value="提交">
					</td>
				</tr>
			</table>
		</form>
		</center>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/layer/layer.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/bootstrap-datepicker-1.6.4-dist/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="${pageContext.request.contextPath}/static/bootstrap-datepicker-1.6.4-dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("select[name='sex']").val("${queryUser.sex}");
		$('#birthday').datepicker({
		    format: "yyyy-mm-dd",
		    language: "zh-CN"
		});
		$('#end_date').datepicker({
		    format: "yyyy-mm-dd",
		    language: "zh-CN"
		});
	});
	$("#submit").click(function(){
		var inputs = $(".input");
		for (var i = 0; i < inputs.length; ++i) {
			if (inputs[i].value == "") {
				alert("信息不能为空");
				return false;
			}
		}
		var age=$("#age").val();
		var phone=$("#phone").val();
		var reg=/^[0-9]*$/;
		if(!reg.test(age)){
			layer.msg("年龄请输入数字", {time:1000, icon:5, shift:6});
			$("#idvalue").val("")
			return false;
		}
		if(!reg.test(phone)){
			layer.msg("电话请输入数字", {time:1000, icon:5, shift:6});
			$("#idvalue").val("")
			return false;
		}
	});
	$("#file").change(function(event){
		var files=event.target.files,file;
		if(files&&files.length>0){
			file=files[0];
		}
		var url=window.URL||window.webkitURL;
		var imgurl=url.createObjectURL(file);
		var imgobj=$("img");
		imgobj.attr("src",imgurl);
	});
</script>
</html>
