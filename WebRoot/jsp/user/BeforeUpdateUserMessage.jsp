<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改信息</title>
	<style type="text/css">
       input{
           width: 300px;
           height: 40px;
           font-size: 30px;
       }
    </style>
</head>
<body>
	<%@ include file="/jsp/common/menu.jsp" %>
	<h1>修改信息</h1>
	<div>
		<center>
          <div style="margin-top: 150px">
              <input id="idvalue" type="text" name="id" value="请刷卡或者输入卡号"
                 	onblur="if(this.value==''){this.value='请刷卡或者输入卡号'}" 
		        	onfocus="if(this.value=='请刷卡或者输入卡号'){this.value=''}">
		        <br>
		        <br>
              <input id="submit" type="button" value="点击提交" style="height: 35px;font-size: 20px">
          </div>
      </center>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/layer/layer.js"></script>
<script type="text/javascript">
	$("#submit").click(function(){
		var id=$("#idvalue").val();
		if(id=="请刷卡或者输入卡号"||id==""){
			layer.msg("请输入卡号", {time:1200, icon:5, shift:6});
			return false;
		}
		var reg=/^[0-9]*$/;
		if(!reg.test(id)){
			layer.msg("请输入数字", {time:1000, icon:5, shift:6});
			$("#idvalue").val("")
			return false;
		}
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/UserServlet",
			dataType:"json",
			data:{
				method:"queryUser",
				id:id
			},
			success:function(result){
				if(result.success==true){
					var id=$("#idvalue").val()
					window.location='${pageContext.request.contextPath}'+
						'/UserServlet?method=beforeUpdateUser&id='+id;
				}else{
					layer.msg("卡号不存在", {time:1200, icon:5, shift:6});
					var id=$("#idvalue").val("");
				}
			}
		});
	});
</script>
</html>