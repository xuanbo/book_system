<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 模态框（Modal） -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
     <div class="modal-content">
             <div class="modal-header">
                 <h4 class="modal-title" id="myModalLabel">更新书籍</h4>
             </div>
      
      <div id="modalBody" class="modal-body">
        <div class="form-group">
          <label class="control-label">
             书名：
          </label>   
          <input id="name" type="text" class="form-control" placeholder="请输入新的书名">
        </div>
        
        <div class="form-group">
          <label class="control-label">
              编号：
          </label>   
          <input id="bookId" type="text" class="form-control" placeholder="请输入新的编号">
        </div>
          
        <div class="form-group">
          <label class="control-label">
              作者：
          </label>   
          <input id="writer" type="text" class="form-control" placeholder="请输入新的作者">
        </div>
          
       <div class="form-group">
          <label class="control-label">
              图书类型：
          </label>   
          <input id="style" type="text" class="form-control" placeholder="请输入新的图书类型">
        </div>
        
        <div class="form-group">
          <label class="control-label">
              图书来源：
          </label>   
          <input id="country" type="text" class="form-control" placeholder="请输入新的剩余预约数目">
        </div>
          
        <div class="form-group">
          <label class="control-label">
              描述：
          </label>   
          <textarea id="description" class="form-control" placeholder="请输入新的描述"></textarea>
        </div>
          
        <div class="form-group">
          <label class="control-label">
              剩余预约数目：
          </label>   
          <input id="restNumber" type="text" class="form-control" placeholder="请输入新的剩余预约数目">
        </div>

        <div class="form-group">
          <label class="control-label">
              剩余书籍数目：
          </label>   
          <input id="bookNumber" type="text" class="form-control" placeholder="请输入新的剩余书籍数目">
        </div>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="return_update">取消</button>
        <button type="button" class="btn btn-primary" id="sbmit_update">保存</button>
      </div>
    
    </div>
  </div>
</div>