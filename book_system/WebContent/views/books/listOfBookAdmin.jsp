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
  
  <!-- 书籍区 -->
  <div style="margin-top: 5%">
      <c:forEach items="${books }" var="b">
         <div class="book_center">        
           <div class="book_url">
               <!-- 把Exchange的url属性赋给a href标签，也为后文的img提供url -->
               <a class="example-image-link" href="http://localhost:8080/book_system/resource/download/bookImages/${b.bookUrl }" data-lightbox="example-set">
                  <img class="example-image" src="http://localhost:8080/book_system/resource/download/bookImages/${b.bookUrl }">
               </a>            
           </div>      
           <div class="book_info">
              书名：<span class="name">${b.name }</span><br>
              书的编号：<span class="bookId">${b.bookId }</span><br>
              作者：<span class="writer">${b.writer }</span><br>
              类型：<span class="style">${b.style }</span><br>
              来源：<span class="country">${b.country }</span><br>
              描述：<span class="description">${b.description }</span><br>
              剩余预约书籍数目：<span class="restNumber">${b.restNumber }</span><br>
              剩余书籍数目：<span class="bookNumber">${b.bookNumber }</span><br>
              <div class="btnTools"> 
                 <input class="btn_bookUrl" type="button" value="修改图片" data-id='${b.id }'>
                 <input class="btn_update" type="button" value="修改信息" data-id='${b.id }'>
                 <input class="btn_delete" type="button" value="删除" data-id='${b.id }'>
              </div>
           </div>                               
         </div>      
      </c:forEach>
      <br>
  </div>
  
  <hr>
  
  <!-- 分页按钮区 -->
  <c:import url="byPageForBook.jsp"></c:import>
  <!-- 书籍删除后的处理提示框 -->
  <c:import url="orderModal.jsp"></c:import>
  <!-- 引用imageUploadModal.jsp -->
  <c:import url="imageUploadModal.jsp"></c:import> 
  <!-- 引用updateModal.jsp -->
  <c:import url="updateModal.jsp"></c:import>
  
  <!-- 引入文件上传js -->
  <script type="text/javascript" src="assets/ajax/ajaxfileupload.js"></script>
  <script type="text/javascript">
       $(function(){
	     $('#two').addClass("active");
	     
	     //修改图书图片按钮
	     $('.btn_bookUrl').on('click',function(){
	    	var id = $(this).data("id");
	    	 
	    	$('#bookUrlModal').modal({backdrop: 'static', keyboard: false});
	    	 
	    	//点击选择图片按钮，激活选择文件
	        $('#filepick').click(function(){
	    		$('#myfile').click();
	        });
	    		
	        //图片预览
	    	$("#myfile").change(function(){
	    		 var objUrl = getObjectURL(this.files[0]) ;
	    		 //console.log("objUrl = "+objUrl) ;
	    		 if (objUrl) {
	    			 $(".img0").attr("src", objUrl) ;
	    			 $('.fileWaring').empty();
	    		 };			
	    	 }) ;
	        
	        //图片提交按钮
	        $('#submit_button').on('click',function(){
	        	//获取上传的文件名
				var pictureName = $('#myfile').val();
				//console.log(pictureName);
				//获取文件后缀
				var suffixName = pictureName.substr(pictureName.indexOf("."));
				//console.log(suffixName);
				if(suffixName == ".jpg" || suffixName == ".png"){
					$.ajaxFileUpload({
		 				url: 'common/book/uploadImage?id='+id,
		 				type: 'POST',
		 				secureuri: false,
		 				fileElementId: 'myfile',
		 				dataType: 'json',
		 				success: function(data){				
		 					if(data.flag == "success"){
		 						$('#return_button').click();
		 						
		 						$('#info').text("该图书更换图片成功！");
								   $('#orderWaringModalBody').css({
									   "height": "100px"
								   });
								   $('#info').css({
									   "color": "#000000",
									   "text-align": "center",
									   "font-size": "30px"
								   });
								   $('#orderWaring').modal({backdrop: 'static', keyboard: false});
		 					}else {
		 						var warning = '<font color=red>'+data.flag+'</font>';
		 						$('.fileWaring').html(warning);				
		 					}
		 	            }
		 			});						
				}else{
					$('.fileWaring').html('<font color=red>请选择图片，支持的格式有jpg、png</font>');
				    return false;
				};	
	        });
	     });
	     
	     //修改信息按钮
	     $('.btn_update').on('click',function(){
	    	 var id = $(this).data("id");
	    	 
	    	 $('#modalBody .form-group #name').val($(this).parent().parent().find('.name').text());
	    	 $('#modalBody .form-group #bookId').val($(this).parent().parent().find('.bookId').text());
	    	 $('#modalBody .form-group #writer').val($(this).parent().parent().find('.writer').text());
	    	 $('#modalBody .form-group #style').val($(this).parent().parent().find('.style').text());
	    	 $('#modalBody .form-group #country').val($(this).parent().parent().find('.country').text());
	    	 $('#modalBody .form-group #description').val($(this).parent().parent().find('.description').text());
	    	 $('#modalBody .form-group #restNumber').val($(this).parent().parent().find('.restNumber').text());
	    	 $('#modalBody .form-group #bookNumber').val($(this).parent().parent().find('.bookNumber').text());
	    	 
	    	 $('#updateModal').modal({backdrop: 'static', keyboard: false});
	    	 
	    	 $('#sbmit_update').on('click',function(){
	    		 var name = $(this).parent().parent().find('#modalBody').find('.form-group').find('#name').val();
	    		 var bookId = $(this).parent().parent().find('#modalBody').find('.form-group').find('#bookId').val();
	    		 var writer = $(this).parent().parent().find('#modalBody').find('.form-group').find('#writer').val();
	    		 var style = $(this).parent().parent().find('#modalBody').find('.form-group').find('#style').val();
	    		 var country = $(this).parent().parent().find('#modalBody').find('.form-group').find('#country').val();
	    		 var description = $(this).parent().parent().find('#modalBody').find('.form-group').find('#description').val();
	    		 var restNumber = $(this).parent().parent().find('#modalBody').find('.form-group').find('#restNumber').val();
	    		 var bookNumber = $(this).parent().parent().find('#modalBody').find('.form-group').find('#bookNumber').val();
	    		 var data = {
	    				 id: id,
	    				 name: name,
	    				 bookId: bookId,
	    				 writer: writer,
	    				 style: style,
	    				 country: country,
	    				 description: description,
	    				 restNumber: restNumber,
	    				 bookNumber: bookNumber
	    		 };
	    		 data = JSON.stringify(data);
	    		 //alert(data);
	    		 $.ajax({
	    			 type: "POST",
		  			   contentType: "application/json",//必须有
		               dataType: "json",//返回值，不必须
		  			   url: "common/book/update",
		  			   data: data,
		  			   success: function(msg){
		  				   if(msg){
		  					 $('#return_update').click();
		  		    		 $('#info').text("该图书已修改成功！");
		  					   $('#orderWaringModalBody').css({
		  						   "height": "100px"
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
	    		 
	    	 });
	     });
	     
	     $('.btn_delete').on('click',function(){
	    	 var c = confirm("确定删除该图书？");
	    	 if(c == true){
	    		 var id = $(this).data("id");
	    		 var data = {
	    					id: id
	    			   };
	    	     data = JSON.stringify(data);
	    		 $.ajax({
	    		   type: "POST",
	  			   contentType: "application/json",//必须有
	               dataType: "json",//返回值，不必须
	  			   url: "common/book/delete",
	  			   data: data,
	  			   success: function(msg){
	  				   if(msg){
	  					   $('#info').text("该图书已删除成功！");
						   $('#orderWaringModalBody').css({
							   "height": "100px"
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
	    	 };
	     });
	     
	     //关闭提醒框之后 前端刷新页面
	     $('.close').on('click',function(){
	    	 window.location.reload();
	     });
	     
	    //建立一個可存取到該file的url
 		function getObjectURL(file) {
 			var url = null ; 
 			if (window.createObjectURL!=undefined) { // basic
 				url = window.createObjectURL(file) ;
 			} else if (window.URL!=undefined) { // mozilla(firefox)
 				url = window.URL.createObjectURL(file) ;
 			} else if (window.webkitURL!=undefined) { // webkit or chrome
 				url = window.webkitURL.createObjectURL(file) ;
 			}
 			return url ;
 		};
 		
	   });
   </script>
</body>
</html>