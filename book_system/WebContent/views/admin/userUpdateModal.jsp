<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- 模态框（Modal） -->
<div class="modal fade" id="userUpdateModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
     <div class="modal-content">
             <div class="modal-header">
                 <h4 class="modal-title" id="myModalLabel">修改借阅证信息</h4>
             </div>
      
      <div id="modalBody" class="modal-body">             
        <div class="form-group">
          <span>
             借阅身份：
          </span>   
          <select id="statusName" class="form-control">
              <c:if test="${not empty status }">
                  <c:forEach items="${status }" var="s">
                      <option>${s.getName() }</option>
                  </c:forEach>
              </c:if>          
          </select>
        </div>      
        
        <div class="form-group">
          <span>
             借阅证密码：
          </span>   
          <input id="password" type="text" class="form-control" placeHolder="请输入新的借阅密码：">
        </div>
        
      </div>      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="return_update">取消</button>
        <button type="button" class="btn btn-primary" id="sbmit_update">保存</button>
      </div>
    
    </div>
  </div>
</div>