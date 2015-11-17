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
<link rel="stylesheet" type="text/css" href="assets/my/admin/user.css">
<script type="text/javascript" src="assets/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
<title>查看借阅证</title>
</head>
<body>
     <!-- 引用user -->
     <c:import url="user.jsp"></c:import>
     <!-- 引用userUpdateModal -->
     <c:import url="userUpdateModal.jsp"></c:import>
     <!-- 引用修改后提醒orderModal -->
     <c:import url="../books/orderModal.jsp"></c:import>
     
     <div class="searchBar">
             <input id="searchInput" type="text" class="form-control" placeHolder="请输入借阅证号：">            
             <a href="admin/user/list" id="searchBtn" class="btn btn-info"> 
                   搜 索
             </a>
     </div>
          
     <div class="userList">  
          <c:if test="${empty users }">
                <p style="margin-left: 30%;width: 40%;text-align: center;font-size: 200%;">没找到该该借阅证号</p>
          </c:if>        
          <c:if test="${not empty users }">
            <table class="table table-hover table-bordered table-condensed">
              <tr class="info">
                  <th>
                      <input type="checkbox">
                      <input type="button" class="btn btn-danger" value="删 除">
                  </th>
                  <th>借阅证号</th>
                  <th>借阅证密码</th>
                  <th>借阅身份</th>
                  <th>管理</th>
              </tr> 
              
              <c:forEach items="${users }" var="u">
              <tr>
                  <td><input type="checkbox"></td>
                  <td>${u.getName() }</td>
                  <td class="password">${u.getPassword() }</td>
                  <td>${u.getStatus().getName() }</td>
                  <td>
                     <span class="userUpdate" data-id="${u.getName() }">修改</span>
                     <span class="userDelete" data-id="${u.getName() }">删除</span>
                  </td>
              </tr>  
              </c:forEach>
            </table>       
          </c:if>
     </div>
     
     <script type="text/javascript">
        $(function(){
        	$('#oneManage').removeClass('btn btn-default').addClass('btn btn-primary');
        	
        	$('#searchBtn').on('click',function(){
        		var name = $('#searchInput').val().trim();        		
        		if(name == ""){
        			return false;
        		}else{
        			var a = $('#searchBtn');
        			a.attr('href',"admin/user/search?name="+name);
        		}
        	});
        	
        	//修改
        	$('.userUpdate').on('click',function(){
        		var userName = $(this).data("id");
        		
        		//跟新密码提醒
        		$('#modalBody .form-group #password').val($(this).parent().parent().find('.password').text());
        		
        		$('#userUpdateModal').modal({backdrop: 'static', keyboard: false});
        		
        		$('#sbmit_update').on('click',function(){
            		var statusName = $(this).parent().parent().find('#modalBody').find('.form-group').find('#statusName').val();
            		var password = $(this).parent().parent().find('#modalBody').find('.form-group').find('#password').val();
            		
            		if(statusName == "" || password == ""){
            			return false;
            		}else{
            			var data = {
                				name: userName,
                				statusName: statusName,
                				password: password
                		}
                		data = JSON.stringify(data);
                		$.ajax({
                		   type: "POST",
     		  			   contentType: "application/json",//必须有
     		               dataType: "json",//返回值，不必须
     		  			   url: "admin/user/update",
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
     		  				   }
     		  				
     		  			   }
                		});
            		}
            		
            	});
        	});
        	
        	//删除
        	$('.userDelete').on('click',function(){
        		var userName = $(this).data("id");
        		var c = confirm("确定删除该借阅证号？");
        		if(c == true){
        			$.ajax({
        			   type: "POST",
        			   contentType: "application/json",//必须有
   		               dataType: "json",//返回值，不必须
   		  			   url: "admin/user/delete?name="+userName,
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