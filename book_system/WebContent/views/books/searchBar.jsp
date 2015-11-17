<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="searchBar">
    <!-- 书的类型 -->
    <div id="bookStyle1">
       <label for="name">图书类型：</label>
    </div>
    <div id="bookStyle2">      
     <select class="form-control">
        <option>论文</option>
        <option>杂志</option>
        <option>心理</option>
        <option>科学</option>
        <option>计算机</option>
        <option>其他</option>
     </select>
    </div>
    
    <!-- 书的国家 -->
    <div id="bookStyle1">
       <label for="name">图书中外：</label>
    </div>
    <div id="bookStyle2">      
     <select class="form-control">
        <option>中国</option>
        <option>外国</option>
     </select>
    </div>
    
    <!-- 书的名字 -->
    <div id="bookStyle1">
       <label for="name">图书名字：</label>
    </div>
    <div id="bookStyle2">      
       <input type="text" class="form-control" placeholder="输入书名：">
    </div>
    
    <div id="search" class="btn btn-primary">
        搜索
    </div>
</div>

 
  <br>
  <hr>