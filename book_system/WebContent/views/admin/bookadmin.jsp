<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

     <!-- 引用adminManagement -->
     <c:import url="adminManagement.jsp"></c:import>
     
     <div class="manageBookAdminBar">
        <a href="admin/bookadmin/list">
           <input class="bookadminList" type="button" value="查看">
        </a> 
        <a href="admin/bookadmin/add">
           <input class="bookadminAdd" type="button" value="新增">
        </a>        
         
            
     </div>
     
     
     <script type="text/javascript">
         $(function(){
        	 $('#manageThree').addClass('active');
         });
     </script>
