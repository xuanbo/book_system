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
<link rel="stylesheet" type="text/css" href="assets/my/admin/managementBar.css">
<link rel="stylesheet" type="text/css" href="assets/my/admin/bookadmin.css">
<link rel="stylesheet" type="text/css" href="assets/my/admin/bookadminList.css">
<link rel="stylesheet" type="text/css" href="assets/my/admin/bookadminAdd.css">
<script type="text/javascript" src="assets/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
<title>新增图书管理员</title>
</head>
<body>
     <!-- 引用bookadmin -->
     <c:import url="bookadmin.jsp"></c:import>
     <!-- 引用添加成功orderModal -->
     <c:import url="../books/orderModal.jsp"></c:import>
     
     <div class="bookAdminListDiv">
         <div class="form-group">
             <span>图书管理员账号：</span>
             <input id="name" type="text" class="form-control" placeholder="请输入图书管理员账号：">
         </div>
         
         <div class="form-group">
             <span>图书管理员密码：</span>
             <input id="password" type="text" class="form-control" placeholder="请输入图书管理员密码：">
         </div>
         
         <div  class="bookadminAddBtn">
               <input id="bookadminAddSubmit" type="button" value="提 交">
         </div>
     </div>
     
     <script type="text/javascript">
         $(function(){
        	 $('.bookadminAdd').css({
        		 "background-color": "#0066FF",
        		 "color": "#FFFFFF"
        	 });
        	 
        	 $('.bookadminAdd').bind('mouseover',function(){
        		 $(this).css({
            		 "background-color": "#0044FF",
            	 });
        	 });
        	 $('.bookadminAdd').bind('mouseout',function(){
        		 $(this).css({
            		 "background-color": "#0066FF",
            	 });
        	 });
        	 
        	 //submit
        	 $('#bookadminAddSubmit').on('click',function(){
        		 var name = $('#name').val();
        		 var password = $('#password').val();
        		 
        		 if(name == "" || password == ""){
        			 return false;
        		 }else{
        			 var data = {
        					 name: name,
        					 password: password
        			 };
        			 data = JSON.stringify(data);
         			 $.ajax({
              		   type: "POST",
   		  			   contentType: "application/json",//必须有
   		               dataType: "json",//返回值，不必须
   		  			   url: "admin/bookadmin/add",
   		  			   data: data,
   		  			   success: function(msg){
   		  				   if(msg){
   		  					$('#return_update').click();
       						//提醒
       						$('#info').text("修改成功！");
      						   $('#orderWaringModalBody').css({
      							   "height": "80px"
      						   });
      						   $('#info').css({
      							   "color": "#000000",
      							   "text-align": "center",
      							   "font-size": "30px"
      						   });
      						   $('#orderWaring').modal({backdrop: 'static', keyboard: false});
   		  				   }else{
   		  					   $('#return_update').click();
       						   //提醒
       						   $('#info').text("账号已经存在，不能使用该账号！");
       						   $('#orderWaringModalBody').css({
    							        "height": "80px",
    							        "background-color": "red"
    						       });
       						   $('#info').css({
   							       "color": "#FFFFFF",
   							       "text-align": "center",
   							       "font-size": "30px"
   						        });
       						    $('#orderWaring').modal({backdrop: 'static', keyboard: false});
   		  				    }
   		  				
   		  			    }
              		 });
        		 }
        	 });
         });
     </script>

</body>
</html>