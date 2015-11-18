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
<link rel="stylesheet" type="text/css" href="assets/my/book/pageBtnStyle.css">
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
              书的编号：${b.bookId }<br>
              作者：${b.writer }<br>
              类型：${b.style }<br>
              描述：${b.description }<br>
              剩余预约书籍数目：${b.restNumber }<br> 
              <input class="btn_order" type="button" value="预约" data-bookid='${b.id }'>
           </div>                               
         </div>      
      </c:forEach>
      <br>
  </div>
  
  <hr>
  
  <!-- 书籍预约后的处理提示框 -->
  <c:import url="orderModal.jsp"></c:import>
  <!-- 分页按钮区 -->
  <c:import url="byPageForBook.jsp"></c:import>
  
  
  <script type="text/javascript">
       $(function(){
	     $('#two').addClass("active");
	     
	     $('.btn_order').on('click',function(){
	    	 $('#load').html(' <div class="mask"></div><div class="loading"><div class="one"></div><div class="two"></div><div class="three"></div><div class="four"></div><div class="five"></div></div>');
	    	 
	    	 var bookId = $(this).data("bookid");
	    	 var data = {
	    			 bookId: bookId
	    	 };
	    	 data = JSON.stringify(data);
	    	 console.log(data);
	    	 $.ajax({
	    		 type: "POST",
				   contentType: "application/json",//必须有
	               dataType: "json",//返回值，不必须
				   url: "common/book/order",
				   data: data,
				   success: function(msg){
					   if(msg){
						   //关闭遮罩和载入等待动画
						   $('#load').empty();
						   
						   $('#info').text("您的预约已提交，请关注预约处理信息哦！");
						   $('#orderWaringModalBody').css({
							   "height": "100px"
						   });
						   $('#info').css({
							   "color": "#000000",
							   "text-align": "center",
							   "font-size": "30px"
						   });
						   $('#orderWaring').modal({backdrop: 'static', keyboard: false});
					   }else{
						   //关闭遮罩层和载入等待动画
						   $('#load').empty();
						   
						   $('#info').text("您的预约提交失败!");
						   $('#orderWaringModalBody').css({
							   "background-color": "red",
							   "height": "100px"
						   });
						   $('#info').css({
							   "color": "#FFFFFF",
							   "text-align": "center",
							   "font-size": "40px"
						   });
						   //显示模态框并禁用点击空白处或键盘按键esc取消模态框
						   $('#orderWaring').modal({backdrop: 'static', keyboard: false});
					   }
				   }
	    	 });
	     });
	     
	     //关闭提醒框之后前端刷新页面
	     $('.close').on('click',function(){
	    	 window.location.reload();
	     });
	   });
   </script>
</body>
</html>