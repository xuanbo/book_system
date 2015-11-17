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
<link rel="stylesheet" type="text/css" href="assets/my/admin/userAdd.css">
<script type="text/javascript" src="assets/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
<title>新增借阅证</title>
</head>
<body>
     <!-- 引用user -->
     <c:import url="user.jsp"></c:import>
     <!-- 引用修改后提醒orderModal -->
     <c:import url="../books/orderModal.jsp"></c:import>
     
     <div class="userList">
         <div class="form-group">
              <span>
                  借阅证号：
              </span>
              <input id="name" type="text" class="form-control" placeHolder="请输入借阅证号：">
         </div>
         
         <div class="form-group">
              <span>
                  借阅证密码：
              </span>
              <input id="password" type="text" class="form-control" placeHolder="请输入借阅证密码：">
         </div>
         
         <div class="form-group">
              <span>
                  借阅证身份：
              </span>
              <select id="statusName" class="form-control">
                 <c:if test="${not empty status}">               
                     <c:forEach items="${status }"  var="s">
                         <option>${s.getName() }</option>
                     </c:forEach>
                 </c:if>
              </select>
         </div>
         
         <div class="userAddBtn">
             <input id="addUserBtnSubmit" type="button" value="提 交">
         </div>
     </div>
     
     <script type="text/javascript">
        $(function(){
        	$('#twoManage').removeClass('btn btn-default').addClass('btn btn-primary');
        	
        	$('#addUserBtnSubmit').on('click',function(){
        		var name = $(this).parent().parent().find('.form-group').find('#name').val();
        		var password = $(this).parent().parent().find('.form-group').find('#password').val();
        		var statusName = $(this).parent().parent().find('.form-group').find('#statusName').val();
        		
        		if(name =="" || password == "" || statusName == ""){
        			return false;
        		}else{
        			var data = {
            				name: name,
            				password: password,
            				statusName: statusName
            		};
            		data = JSON.stringify(data);
            		
            		$('#return_update').click();
    					//提醒
    				$('#info').text("正在批量新增借阅证，请稍后！");
      				$('#orderWaringModalBody').css({
    					   "height": "80px"
    				   });
    				   $('#info').css({
    					   "color": "#000000",
    					   "text-align": "center",
    					   "font-size": "30px"
    				   });
    				   $('#orderWaring').modal({backdrop: 'static', keyboard: false});
            		
            		$.ajax({
            			type: "POST",
    		  			contentType: "application/json",//必须有
    		            dataType: "json",//返回值，不必须
    		  			url: "admin/user/add",
    		  			data: data,
    		  			success: function(msg){
    		  				if(msg){
    		  					   $('#return_update').click();
         						   //提醒
         						   $('#info').text("新增借阅证成功！");
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
       						   $('#info').text("借阅证号已经存在，不能使用该账号！");
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
        	
        	 //关闭提醒框之后 前端刷新页面
      	     $('.close').on('click',function(){
      	    	 window.location.reload('add');
      	     });
        });
     </script>
</body>
</html>