<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'swipeCard.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <style type="text/css">
       input{
           width: 300px;
           height: 40px;
           font-size: 30px;
       }
    </style>
  </head>
  
  <body>
  	<h1>刷卡操作</h1>
      <center>
          <form action="${pageContext.request.contextPath}/UserServlet" method="post" style="margin-top: 150px">
              <input type="hidden" name="method" value="queryUserById">
              <input id="idvalue" type="text" name="id" value="请刷卡或者输入卡号"
                 	onblur="if(this.value==''){this.value='请刷卡或者输入卡号'}" 
		        	onfocus="if(this.value=='请刷卡或者输入卡号'){this.value=''}">
		        <br>
		        <br>
              <input id="sub" type="button" value="点击提交" style="height: 35px;font-size: 20px">
          </form>
      </center>
  </body>
 <script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/layer/layer.js"></script>
<script type="text/javascript">
$("#sub").click(function(){
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
			method:"queryPass",
			id:id
		},
		success:function(result){
			if(result.success==true){
				$("form").submit();
			}else{
				layer.msg("此卡已经过期", {time:1200, icon:5, shift:6});
				$("#idvalue").val("")
			}
		}
	});
});
</script>
</html>
