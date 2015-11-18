<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
   
   <!-- 引用head -->
   <c:import url="../template/head.jsp"></c:import>
   
   <div id="adminManagementBar">
      <ul class="nav nav-pills nav-stacked">
         <li role="presentation" id="manageOne">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">借阅身份管理<span class="caret"></span></a>
              <ul class="dropdown-menu">
                 <li role="presentation"><a href="admin/status/list">查  看</a></li>
                 <li role="presentation"><a href="admin/status/add">添  加</a></li>
              </ul>
         </li>
         <li role="presentation" id="manageTwo"><a href="admin/user/list">借阅证管理</a></li>
         <li role="presentation" id="manageThree"><a href="admin/bookadmin/list">图书管理员</a></li>
      </ul>
  </div>
  <div class="blank">
  
  </div>
  <script type="text/javascript">
       $(function(){
	     $('#four').addClass("active");
	     
	     $('#manageOne').bind('mouseover',function(){
	    	 $(this).addClass('open');
	     });
	     $('#manageOne').bind('mouseout',function(){
	    	 $(this).removeClass('open');
	     });
	   });
   </script>