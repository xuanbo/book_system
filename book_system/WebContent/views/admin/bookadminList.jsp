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
<script type="text/javascript" src="assets/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
<title>查看图书管理员</title>
</head>
<body>
     <!-- 引用bookadmin -->
     <c:import url="bookadmin.jsp"></c:import>
     <!-- 引用bookadminUpdateModal -->
     <c:import url="bookadminUpdateModal.jsp"></c:import>
     <!-- 引用修改成功orderModal -->
     <c:import url="../books/orderModal.jsp"></c:import>
     
     <div class="bookAdminListDiv">
        <c:if test="${empty bookadmins }">
            <p>暂时还没有图书管理员</p>
        </c:if>
        
        <c:if test="${not empty bookadmins }">
           <table class="table table-hover table-bordered table-condensed">
               <tr class="info">
                  <th>图书管理员账号</th>
                  <th>图书管理员密码</th>  
                  <th>管理</th>            
               </tr>
               <c:forEach items="${bookadmins }" var="ba">
                   <tr>
                       <td class="name">${ba.getName() }</td>
                       <td class="password">${ba.getPassword() }</td>
                       <td>
                          <span class="bookadminUpdate" data-id="${ba.getName() }">修改</span>
                          <span class="bookadminDelete" data-id="${ba.getId() }">删除</span>
                       </td>
                   </tr>
               </c:forEach>
           </table>      
        </c:if>
     </div>
     <script type="text/javascript">
         $(function(){
        	 $('.bookadminList').css({
        		 "background-color": "#0066FF",
        		 "color": "#FFFFFF"
        	 });
        	 
        	 $('.bookadminList').bind('mouseover',function(){
        		 $(this).css({
            		 "background-color": "#0044FF",
            	 });
        	 });
        	 $('.bookadminList').bind('mouseout',function(){
        		 $(this).css({
            		 "background-color": "#0066FF",
            	 });
        	 });
        	 
        	 //bookadmin update
        	 $('.bookadminUpdate').on('click',function(){
        		var id = $(this).data("id");
        		console.log(id);
        		//跟新密码提醒
         		$('#modalBody .form-group #password').val($(this).parent().parent().find('.password').text());
         		
         		$('#bookadminUpdateModal').modal({backdrop: 'static', keyboard: false});
         		
         		$('#sbmit_update').on('click',function(){
         			var name = $(this).parent().parent().find('#modalBody').find('.form-group').find('#name').val();
            		var password = $(this).parent().parent().find('#modalBody').find('.form-group').find('#password').val();
            		
            		if(name == "" || password == ""){
            			return false;
            		}else{
            			var data = {
            					id: id,
            					name: name,
            					password: password
            			};
            			data = JSON.stringify(data);
            			$.ajax({
                 		   type: "POST",
      		  			   contentType: "application/json",//必须有
      		               dataType: "json",//返回值，不必须
      		  			   url: "admin/bookadmin/update",
      		  			   data: data,
      		  			   success: function(msg){
      		  				   if(msg){
      		  					$('#return_update').click();
          						//提醒
          						$('#info').text("新增成功！");
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
        	 
        	 //删除
        	 $('.bookadminDelete').on('click',function(){
        		 var id = $(this).data("id");
        		 
        		 var c = confirm("确定删除该借阅证号？");
        		 if(c == true){
        			 $.ajax({
          			   type: "POST",
          			   contentType: "application/json",//必须有
          			   dataType: "json",//返回值，不必须
		  			   url: "admin/bookadmin/delete?id="+id,
		  			   success: function(msg){
		  				   if(msg){
		  					$('#return_update').click();
	 						//提醒
	 						$('#info').text("删除成功！");
							   $('#orderWaringModalBody').css({
								   "height": "80px"
							   });
							   $('#info').css({
								   "color": "#000000",
								   "text-align": "center",
								   "font-size": "30px"
							   });
							   $('#orderWaring').modal({backdrop: 'static', keyboard: false});
		  				   }
		  				
		  			   }   
          			});
        		 }
        	 });
        	 
        	 //关闭提醒框之后 前端刷新页面
       	     $('.close').on('click',function(){
       	    	 window.location.reload();
       	     });
         });
     </script>
</body>
</html>