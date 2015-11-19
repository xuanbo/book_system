<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
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
<link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="assets/my/aboutUs.css">
<script type="text/javascript" src="assets/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
<title>关于我们</title>
</head>
<body>
   <!-- 引用head -->
   <c:import url="template/head.jsp"></c:import>
   
   <div class="imgShow">
	  <img class="pic1" src="resource/images/aboutUs/1.jpg"></img>
	  <img class="pic2" src="resource/images/aboutUs/2.jpg"></img>
	  <img class="pic3" src="resource/images/aboutUs/3.jpg"></img>
	  <img class="pic4" src="resource/images/aboutUs/4.jpg"></img>
	  <img class="pic5" src="resource/images/aboutUs/5.jpg"></img>
   </div>
   
</body>
</html>