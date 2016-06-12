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
		<span>丨首页>仓库管理></span>
		<ul class="placeul">
			<li><a href="#">库存管理</a></li>
		</ul>
	</div>

	<div class="enterli">
		<table class="tablelist">
			<thead>
				<tr>
					<th>编号</th>
					<th>物品名称</th>
					<th>一级类别</th>
					<th>二级类别</th>
					<th>目前库存总数</th>
					<th>操作数</th>
					<th>操作时间</th>
					<th>操作内容</th>
					<th>经手人</th>
					<!-- <th>操作</th> -->
				</tr>
			</thead>
			<tbody>

					<c:forEach items="${ depots}" var="d">
				<tr>
						<td>${d.id }</td>
						<c:forEach items="${eqs }" var="e">
							<c:if test="${e.id eq d.eid }">
								<td>${e.name}</td>
								<c:forEach items="${types }" var="t">
									<c:if test="${t.id eq e.type1 }">
										<td>${t.name}</td>
									</c:if>
									<c:if test="${t.id eq e.type2 }">
										<td>${t.name}</td>
									</c:if>
								</c:forEach>
								<td>${e.nownum}</td>
								<td>${d.num}</td>
							</c:if>
						</c:forEach>
						<td>${d.intime }</td>
						<td>入库</td>
						<td>${d.person }</td>
						</tr>
					</c:forEach>
					
					<c:forEach items="${ depots2}" var="d">
				<tr>
						<td>${d.id }</td>
						<c:forEach items="${eqs }" var="e">
							<c:if test="${e.id eq d.eid }">
								<td>${e.name}</td>
								<c:forEach items="${types }" var="t">
									<c:if test="${t.id eq e.type1 }">
										<td>${t.name}</td>
									</c:if>
									<c:if test="${t.id eq e.type2 }">
										<td>${t.name}</td>
									</c:if>
								</c:forEach>
								<td>${e.nownum}</td>
									<td>${d.num}</td>
							</c:if>
						</c:forEach>
						<td>${d.intime }</td>
						<td>出库</td>
						<td>${d.person }</td>
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
