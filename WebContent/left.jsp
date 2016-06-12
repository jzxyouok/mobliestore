<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery-1.9.1.min.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>系统管理</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>用户操作
    </div>
    	<ul class="menuson">
        <li><cite></cite><a href="password.html" target="rightFrame">修改密码</a><i></i></li>
        </ul>    
    </dd>
        
    
    <dd>
    <div class="title">
    <span><img src="images/leftico02.png" /></span>货物管理
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="type/type1.html" target="rightFrame">货物类别管理</a><i></i></li>
        <li><cite></cite><a href="type/type2.html" target="rightFrame">货物出入管理</a><i></i></li>
        <li><cite></cite><a href="type/type3.html" target="rightFrame">货物销售记录</a><i></i></li>
        </ul>     
    </dd> 
    
    
    <dd><div class="title"><span><img src="images/leftico03.png" /></span>人员管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="eq/out.html" target="rightFrame">会员信息列表</a><i></i></li>
        <li><cite></cite><a href="eq/out.html" target="rightFrame">员工信息列表</a><i></i></li>
    </ul>    
    </dd>  
    
    
<!--     <dd><div class="title"><span><img src="images/leftico04.png" /></span>租借管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="loan/pageout.html" target="rightFrame">器材借出</a><i></i></li>
        <li><cite></cite><a href="loan/pageback.html" target="rightFrame">器材归还</a><i></i></li>
        <li><cite></cite><a href="loan/pagequeryall.html" target="rightFrame">租借信息查询</a><i></i></li>
        <li><cite></cite><a href="loan/pagequerynotback.html" target="rightFrame">未还信息查询</a><i></i></li>
    </ul>
    
    </dd>    -->
    
    </dl>
    
</body>
</html>
