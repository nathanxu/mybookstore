<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <script type="text/javascript">
  		function sendData(obj){
  			
  			//alert("success");
  			var inputVal = obj.value;
  			//1、创建核心类,兼容浏览器
  			var xmlHttp = null;
  			if(window.XMLHttpRequest){
  				xmlHttp = new XMLHttpRequest();
  			}else if(window.ActiveXObject){	
  				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
  			}
  			
  			//2、设置回调函数，接收Servlet返回回来的信息
  			xmlHttp.onreadystatechange = function(){
  				if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
  					var data = xmlHttp.responseText;
  					
  					var jsonData = eval("("+data+")");
  					
  					var buttonObj = document.getElementById("buttonId");
  					var spanObj = document.getElementById("spanId");
  					
  					if(jsonData.flag){
  						buttonObj.removeAttribute("disabled");
  						spanObj.style.color = "#3D882D";
  					}else{
  						buttonObj.setAttribute("disabled","disabled");
  						spanObj.style.color = "#CC0000";
  					}
  					
  					spanObj.innerHTML = jsonData.msg;
  				}
  			}
  			
  			//3、连接Servlet
  			xmlHttp.open("POST","/MyBookStore/UserServlet?method=isReName");
  			
  			//4、设置编码，因为是post提交
  			xmlHttp.setRequestHeader("content-type","application/x-www-form-urlencoded");
  			
  			//5、发送
  			xmlHttp.send("username="+inputVal);
  		}
  </script>
  
  <body>
  <h1>注册</h1>
<p style="color: red; font-weight: 900">${msg }</p>
<form action="${pageContext.request.contextPath}/UserServlet?method=addUser" method="post">
	<input type="hidden" name="method" value="regist"/>
	用户名：<input type="text" name="username" value="" onblur="sendData(this)"/><span id="spanId"></span><br/>
	密　码：<input type="password" name="password"/><br/>
	邮　箱：<input type="text" name="email" value=""/><br/>
	<input type="submit" value="注册" id="buttonId" disabled="disabled"/>
</form>
  </body>
</html>
