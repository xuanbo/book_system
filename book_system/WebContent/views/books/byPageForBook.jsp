<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
 
<!-- 分页的div按钮区 -->
<div class="nar_page">
   第${page.getCurrentPage() }页/共${page.getTotalPageCount() }页
   <a class="btn btn-default" id="btn_first" href="common/book/list?currentPage=1">首页</a>
   
   <c:choose>
      <c:when test="${page.getCurrentPage() + 3 < page.getTotalPageCount()}">
          <a href="common/book/list?currentPage=${page.getCurrentPage() + 1}">${page.getCurrentPage() + 1 }</a>
      </c:when>
      <c:when test="${page.getCurrentPage() + 3 >= page.getTotalPageCount()}">
          <a href="common/book/list?currentPage=${page.getTotalPageCount() - 2}">${page.getTotalPageCount() - 2}</a>
      </c:when>
   </c:choose>  
   <c:choose>
      <c:when test="${page.getCurrentPage() + 2 < page.getTotalPageCount()}">
          <a href="common/book/list?currentPage=${page.getCurrentPage() + 2}">${page.getCurrentPage() + 2 }</a>
      </c:when>
      <c:when test="${page.getCurrentPage() + 2 >= page.getTotalPageCount()}">
          <a href="common/book/list?currentPage=${page.getTotalPageCount() - 1}">${page.getTotalPageCount() - 1}</a>
      </c:when>
   </c:choose>  

   <c:choose>
      <c:when test="${page.getCurrentPage() - 1 > 0 }">
         <a class="btn btn-default" id="btn_prev1" href="common/book/list?currentPage=${page.getCurrentPage() -1 }">上一页</a>
      </c:when>
      <c:when test="${page.getCurrentPage() - 1 <= 0 }">
         <a class="btn btn-default" id="btn_prev2" href="common/book/list?currentPage=1">上一页</a>
      </c:when>
   </c:choose>
   
   <c:choose>
      <c:when test="${page.getTotalPageCount() == 0 }">
         <a class="btn btn-default" id="btn_next1" href="common/book/list?currentPage=${page.getCurrentPage() }">下一页</a>    
      </c:when>
      <c:when test="${page.getCurrentPage() + 1 < page.getTotalPageCount() }">
         <a class="btn btn-default" id="btn_next2" href="common/book/list?currentPage=${page.getCurrentPage() +1}">下一页</a>    
      </c:when>
      <c:when test="${page.getCurrentPage() + 1 >= page.getTotalPageCount() }">
         <a class="btn btn-default" id="btn_next3" href="common/book/list?currentPage=${page.getTotalPageCount() }">下一页</a>    
      </c:when>
   </c:choose>
   
   <c:choose>
      <c:when test="${page.getTotalPageCount() == 0 }">
         <a class="btn btn-primary" href="common/book/list?currentPage=${page.getCurrentPage() }">尾页</a> 
      </c:when>
      <c:otherwise>
         <a class="btn btn-primary" href="common/book/list?currentPage=${page.getTotalPageCount() }">尾页</a> 
      </c:otherwise>
   </c:choose>
</div> 