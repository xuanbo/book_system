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
<link rel="stylesheet" type="text/css" href="assets/my/admin/status.css">
<script type="text/javascript" src="assets/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
<title>借阅身份查看</title>
</head>
<body>
   <!-- 引用adminManagement -->
   <c:import url="adminManagement.jsp"></c:import>
   <!-- status修改后提示框 -->
   <c:import url="../books/orderModal.jsp"></c:import>
   <!-- 引用statusUpdateModal -->
   <c:import url="statusUpdateModal.jsp"></c:import>
   <div class="status">
       <div class="titile">
             借阅身份查看
       </div>
       <c:if test="${empty statusList }">
         <p style="text-align: center; font-size: 30px;">暂无借阅身份信息</p>
         <a href="admin/status/add">
             <input class="statusWaring" value="添加借阅身份">              
         </a>    
       </c:if>
       
       <c:if test="${not empty statusList }">
          <table class="table table-hover table-bordered table-condensed">
              <tr class="info">
                  <th>身份</th>
                  <th>借阅书籍数目</th>
                  <th>预约书籍数目</th>
                  <th>借阅书籍时间(天)</th>
                  <th>管理</th>
              </tr> 
              
              <c:forEach items="${statusList }" var="s">
              <tr>
                  <td class="name">${s.getName() }</td>
                  <td>${s.getBorrowNumber() }</td>
                  <td>${s.getOrderNumber() }</td>
                  <td>${s.getBorrowBookTime() }</td>
                  <td>
                     <span class="statusUpdate" style="cursor: pointer;" title="点我" data-id="${s.getId() }">修改</span>
                  </td>
              </tr>  
              </c:forEach>
          </table>
       </c:if>
   </div>
   
   <script type="text/javascript">
      $(function(){
    	 $('#manageOne').addClass('active'); 
    	 
    	 $('.statusUpdate').on('click',function(){
    		 var name0 = $(this).parent().parent().find('.name').text();
    		 
    		 var statusId = $(this).data("id");   		 
    		 $('#statusUpdateModal').modal({backdrop: 'static', keyboard: false});
    		 
    		 $('#sbmit_update').on('click',function(){
    			 var name = $(this).parent().parent().find('#modalBody').find('.form-group').find('#name').val();
    			 var borrowBookTime = $(this).parent().parent().find('#modalBody').find('.form-group').find('#borrowBookTime').val();
    			 var borrowNumber = $(this).parent().parent().find('#modalBody').find('.form-group').find('#borrowNumber').val();
    			 var orderNumber = $(this).parent().parent().find('#modalBody').find('.form-group').find('#orderNumber').val();    			 
    			 //用来判断借阅证的身份有没有被修改  身份改变为了 flag=true
    			 var flag = false;
    			 if(name == "" || borrowBookTime == "" || borrowNumber == "" || orderNumber == ""){
    				 return false;
    			 }else{
    				 if(name === name0){
    					 flag == false;
    				 }else{
    					 flag = true;
    				 };
    				 var data = {
        					 id: statusId,
        					 name: name,
        					 borrowBookTime: borrowBookTime,
        					 borrowNumber: borrowNumber,
        					 orderNumber: orderNumber,
        					 flag: flag
        			 };
        			 data = JSON.stringify(data);				   					   
        			 $.ajax({
    	    			   type: "POST",
    		  			   contentType: "application/json",//必须有
    		               dataType: "json",//返回值，不必须
    		  			   url: "admin/status/update",
    		  			   data: data,
    		  			   success: function(msg){
    		  				    if(msg){
    		  				    	$('#return_update').click();
        	 						
        	 						$('#info').text("修改成功！");
        							   $('#orderWaringModalBody').css({
        								   "height": "100px"
        							   });
        							   $('#info').css({
        								   "color": "#000000",
        								   "text-align": "center",
        								   "font-size": "35px",
        							   });
        							   $('#orderWaring').modal({backdrop: 'static', keyboard: false});
    		  				    }else{
    		  				       $('#return_update').click();
           						   //提醒
           						   $('#info').text("该借阅身份已经存在，不能修改！");
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
    	 
    	//关闭提醒框之后 前端刷新页面
	     $('.close').on('click',function(){
	    	 window.location.reload();
	     });
      });
   </script>
</body>
</html>