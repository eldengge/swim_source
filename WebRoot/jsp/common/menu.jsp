<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
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
	<div class="top">月儿湾</div>
	<div class="left">
		<div >
			<table style="text-align: left;">			
				<tr >
					<td ><label>会员卡相关</label>
					
					</td>
				</tr>
				<tr id="t1" class="n_tr">
				    <td >
				           <ul>
				               <li><a href="${pageContext.request.contextPath}/index.jsp?num=1">刷卡操作</a></li>
				               <li><a href="${pageContext.request.contextPath}/index.jsp?num=2">开通会员卡</a></li>
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
				               <li><a href="${pageContext.request.contextPath}/jsp/user/userAddCourse.jsp">添加课程</a></li>
				               <li><a href="${pageContext.request.contextPath}/jsp/user/userShowMessage.jsp">查看信息</a></li>
				               <li><a href="${pageContext.request.contextPath}/jsp/user/BeforeUpdateUserMessage.jsp">信息修改</a></li>
				               <li><a href="${pageContext.request.contextPath}/jsp/user/userAddNumber.jsp">添加次数</a></li>
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
				               <li><a href="${pageContext.request.contextPath}/jsp/course/AddCourse.jsp">添加课程</a></li>
				               <li><a href="${pageContext.request.contextPath}/jsp/course/DelCourse.jsp">删除课程</a></li>
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
				               <li><a href="${pageContext.request.contextPath}/jsp/statistic/AllStatistic.jsp">刷卡记录</a></li>
				               <li><a href="${pageContext.request.contextPath}/jsp/user/showAllUser.jsp">全部会员</a></li>
				           </ul>
				    </td>
				</tr>
				<tr>
					<td><a href="${pageContext.request.contextPath}/index.jsp?num=9" style="font-size: 25px">生日提醒</a>
					</td>
				</tr>
				<tr>
					<td><a href="${pageContext.request.contextPath}/AdminServlet?method=logout" style="font-size: 25px">注销</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
