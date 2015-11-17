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
<link rel="stylesheet" type="text/css" href="assets/my/book/listPage.css">
<link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="assets/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
<title>书籍页面</title>
</head>
<body>
  <!-- 引用head -->
  <c:import url="../template/head.jsp"></c:import>
  
  <!-- 书籍搜索区 -->
  <c:import url="searchBar.jsp"></c:import>
  
  <!-- 书籍区 -->
  <div>
      <c:forEach items="${books }" var="b">
         <div class="book_center">        
           <div class="book_url">
               <!-- 把Exchange的url属性赋给a href标签，也为后文的img提供url -->
               <a class="example-image-link" href="http://localhost:8080/book_system/resource/download/bookImages/${b.bookUrl }" data-lightbox="example-set">
                  <img class="example-image" src="http://localhost:8080/book_system/resource/download/bookImages/${b.bookUrl }">
               </a>
           </div>           
           <div class="book_info">
              <h4>书名：${b.name }</h4>
              作者：${b.writer }<br>
              描述：${b.description }<br>
              剩余书籍数目：${b.restNumber }<br> 
              <input class="btn_order" type="button" value="预约">
           </div>                               
         </div>      
      </c:forEach>
      <br>
  </div>
</body>
</html>