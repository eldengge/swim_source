<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
html {
	height: 100%;
}

body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,input,button,textarea,p,blockquote,th,td
	{
	margin: 0;
	padding: 0;
}

.table td {
	border: 1px solid black;
}

.top {
	width: auto;
	height: 70px;
	background-color: #5599FF;
	font-size: 40px;
	color: white;
}

.left {
	height: 100%;
	position:absolute;
	background-color: #99BBFF;
}
 .left label{
    color: white;
	font-size: 25px;
}
.left a {
	color: white;
	font-size: 20px;
	text-decoration: none;
}

.left tr {
	height: 55px;
}

.left a:hover {
	color: blue;
}
.blue:hover{
   color:blue;
}
body{
	text-align: center;
	background-image: url("/swim/static/background/bac.jpg");
	background-size:100%;
}
</style>

</head>

<body>

	<div class="top">月儿湾</div>
	<div class="left">
		<div >
			<table style="text-align: left;">			
				<tr >
					<td ><label >会员卡相关</label>
					
						</td>
				</tr>
				<tr id="t1" class="n_tr">
				    <td >
				           <ul >
				               <li><a href="index.jsp?num=1">刷卡操作</a></li>
				               <li><a href="index.jsp?num=2">开通会员卡</a></li>
				           </ul>
				    </td>
				</tr>
				<tr>
					<td><label >会员相关</label>
			
					</td>
				</tr>
					<tr id="t2" class="n_tr">
				    <td >
				           <ul >
				               <li><a href="jsp/user/userAddCourse.jsp">添加课程</a></li>
				               <li><a href="jsp/user/userShowMessage.jsp">查看信息</a></li>
				               <li><a href="jsp/user/BeforeUpdateUserMessage.jsp">信息修改</a></li>
				               <li><a href="jsp/user/userAddNumber.jsp">添加次数</a></li>
				           </ul>
				    </td>
				</tr>
				<tr>
					<td><label >课程相关</label>
			
					</td>
				</tr>
					<tr id="t3" class="n_tr">
				    <td >
				           <ul >
				               <li><a href="jsp/course/AddCourse.jsp">添加课程</a></li>
				               <li><a href="jsp/course/DelCourse.jsp">删除课程</a></li>
				           </ul>
				    </td>
				</tr>
				<tr>
					<td><label >统计相关</label>
			
					</td>
				</tr>
				<tr id="t4" class="n_tr">
				    <td >
				           <ul >
				               <li><a href="jsp/statistic/AllStatistic.jsp">刷卡记录</a></li>
				               <li><a href="jsp/user/showAllUser.jsp">全部会员</a></li>
				           </ul>
				    </td>
				</tr>
				<tr>
					<td><a href="index.jsp?num=9" style="font-size: 25px">生日提醒</a>
					</td>
				</tr>
				<tr>
					<td><a href="AdminServlet?method=logout" style="font-size: 25px">注销</a>
					</td>
				</tr>
				
			</table>
		</div>
	</div>
	<div class="main">
		<%
			request.setCharacterEncoding("utf-8");
			if (request.getParameter("num") == null) {
				pageContext.include("swipeCard.jsp");
			} else {
				int num = Integer.parseInt(request.getParameter("num"));
				switch (num) {
				case 1:
					pageContext.include("swipeCard.jsp");
					break;
				case 2:
					pageContext.include("adduser.jsp");
					break;
				case 3:
					pageContext.include("search.jsp");
					break;
				case 4:
					pageContext.include("adduserSuccess.jsp");
					break;
				case 5:
					pageContext.include("addcourse.jsp");
					break;
				case 6:
					pageContext.include("addcourseDao.jsp");
					break;
				case 7:
					pageContext.include("showAlluser.jsp");
					break;
				case 8:
					pageContext.include("showUser.jsp");
					break;
			    case 9:
					pageContext.include("showBirthuser.jsp");
					break;
			    case 10:
					pageContext.include("showUserbase.jsp");
					break;
			    case 11:
					pageContext.include("searchDao.jsp");
					break;
				case 12:
					pageContext.include("userAddcourse.jsp");
					break;
				case 13:
					pageContext.include("userAddcDao.jsp");
					break;
				case 14:
					pageContext.include("login1.jsp");
					break;
				case 15:
					pageContext.include("login2.jsp");
					break;
				case 16:
					pageContext.include("login2Dao.jsp");
					break;
			    case 17:
					pageContext.include("loginDao.jsp");
					break;
			    case 18:
					pageContext.include("showuser_u.jsp");
					break;
			    case 19:
					pageContext.include("showuser_u.jsp");
					break;
				}
			}
		%>
	</div>
</body>
</html>
