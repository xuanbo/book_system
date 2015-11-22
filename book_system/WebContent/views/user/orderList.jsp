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
<title>我的预约</title>
</head>
<body>
    <!-- 引用head -->
    <c:import url="../template/head.jsp"></c:import>
    
    <div id="myorderListDiv">
       <p>我的预约</p>
       <c:if test="${empty myOrders }">
          <p>您还没有预约的信息哦！</p>   
       </c:if>
       
       <c:if test="${not empty myOrders }">
          <table class="table" style="margin-top: 2%;">
              <tr>
                 <th>预约时间</th>
                 <th>预约的书籍名称</th>
                 <th>书籍作者</th>
              </tr>             
              <c:forEach items="${myOrders }" var="o">
                 <tr>
                     <td>${o.getOrderTime() }</td>
                     <td>${o.getBook().getName() }</td>
                     <td>${o.getBook().getWriter() }</td>
                 </tr>
              </c:forEach>
          </table>
       </c:if>
     </div>
     
</body>
</html>