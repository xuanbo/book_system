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
<link rel="stylesheet" href="assets/my/login/loginPage.css">
<script type="text/javascript" src="assets/jquery/jquery.min.js"></script>
<title>登录页面</title>
</head>
<body>
    <div id="div_center">   
       <p>欢迎登录图书管理系统</p>      
       <div class="inputUP">
           <input class="inputUsername" type="text" name="username" placeholder="请输入用户名：">
           <br>
           <input class="inputPassword" type="password" name="password" placeholder="请输入密码：">
       </div>
       <div class="inputSubmit">
           <input class="inputLogin" type="button" value="登录">
       </div>
    </div>
    
<script type="text/javascript">
   $(function(){
	   $("body").addClass('backgroundImage1');
	   //每5秒更换一次背景图片
	   setInterval(changeBackgroundImage,5000);
	   
	   function changeBackgroundImage(){
		   $("body").toggleClass('backgroundImage1').toggleClass('backgroundImage2');
	   }
	   
	   $('.inputLogin').on('click',function(){
		   var username = $('.inputUsername').val();
		   var password = $('.inputPassword').val();		   
		   var data = {
				username: username,
				password: password
		   };
		   data = JSON.stringify(data);
		   $.ajax({
			   type: "POST",
			   contentType: "application/json",//必须有
               dataType: "json",//返回值，不必须
			   url: "validate",
			   data: data,
			   success: function(msg){
				   if(msg){
					   window.location.assign('common/book/list');
				   }
			   }
		   });
	   });
   });
</script>
</body>
</html>