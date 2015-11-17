<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 模态框（Modal） -->
<div class="modal fade" id="bookadminUpdateModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
     <div class="modal-content">
             <div class="modal-header">
                 <h4 class="modal-title" id="myModalLabel">修改图书管理员信息</h4>
             </div>
      
      <div id="modalBody" class="modal-body">
        <div class="form-group">
          <span>
             账号：
          </span>   
          <input id="name" type="text" class="form-control" placeholder="请输入新的账号：">
        </div>
        
        <div class="form-group">
          <span>
             密码：
          </span>   
          <input id="password" type="text" class="form-control" placeholder="请输入新的密码：">
        </div>
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="return_update">取消</button>
        <button type="button" class="btn btn-primary" id="sbmit_update">保存</button>
      </div>
    
    </div>
  </div>
</div>