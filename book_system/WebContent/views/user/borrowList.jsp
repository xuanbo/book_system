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
<link rel="stylesheet" type="text/css" href="assets/my/myOrders/myOrders.css">
<script type="text/javascript" src="assets/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
<title>我的借阅</title>
</head>
<body>
    <!-- 引用head -->
    <c:import url="../template/head.jsp"></c:import>
    
    <div id="myorderListDiv">
       <p>我的借阅</p>
       <c:if test="${empty myBorrows }">
          <p>您还没有正在借阅的信息哦！</p>   
       </c:if>
       
       <c:if test="${not empty myBorrows }">
          <table class="table" style="margin-top: 2%;">
              <tr>
                 <th>借阅时间</th>
                 <th>借阅的书籍名称</th>
                 <th>书籍作者</th>
              </tr>             
              <c:forEach items="${myBorrows }" var="b">
                 <tr>
                     <td>${b.getBorrowTime() }</td>
                     <td>${b.getBook().getName() }</td>
                     <td>${b.getBook().getWriter() }</td>
                 </tr>
              </c:forEach>
          </table>
       </c:if>
     </div>
     
</body>
</html>