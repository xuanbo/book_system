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
<title>批量新增借阅证</title>
</head>
<body>
     <!-- 引用user -->
     <c:import url="user.jsp"></c:import>
     <!-- 引用批量新增后提醒orderModal -->
     <c:import url="../books/orderModal.jsp"></c:import>
     
     <div class="userList">
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
          
          <div class="form-group">
              <span>
                  借阅证的起始编号：
              </span>
              <input id="name" type="text" class="form-control" placeHolder="请输入起始编号：">
          </div>
          
          <div class="form-group">
              <span>
                  创建借阅证的数目：
              </span>
              <input id="number" type="text" class="form-control" placeHolder="请输入借阅证数目：">
          </div>
      
          <div class="titleFont">
               <div>
                  说明：
               </div>
               若起始编号为000001，数目为10，借阅证身份为老师，
           那么将批量创建10个借阅证身份为老师的借阅证，
           它们的借阅证号从000001到000010，密码与借阅证号相同。
          </div>
          
          <div class="userAddBtn">
                <input id="BatchAddUserBtnSubmit" type="button" value="提 交">
          </div>
     </div>
     
     <script type="text/javascript">
         $(function(){
        	 $('#threeManage').removeClass('btn btn-default').addClass('btn btn-primary');
        	 
        	 //批量提交
        	 $('#BatchAddUserBtnSubmit').on('click',function(){
        		 var statusName = $(this).parent().parent().find('.form-group').find('#statusName').val();
        		 var name = $(this).parent().parent().find('.form-group').find('#name').val();
        		 var number = $(this).parent().parent().find('.form-group').find('#number').val();
        		 
        		 if(statusName == "" || name == "" || number == ""){
        			 return false;
        		 }else{
        			 var data ={
            				 statusName: statusName,
            				 name: name,
            				 number: number
            		 };
            		 data = JSON.stringify(data);
             		 $.ajax({
             			type: "POST",
     		  			contentType: "application/json",//必须有
     		            dataType: "json",//返回值，不必须
     		  			url: "admin/user/batchAdd",
     		  			data: data,
     		  			success: function(msg){
     		  				$('#return_update').click();
     						//提醒
     						$('#info').text("批量新增借阅证成功！");
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
             		 });
        		 }
        		 
        	 });
        	 
        	 //关闭提醒框之后 前端刷新页面
      	     $('.close').on('click',function(){
      	    	 window.location.reload('batchAdd');
      	     });
         });
     </script>
</body>
</html>