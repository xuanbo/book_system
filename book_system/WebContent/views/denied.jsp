<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>	
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="assets/my/denied/denied.css">
<script type="text/javascript" src="assets/jquery/jquery.min.js"></script>
<title>访问被拒绝</title>
</head>
<body>
	<h1>你没有权限访问该页面!</h1>
	<input type="button" class="btnBack" value="返回上一页">	
	
	<script type="text/javascript">
	$(function(){
		$('.btnBack').on('click',function(){
			history.back();
		});
	});
	</script>
</body>
</html>
