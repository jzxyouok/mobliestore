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
<script type="text/javascript" src="../js/Validform_v5.3.2_min.js"></script>
</head>


<body>

	<div class="place">
    <span>丨首页>器材类别></span>
    <ul class="placeul">
    <li><a href="#">器材种类管理</a></li>
    </ul>
    </div>
    
     <div class="enter">
     <form action="addTypeli.html" method="post">
    	<table>
      <!--   <tr>
        <td align="right"  class="enter_left" width="150">
        编号：</td>
        <td align="left" colspan="2">23123123213</td>
        </tr> -->
            <tr><td align="right"  class="enter_left">器材类别：</td>
            <td align="left" width="150">
            <select onchange="creatType2();" name="type1" class="select" id="type1">
         	<option  value="0"  selected="selected">----一级类别----</option>
         	<c:forEach items="${typelist }" var="l"><c:if test="${l.fid eq 0 }">     	
         	<option value="${l.id }"> ${l.name }</option>
        	</c:if></c:forEach>
        	</select></td>
            <td align="left" >
            <select name="type2" class="select" id="type2">
         	<option value="----二级类别----"  selected="selected">----二级类别----</option>
        	</select></td>
            </tr>
            <tr >
        <td align="right" style="padding-right:30px;">是否耗材：</td>
        <td align="left" style="padding-left:20px;">
            <label height="15">
              <input type="radio" name="ishaocai" value="1" id="RadioGroup1_0" height="15" />
              是</label>&nbsp;
            <label>
              <input type="radio" name="ishaocai" value="0" id="RadioGroup1_1" />
              否</label>
        </td></tr>
        	<tr><td align="right" class="enter_left">器材名称：</td><td align="left" colspan="2"><input name="name" type="text"/></td></tr>
            <tr><td align="right" class="enter_left">位置：</td><td align="left" colspan="2"><input name="position" type="text"/></td></tr>
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
    
   
    </script> 
    
    
   
</body>

</html>
