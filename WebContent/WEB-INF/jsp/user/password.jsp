<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/Validform_v5.3.2_min.js"></script>

</head>


<body>

	<div class="place">
		<span>丨首页>用户操作>修改密码</span>
	</div>

	<div class="password">
		<form class="changepwd" action="user.html" method="post">
			<table>
				<tr>
					<td align="right" style="padding-right: 30px;">原密码：</td>
					<td align="left"><input name="old" id="old" datatype="*" errormsg="请输入旧密码"
						type="password" />
					<div class="Validform_checktip"></div></td>
				</tr>
				<tr>
					<td align="right" style="padding-right: 30px;">新密码：</td>
					<td align="left"><input name="pwd1" datatype="*" errormsg="请设置新密码！" type="password" /><div class="Validform_checktip"></div></td>
				</tr>
				<tr>
					<td align="right" style="padding-right: 30px;">密码确认：</td>
					<td align="left"><input name="pwd2" type="password"
						datatype="*" recheck="pwd1" errormsg="您两次输入的账号密码不一致！" />
					<div class="Validform_checktip">两次输入密码需一致</div></td>
				</tr>
				<tr>
					<td align="right" style="padding-right: 30px;"><button
							type="submit" value="Submit">提交</button></td>
					<td style="padding-left: 30px;"><button type="reset"
							value="Reset">重置</button></td><span id="msgdemo" style="margin-left:30px;"></span>
				</tr>
			</table>
		</form>

	</div>
	<script type="text/javascript">
$(function(){
	$(".changepwd").Validform({
		
		
		tiptype:function(msg,o,cssctl){
		//msg：提示信息;
		//o:{obj:*,type:*,curform:*}, obj指向的是当前验证的表单元素（或表单对象），type指示提示的状态，值为1、2、3、4， 1：正在检测/提交数据，2：通过验证，3：验证失败，4：提示ignore状态, curform为当前form对象;
		//cssctl:内置的提示信息样式控制函数，该函数需传入两个参数：显示提示信息的对象 和 当前提示的状态（既形参o中的type）;
		if(!o.obj.is("form")){//验证表单元素时o.obj为该表单元素，全部验证通过提交表单时o.obj为该表单对象;
			var objtip=o.obj.siblings(".Validform_checktip");
			cssctl(objtip,o.type);
			objtip.text(msg);
		}else{
			var objtip=o.obj.find("#msgdemo");
			cssctl(objtip,o.type);
			objtip.text(msg);
		}
	},
		
		
		/* tiptype:2,
		ajaxPost:true,
		datatype:{
			oldpassword:function(gets){
				if(gets==$("#old").val()){
					return "新密码不能与旧密码一致！";	
				}
			}	
		}, */
});
	
})


</script>

</body>

</html>
