<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

   <!-- 引用adminManagement -->
   <c:import url="adminManagement.jsp"></c:import>
   
   <div class="userManage">
       <a href="admin/user/list">
          <input id="oneManage" type="button" class="btn btn-default"  value="查看借阅证">
       </a>   
       <a href="admin/user/add">
          <input id="twoManage" type="button" class="btn btn-default"  value="新增借阅证">
       </a>
       <a href="admin/user/batchAdd">
          <input id="threeManage" type="button" class="btn btn-default"  value="批量新增借阅证">
       </a>          
   </div>
   
   <script type="text/javascript">
       $(function(){
    	   $('#manageTwo').addClass('active');
    	   
       });
   </script>
