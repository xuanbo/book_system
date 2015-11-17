<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

  <!-- 引用head -->
  <c:import url="../template/head.jsp"></c:import>
  
  <div id="orderSuccessBar">
      <ul class="nav nav-tabs">
         <li role="presentation" id="orderSuccessOne"><a href="bookadmin/orderSuccess/list">预约成功<span class="badge" style="background-color: red">${orderSuccessNumber }</span></a></li>
         <li role="presentation" id="orderSuccessTwo"><a href="bookadmin/borrowSuccess/list">已借出<span class="badge" style="background-color: red">${orderBorrowNumber }</span></a></li>
         <li role="presentation" id="orderSuccessThree"><a href="bookadmin/returnSuccess/list">已归还</a></li>
         <li role="presentation" id="orderSuccessFour"><a href="bookadmin/add">新增图书</a></li>
      </ul>
  </div>
  
  <!-- 提示图书管理员选择处理的业务 -->
  <div class="orderWaring">
      ${orderWaring }
  </div>
   
  
  <script type="text/javascript">
    $(function(){
    	$('#three').addClass("active");
    });
  </script>
  
  