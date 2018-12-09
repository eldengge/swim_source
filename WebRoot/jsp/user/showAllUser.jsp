<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/css/pagination.css">
<style type="text/css">
</style>
</head>
<body>
	<%@ include file="/jsp/common/menu.jsp" %>
	<div>
		<center>
		  <input id="search" type="text" name="id" value="">
		  <select id="method">
		  	<option value="1">卡号</option>
		  	<option value="2">姓名</option>
		  	<option value="3">电话</option>
		  </select>
		  <input id="submit" type="button" value="搜索">
		<table class="table" cellspacing="0"
			style="font-size: 20px; width: auto; height: auto;">
			<tr>
				<td colspan="7" style="text-align: center">全部会员</td>
			</tr>
			<tbody id="tbody">
			</tbody>
		</table>
		<ul class="pagination">
			<div id="Pagination" class="pagination"></div>
		</ul>
	</center>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/layer/layer.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/jquery.pagination.js"></script>
<script type="text/javascript">
	$(function() {
		queryPage(0);
	})
	function queryPage(pageno){
		var value=$("#search").val();
		var searchMethod=$("#method").val();
		if(value!=""&&searchMethod==1||searchMethod==3){
			var reg=/^[0-9]*$/;
			if(!reg.test(value)){
				layer.msg("请输入数字", {time:1000, icon:5, shift:6});
				$("#search").val("");
				return false;
			}
		}
		var jsonObj={
			method:"queryPage",
			pageno: pageno+1,
			pagesize: 5,
			value: value,
			searchMethod: searchMethod
		};
		$.ajax({
			url:"${pageContext.request.contextPath}/UserServlet",
			type:"POST",
			data:jsonObj,
			dataType:"json",
			beforeSend:function(){
				$("#tbody").html("");
			},
			success: function(result){
				var page=result.page;
				var endDates=result.endDates;
				$("#Pagination").pagination(page.totalno, {
					num_edge_entries : 2, //边缘页数
					num_display_entries : 4, //主体页数
					callback : queryPage,
					current_page : (page.pageno-1),
					items_per_page : page.pagesize,
					prev_text : "上一页",
					next_text : "下一页"
				});
				var context='';
				var list=page.datas;
				if(list.length==0){
					context+='没找到对应信息';
				}
				$.each(list,function(i,n){
					context+='<tr>';
					context+='<td>卡号:'+n.id+'&nbsp</td>';
					context+='<td>姓名:'+n.name+'&nbsp</td>';
					context+='<td>性别:'+n.sex+'&nbsp</td>';
					context+='<td>电话:'+n.phone+'&nbsp</td>';
					context+='<td>到期日期:'+endDates[i]+'&nbsp</td>';
					context+='<td><a href="${pageContext.request.contextPath}/UserServlet?id='+n.id+'&method=queryUserMessageById">详细信息</a>&nbsp</td>';
					context+='</tr>';
				});
				$("#tbody").html(context);
			}
		});
	}
	
	$("#submit").click(function(){
		queryPage(0);
	});
</script>
</html>