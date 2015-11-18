<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>

<!-- 把该页面作为head，在其他页面中使用时，下面的资源加载不需要写在该页面，写在引用的jsp页面中 -->
<!-- 

      <link rel="stylesheet" type="text/css" href="assets/bootstrap/css/bootstrap.min.css">
      <script type="text/javascript" src="assets/jquery/jquery.min.js"></script>
      <script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>     
 -->
 <link rel="stylesheet" type="text/css" href="assets/my/head.css">
 <!-- 遮罩层和载入动画的样式 -->
 <link rel="stylesheet" type="text/css" href="assets/my/book/loading.css">

        <div id="load">
			
		</div>
		 
<!-- 导航栏 --> 
<div id="head" data-role="${Role }">
 <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
 
      
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li id="one" ><a href="home">首页</a> </li>
        
        <!--  
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">二手交易 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
        -->
        
        <li id="two"><a href="common/book/list?currentPage=1">图书</a></li>
        
        <li id="three"><a href="bookadmin/index">图书管理员</a></li>
        
        <li id="four"><a href="admin/index">系统管理员</a></li>

      </ul>
      <!-- 屏蔽了搜索框 -->
   <!--  
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
   -->    
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">联系我们</a></li>
        <li><a href="#">帮助</a></li>
        <li><a href="#">后台管理</a></li>        
        <li class="dropdown">
          
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
              
              <!-- 下拉标志符号，即向下的角标 -->
              <!-- <span class="caret"></span> -->
                 
              <span class="glyphicon glyphicon-user" aria-hidden="true"></span>个人中心           
                 <!-- 提醒用户 -->
              <!-- <span class="badge">3</span> -->
                                    
          </a>
        
          <ul class="dropdown-menu">
            <li style="text-align: center">
              <a>您好， <span id="role">${SPRING_SECURITY_CONTEXT.getAuthentication().getName() }</span></a>
            </li>
            <li id="myOrder">
               <a href="#" style="text-align: center">我的预约</a>                    
            </li>
            <li id="myBorrow">
               <a href="#" style="text-align: center">我的借阅</a>                    
            </li>     
            <li role="separator" class="divider"></li>
            <li id="logout" style="text-align: center"><a href="j_spring_security_logout">退出</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</div>


<script type="text/javascript">
$(function(){
	
	$(window).load(function(){
	    //载入完成后清空动画和遮罩层
		
		$('#load').empty();
	});
	
	
	$(function(){
		   //图书管理员和系统管理员没有 我的预约 和 我的借阅 信息
		   var role = $('#head').data("role");
		   if(role == "bookadmin" || role == "admin"){
			   $('#myOrder').empty();
			   $('#myBorrow').empty(); 
		   }
		   
		   var sessionUsername = $('#role').html().trim();
		   if(sessionUsername == ''){
			   $('#role').text("游客");		   
		   };
		   
		   
		   //实现了遮罩层和载入等待动画
		   $('#load').html(' <div class="mask"></div><div class="loading"><div class="one"></div><div class="two"></div><div class="three"></div><div class="four"></div><div class="five"></div></div>');
		   
		   $('.mask').css({
				"width": getWidth(),
				"heigth": getHeight(),
				"z-index": "888"
			});	
			
			function getWidth(){
				return $(document).width();
			};
			function getHeight(){
				return $(document).height();
			};
	   });
})(JQuery);
   
</script>