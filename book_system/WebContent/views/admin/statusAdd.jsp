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
<link rel="stylesheet" type="text/css" href="assets/my/admin/add.css">
<script type="text/javascript" src="assets/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
<title>新增借阅身份</title>
</head>
<body>
   <!-- 引用adminManagement -->
   <c:import url="adminManagement.jsp"></c:import>
   <!-- status新增后提示框 -->
   <c:import url="../books/orderModal.jsp"></c:import>
   
   <div class="status">
       <div class="titile">
          新增借阅身份
       </div>
       <br>
       <br>
       <div class="form-group">
          <span>
             借阅身份：
          </span>   
          <input id="name" type="text" class="form-control" placeholder="请输入新的借阅身份">
        </div>
        
        <div class="form-group">
          <span>
              借书时间(天)：
          </span>   
          <input id="borrowBookTime" type="text" class="form-control" placeholder="请输入新的借书时间">
        </div>
          
        <div class="form-group">
          <span>
              借阅书籍数目：
          </span>   
          <input id="borrowNumber" type="text" class="form-control" placeholder="请输入新的数目">
        </div>
          
       <div class="form-group">
          <span>
              预约书籍数目：
          </span>   
          <input id="orderNumber" type="text" class="form-control" placeholder="请输入新的数目">
       </div>
       
       <div class="addWaring">
       
       </div>
       
       <div class="btn_bar">
            <input type="button"  class="statusAddBtn" value="添加">
       </div>
   </div>
   
   <script type="text/javascript">
       $(function(){
    	   $('#manageOne').addClass('active');
    	   
    	   $('.statusAddBtn').on('click',function(){
    		   var name = $('#name').val();
    		   var borrowBookTime = $('#borrowBookTime').val();
    		   var borrowNumber = $('#borrowNumber').val();
    		   var orderNumber = $('#orderNumber').val();   		   
    		   if(name == "" || borrowBookTime == "" || borrowNumber == "" || orderNumber == ""){
    			   $('.addWaring').html('<font color="red">表格填写不能为空</font>');
    			   return false;
    		   }else{
    			   var data ={
    	    			name: name,
    	    			borrowBookTime: borrowBookTime,
    	    			borrowNumber: borrowNumber,
    	    			orderNumber: orderNumber
    	    	   };
    	    	   data = JSON.stringify(data);
    	    	   $.ajax({
    	    		   type: "POST",
		  			   contentType: "application/json",//必须有
		               dataType: "json",//返回值，不必须
		  			   url: "admin/status/add",
		  			   data: data,
		  			   success: function(msg){
		  				    if(msg){
		  				    	$('#return_update').click();
		 						
		 						$('#info').text("新增成功！");
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
       						   $('#info').text("借阅身份已经存在，无法添加！");
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
    		   };   		   
    	   });
    	   
    	 //关闭提醒框之后 前端刷新页面
  	     $('.close').on('click',function(){
  	    	 window.location.assign('add');
  	     });
       });
   </script>
</body>
</html>