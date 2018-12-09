<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="static/bootstrap-3.3.7-dist/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="static/bootstrap-datepicker-1.6.4-dist/css/bootstrap-datepicker.min.css" rel="stylesheet">
</head>
<body>
	<input type="text">
</body>
<script type="text/javascript" src="static/jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" src="static/bootstrap-datepicker-1.6.4-dist/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="static/bootstrap-datepicker-1.6.4-dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript">
$('input').datepicker({
    format: "yyyy-mm-dd",
    language: "zh-CN"
});
</script>
</html>