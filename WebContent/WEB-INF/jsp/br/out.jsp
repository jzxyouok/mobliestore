<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
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
    <li><a href="#">器材借出</a></li>
    </ul>
    </div>
    
     <div class="enter">
     <form action="eqout.html" method="post">
    	<table>
        <!-- <tr>
        <td align="right"  class="enter_left" width="150">借出日期：</td>
        <td align="left" colspan="3">2015-01-01</td>
        </tr> -->
        <tr><td align="right" class="enter_left">班级：</td><td align="left" colspan="3"><input name="cid" value="${stu.cid }" type="text"/>如果是教师借用本项填写“0000”</td></tr>
        <tr><td align="right" class="enter_left">姓名：</td><td align="left" colspan="3"><input name="name" value="${stu.name }"  type="text"/></td></tr>
        <tr><td align="right" class="enter_left">器材用途：</td>
        <td align="left" colspan="3"><textarea name="use"  cols="40" rows="3">${stu.use }</textarea>
        </td></tr>           
            <tr><td align="right"  class="enter_left">物品选择：</td>
            <td align="left" width="150">
             <select name="type1" id="type1" onchange="creatType2()" class="select">
         	<option   selected="selected">----一级类别----</option>
<c:forEach items="${typelist }" var="l"><c:if test="${l.fid eq 0 }">     	
         	<option value="${l.id }"> ${l.name }</option>
        	</c:if></c:forEach>
        	</select></td>
            <td align="left" width="150">
            <select  onchange="creatEqlist()"  class="select" name="type2" id="type2">
         	<option  selected="selected" >----二级类别----</option>
        	</select></td>
            <td align="left">
            <select  name="eqid" id="eqlist" class="select">
         	<option value="0"  selected="selected">----物品名称----</option>
        	</select></td>
            </tr>
        	<tr>
        	<td align="right" class="enter_left">经手人：</td>
        	<td align="left" colspan="3"><input value="${user.n }" name="person" type="text"/></td></tr>
        	<tr>
        	<td align="right" class="enter_left">数量：</td>
        	<td align="left" colspan="3"><input  name="num" type="text"/></td></tr>
        	<tr style="height:60px; line-height:60px;"><td align="right" class="enter_left"><button type="submit" value="Submit">提交</button></td>
        	<td style="padding-left:20px;" colspan="3"><button type="reset" value="Reset">重置</button></td></tr>
        </table>
        </form>
    </div>
    
   
    <script type="text/javascript">
    function creatType2(){
    	var type1 = $('#type1').val();
    	$.ajax({
    		url:'../gettype2.html',
    		type:'post',
    		dateType:'json',
    		data:{fid:type1},
    		success:function(type2){
    	    	 var html="";
   			  for (var i = 0; i < type2.length; i++) {
   				var type = type2[i];
   				var type2id= type.id;
   				var name2= type.name;
   				html += "<option value="+type2id+">"
   				+ name2 + "</option>";
   			}
   			  $("#type2").html("");
   			  $("#type2").append(html);
       },
       error: function(data){
    	   alert("error"+data.toString());
       }
    	});
    }
    
    function creatEqlist(){
    	var type2 = $('#type2').val();
    	$.ajax({
    		url:'../geteqs.html',
    		type:'post',
    		dateType:'json',
    		data:{id:type2},
    		success:function(eqs){
    	    	 var html="";
   			  for (var i = 0; i <eqs.length; i++) {
   				var type = eqs[i];
   				var type2id= type.id;
   				var name2= type.name;
   				html += "<option value="+type2id+">"
   				+ name2 + "</option>";
   			}
   			  $("#eqlist").html("");
   			  $("#eqlist").append(html);
       },
       error: function(data){
    	   alert("error"+data.toString());
       }
    	});
    }
   
    </script> 
   
</body>

</html>
