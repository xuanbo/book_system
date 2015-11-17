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
<link rel="stylesheet" type="text/css" href="assets/my/bookAdmin/orderBar.css">
<link rel="stylesheet" type="text/css" href="assets/my/bookAdmin/orderSuccess.css">
<script type="text/javascript" src="assets/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
<title>已归还</title>
</head>
<body>
   <!-- 引入bookAdmin的index页面 -->
   <c:import url="index.jsp"></c:import>
   
   <div class="searchBar"> 
     <div class="inputUserId">   
        <input id="userId" type="text" class="form-control" placeholder="输入用户的借阅证号：">
     </div>  
     <a id="search" class="btn btn-primary" href="bookadmin/returnSuccess/list">
        搜 索
     </a>
   </div> 
   
   <div class= "orderSuccessList">        
      <c:if test="${empty returnSuccess }">
         <p style="text-align: center; font-size: 30px;">暂无结果</p>
      </c:if>
      
   <c:if test="${not empty returnSuccess }">
   <table class="table table-hover table-bordered table-condensed">
      <tr class="info">
        <th>用户借阅证号</th>
        <th>书名</th>
        <th>借出时间</th>
        <th>归还时间</th>
        <th>最大借阅时间(天)</th>
      </tr>     
      <c:forEach items="${returnSuccess }"  var="returnBook">
      <tr>
        <td>${returnBook.getUser().getName() }</td>
        <td>${returnBook.getBook().getName() }</td>
        <td>${returnBook.getBorrowTime() }</td>
        <td>${returnBook.getReturnTime() }</td>
        <td>${returnBook.getUser().getStatus().getBorrowBookTime() }</td>
      </tr> 
      </c:forEach>     
   </table>
   </c:if>
   </div>
   
   <script type="text/javascript">
      $(function(){
    	  $('#orderSuccessThree').addClass('active');
    	  
    	  $('#search').on('click',function(){
   		   var userId = $('#userId').val().trim();
   		   if(userId == ""){
   			   return false;
   		   }else{ 
   			   var a = $('#search');
   			   a.attr('href',"bookadmin/returnSuccess/search?userId="+userId);
   		   }
   	      });
      });
   </script>
</body>
</html>