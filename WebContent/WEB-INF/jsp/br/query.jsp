<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>

</head>


<body>

	<div class="place">
    <span>丨首页>租借管理></span>
    <ul class="placeul">
    <li><a href="#">租借信息查询</a></li>
    </ul>
    </div>
    
    <div class="enterli">
    	 <table class="tablelist">
    	<thead>
    	<tr>
        <th>班级</th>
        <th>姓名</th>
        <th>借用器材</th>
        <th>一级类别</th>
        <th>二级类别</th>
        <th>数量</th>
        <th>借出日期</th>
        <th>归还日期</th>
        <th>经手人</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
         <c:forEach items="${all}" var="e">
					<tr>
						<td>${e.cid }</td>
						<td>${e.name }</td>
						<c:forEach items="${eqs }" var="e1">
							<c:if test="${e1.id eq e.eqid }">
						<td>${e1.name }</td>
								<c:forEach items="${types }" var="t">
									<c:if test="${t.id eq e1.type1 }">
						<td>${t.name}</td>
									</c:if>
									<c:if test="${t.id eq e1.type2 }">
						<td>${t.name}</td>
									</c:if>
								</c:forEach>
							</c:if>
						</c:forEach>
						<td>${e.num }</td>
						<td>${e.outdate }</td>
						<td>${e.backdate}</td>
						<td>${e.person }</td>
						<td>
						<c:if test="${empty e.backdate }">
						<a href="back/${e.id }.html" class="tablelink">归还</a> </c:if></td>
					</tr>
				</c:forEach>
        </tbody>
    </table>
    
    </div>
    
   
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
    
    
   
</body>

</html>
