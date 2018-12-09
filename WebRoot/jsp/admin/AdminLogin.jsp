<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<div>
		<center>
          <form action="" method="post" style="margin-top: 150px">
              <input id="username" type="text" name="username">
		        <br>
		        <br>
		      <input id="password" type="password" name="passWord">
		        <br>
		        <br>
              <input id="login" type="button" value="登录" style="height: 35px;font-size: 20px">
          </form>
      </center>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/layer/layer.js"></script>
<script type="text/javascript">
	$("#login").click(function(){
		var username=$("#username").val();
		var password=$("#password").val();
		if(username==""){
			layer.msg("账号不能为空", {time:1200, icon:5, shift:6});
			return false;
		}
		if(password==""){
			layer.msg("密码不能为空", {time:1200, icon:5, shift:6});
			return false;
		}
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/AdminServlet",
			dataType:"json",
			data:{
				method:"login",
				username:username,
				password:password
			},
			success:function(result){
				if(result.success==true){
					window.location='${pageContext.request.contextPath}'+
						'/index.jsp';
				}else{
					layer.msg("账号或密码错误", {time:1200, icon:5, shift:6});
				}
			}
		});
	});
</script>
</html>