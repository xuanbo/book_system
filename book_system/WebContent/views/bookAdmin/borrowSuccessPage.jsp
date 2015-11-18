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
<title>已借出</title>
</head>
<body>
   <!-- 引入bookAdmin的index页面 -->
   <c:import url="index.jsp"></c:import>
   
   <div class="searchBar"> 
     <div class="inputUserId">   
        <input id="userId" type="text" class="form-control" placeholder="输入用户的借阅证号：">
     </div>  
     <a id="search" class="btn btn-primary" href="bookadmin/borrowSuccess/list">
        搜 索
     </a>
   </div> 
   
   <div class= "orderSuccessList">        
      <c:if test="${empty borrowSuccess }">
         <p style="text-align: center; font-size: 30px;">暂无结果</p>
      </c:if>
      
   <c:if test="${not empty borrowSuccess }">
   <table class="table table-hover table-bordered table-condensed">
      <tr class="info">
        <th>用户借阅证号</th>
        <th>书名</th>
        <th>借出时间</th>
        <th>能借阅的最大时间（天）</th>
        <th>管理</th>
      </tr>     
      <c:forEach items="${borrowSuccess }"  var="borrow">
      <tr>
        <td>${borrow.getUser().getName() }</td>
        <td>${borrow.getBook().getName() }</td>
        <td>${borrow.getBorrowTime() }</td>
        <td>${borrow.getUser().getStatus().getBorrowBookTime() }</td>
        <td><span class="borrowState" data-orderid="${borrow.getId() }">归还</span>  <span class="failState" data-orderid="${borrow.getId() }">归还失败</span></td>
      </tr> 
      </c:forEach>     
   </table>
   </c:if>
   </div>
   
   <script type="text/javascript">
      $(function(){
    	  $('#orderSuccessTwo').addClass('active');
    	  
    	  $('#search').on('click',function(){
   		   var userId = $('#userId').val().trim();
   		   if(userId == ""){
   			   return false;
   		   }else{ 
   			   var a = $('#search');
   			   a.attr('href',"bookadmin/borrowSuccess/search?userId="+userId);
   		   }
   	       });
    	  
    	  $('.borrowState').on('click',function(){
   		   var orderId = $(this).data("orderid");
   		   var data = {
   					orderId: orderId,
   					state: "已归还"
   			   };
   		   data = JSON.stringify(data);
   		   $.ajax({
   			   type: "POST",
   			   contentType: "application/json",//必须有
                  dataType: "json",//返回值，不必须
   			   url: "bookadmin/orderSuccess/orderStateChange",
   			   data: data,
   			   success: function(msg){
   				   if(msg){
   					   //前端刷新页面
   					   window.location.reload();
   				   }
   			   }
   		   });
   	   });
   	   
   	   $('.failState').on('click',function(){
   		   var orderId = $(this).data("orderid");
   		   var data = {
   					orderId: orderId,
   					state: "归还失败"
   			   };
   		   data = JSON.stringify(data);
   		   $.ajax({
   			   type: "POST",
   			   contentType: "application/json",//必须有
                  dataType: "json",//返回值，不必须
   			   url: "bookadmin/orderSuccess/orderStateChange",
   			   data: data,
   			   success: function(msg){
   				   if(msg){
   					   //前端刷新页面
   					   window.location.reload();
   				   }
   			   }
   		   });
   	   });
      });
   </script>
</body>
</html>