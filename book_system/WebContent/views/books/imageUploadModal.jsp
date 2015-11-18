<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 模态框（Modal） -->
<div class="modal fade" id="bookUrlModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">
                   修改图书的图片(请选择图片格式为jpg、png)
                </h4>
            </div>
            
            <div class="modal-body">                                
              <div class="form-group">  
                     <div style="margin-left: 40%;" class="btn btn-primary" id="filepick">选择图片</div>
                     <!-- 通过该span标签来清空文件的value -->
                     <span id="fileSpan">
                        <input type="file" name="file" id="myfile" accept="image/*" style="display: none;">
                     </span>
                     <br>
                     <br>
                     <span class="fileWaring"></span>             
                     <img style="width: 100%;height: 70%" src="" class="img0">                                                    
              </div>
            </div>
              
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="return_button"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="submit_button">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>