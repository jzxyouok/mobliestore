<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
</head>


<body>

	<div class="place" style="float: left; width: 100%; font-size: 16px;">
		<span>丨首页>器材类别></span>
		<ul class="placeul">
			<li>新建二级类别</li>
		</ul>
	</div>

	<div class="sort01">
		<form class="type2" action="addType2.html" method="post">
			<table>
				<tr>
					<td colspan="2" style="border-bottom: #999 solid thin">添加一级类别
					</td>
				</tr>
				<tr style="border-bottom: #999 solid thin">
					<td width="50%" style="padding-right: 20px;" align="right">选择一级类别名称:</td>
					<td align="left"
						style="padding-left: 20px; border-left: #999 thin solid;"><select
						name="fid" class="select">
							<option value="----一级类别----" selected="selected">----一级类别----</option>
							<c:forEach items="${typelist }" var="l">
								<c:if test="${l.fid eq 0 }">
									<option value="${l.id }">${l.name }</option>
								</c:if>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td width="50%" style="padding-right: 20px;" align="right">添加二级类别名称:</td>
					<td align="left"
						style="padding-left: 20px; border-left: #999 thin solid;"><input
						name="type2" datatype="*" type="text" /></td>
				</tr>
				<tr>
					<td colspan="2" style="border-top: #999 solid thin">
						<button type="submit" value="Submit">提交</button>
					</td>
				</tr>
			</table>
		</form>

		<script type="text/javascript">
    $(".type2").Validform();
    </script>
	</div>
	<div class="tree well">
		<ul>
			<c:forEach items="${typelist }" var="l">
				<c:if test="${l.fid eq 0 }">
					<li><span><i class="icon-folder-open"></i> ${l.name }</span>
						<ul>
							<c:forEach items="${typelist }" var="a">
								<c:if test="${a.fid eq l.id }">
									<li><span><i class="icon-minus-sign"></i> ${a.name}</span>
									</li>
								</c:if>
							</c:forEach>
						</ul></li>
				</c:if>
			</c:forEach>
		</ul>
	</div>

	<script type="text/javascript">
$(function(){
    $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
    $('.tree li.parent_li > span').on('click', function (e) {
        var children = $(this).parent('li.parent_li').find(' > ul > li');
        if (children.is(":visible")) {
            children.hide('fast');
            $(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
        } else {
            children.show('fast');
            $(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
        }
        e.stopPropagation();
    });
});
</script>
</body>

</html>
