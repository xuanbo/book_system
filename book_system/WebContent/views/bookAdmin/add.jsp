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
<link rel="stylesheet" type="text/css" href="assets/my/bookAdmin/orderBar.css">
<link rel="stylesheet" type="text/css" href="assets/my/bookAdmin/add.css">
<script type="text/javascript" src="assets/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
<title>新增图书</title>
</head>
<body>
  <!-- 引入bookAdmin的index页面 -->
  <c:import url="index.jsp"></c:import>
  
  <div id="addText">
     <div class="form-group">
          <span>书名：</span>
          <input class="form-control" id="name" type="text" placeHolder="请输入用户名：">
     </div>
     <div class="form-group">
          <span>编号：</span>
          <input class="form-control" id="bookId" type="text" placeHolder="请输入编号：">
     </div>
     <div class="form-group">
          <span>作者：</span>
          <input class="form-control" id="writer" type="text" placeHolder="请输入作者：">
     </div>
     <div class="form-group">
          <span>类型：</span>
          <input class="form-control" id="style" type="text" placeHolder="请输入类型：">
     </div>
     <div class="form-group">
          <span>图书来源：</span>
          <input class="form-control" id="country" type="text" placeHolder="请输入来源：">
     </div>
     <div class="form-group">
          <span>图书数目：</span>
          <input class="form-control" id="bookNumber" type="text" placeHolder="请输入图书数目：">
     </div>
     <div class="form-group">
          <span>描述：</span>
          <textarea class="form-control" id="description" placeHolder="请输入具体描述："></textarea>
     </div>    
  </div>
  
  <div class="bookUrl">
      选择图书图片(图片格式jpg、png)：
      <img class="img0" alt="" src="resource/images/pickphoto.JPG">
      <input type="file" name="file" id="myfile" accept="image/*" style="display: none;">
  </div>
  
  <div class="fileWaring">
  
  </div>
  
  <div class="btn-bar">
      <div class="btn btn-info" id="filepick">选择图片</div>
      <div style="margin-left: 10%;" class="btn btn-primary" id="submit_book">提交</div>
  </div>
  
  <!-- 书籍新增成功后的提示框 -->
  <c:import url="../books/orderModal.jsp"></c:import>
  
  <!-- 引入文件上传js -->
  <script type="text/javascript" src="assets/ajax/ajaxfileupload.js"></script>
  <script type="text/javascript">
     $(function(){
    	 $("#orderSuccessFour").addClass('active');
    	 
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
         
	     $('#submit_book').on('click',function(){
	    	var name = $('#name').val();
	    	var bookId = $('#bookId').val();
	    	var writer = $('#writer').val();
	    	var style = $('#style').val();
	    	var country = $('#country').val();
	    	var bookNumber = $('#bookNumber').val();
	    	var description = $('#description').val();  	
	    		    	
	    	if(name == "" || bookId == "" || writer == "" || style == "" || country == ""
	    			|| bookNumber == "" || description == ""){
	    		$('.fileWaring').html('<font color=red>请填写要添加的图书的信息</font>');
				return false;
	    	}else{
	    		//获取上传的文件名
			    var pictureName = $('#myfile').val();
				//console.log(pictureName);
				//获取文件后缀
				var suffixName = pictureName.substr(pictureName.indexOf("."));
				//console.log(suffixName);
				if(suffixName == ".jpg" || suffixName == ".png"){
					$.ajaxFileUpload({
		 				url: 'bookadmin/uploadImage',
		 				type: 'POST',
		 				secureuri: false,
		 				fileElementId: 'myfile',
		 				dataType: 'json',
		 				success: function(data){				
		 					if(data.flag == "success"){
		 						alert("artg");
		 						var url = data.url;
		 						if(url == null){
		 							$('#return_update').click();
 				  		    		$('#info').text("该图书新增失败！");
 				  					$('#orderWaringModalBody').css({
 				  						  "height": "100px"
 				  					});
 				  					$('#info').css({
 				  						 "color": "#000000",
 				  						 "text-align": "center",
 				  						 "font-size": "40px"
 				  					});
 				  				    $('#orderWaring').modal({backdrop: 'static', keyboard: false});
		 							return false;
		 						}else{
		 							var data = {
			 								name: name,
			 								bookId: bookId,
			 								writer: writer,
			 								style: style,
			 								country: country,
			 								bookNumber: bookNumber,
			 								description: description,
			 								url: url
			 						};
			 						data = JSON.stringify(data);
			 						alert(data);
			 						$.ajax({
			 						   type: "POST",
			 						   contentType: "application/json",//必须有
			 			               dataType: "json",//返回值，不必须
			 						   url: "bookadmin/save",
			 						   data: data,
			 						   success: function(msg){
			 							   if(msg){
			 								    $('#return_update').click();
			 				  		    		$('#info').text("该图书新增成功！");
			 				  					$('#orderWaringModalBody').css({
			 				  						  "height": "100px"
			 				  					});
			 				  					$('#info').css({
			 				  						 "color": "#000000",
			 				  						 "text-align": "center",
			 				  						 "font-size": "40px"
			 				  					});
			 				  				    $('#orderWaring').modal({backdrop: 'static', keyboard: false});
			 							   }
			 						   }
			 						});
		 						}
		 							 						
		 					}else {
		 						var warning = '<font color=red>'+data.flag+'</font>';
		 						$('.fileWaring').html(warning);				
		 					}
		 				}
		 			});						
				}else{
					$('.fileWaring').html('<font color=red>请选择正确的图片格式，支持的格式有jpg、png</font>');
					return false;
				};
	    	}    	
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
		
		 //关闭提醒框之后 前端刷新页面
	     $('.close').on('click',function(){
	    	 window.location.assign('add');
	     });
     });   
  </script>
</body>
</html>