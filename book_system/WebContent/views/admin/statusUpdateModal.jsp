<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 模态框（Modal） -->
<div class="modal fade" id="statusUpdateModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
     <div class="modal-content">
             <div class="modal-header">
                 <h4 class="modal-title" id="myModalLabel">修改借阅身份</h4>
             </div>
      
      <div id="modalBody" class="modal-body">
        <div class="form-group">
          <label class="control-label">
             借阅身份：
          </label>   
          <input id="name" type="text" class="form-control" placeholder="请输入新的借阅身份">
        </div>
        
        <div class="form-group">
          <label class="control-label">
              借书时间(天)：
          </label>   
          <input id="borrowBookTime" type="text" class="form-control" placeholder="请输入新的借书时间">
        </div>
          
        <div class="form-group">
          <label class="control-label">
              借阅书籍数目：
          </label>   
          <input id="borrowNumber" type="text" class="form-control" placeholder="请输入新的数目">
        </div>
          
       <div class="form-group">
          <label class="control-label">
              预约书籍数目：
          </label>   
          <input id="orderNumber" type="text" class="form-control" placeholder="请输入新的数目">
        </div>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="return_update">取消</button>
        <button type="button" class="btn btn-primary" id="sbmit_update">保存</button>
      </div>
    
    </div>
  </div>
</div>