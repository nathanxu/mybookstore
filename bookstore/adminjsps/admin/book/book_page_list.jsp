<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>图书分类</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
	body {
		font-size: 10pt;
		background: rgb(254,238,189);
	}
	.icon {
		margin:10px;
		border: solid 2px gray;
		width: 160px;
		height: 190px;
		text-align: center;
		float: left;
	}
</style>
  </head>
  
  <body>
  <c:forEach items="${requestScope.pageBean.list }" var="book">
   <div class="icon">
    <a href="${pageContext.request.contextPath}/AdminBookServlet?method=descBook&bid=${book.bid}"><img src="${pageContext.request.contextPath}${book.image}" border="0"/></a>
      <br/>
   	<a href="${pageContext.request.contextPath}/AdminBookServlet?method=descBook&bid=${book.bid}">${book.bname }</a>
  </div>
  
  </c:forEach>
  	 	<div style="position:absolute;left:400px;top:450px;">
  		<%-- 构建分页导航 --%>
            共有${requestScope.pageBean.totalRecord}本书，共${requestScope.pageBean.totalPage }页，当前为${requestScope.pageBean.pageNum}页
            <br/>
            <a href="${pageContext.request.contextPath}/AdminBookServlet?method=findAllBookWithPage&pageNum=1">首页</a>
            <%--如果当前页为第一页时，就没有上一页这个超链接显示 --%>
            <c:if test="${requestScope.pageBean.pageNum ==1}">
                <c:forEach begin="${requestScope.pageBean.start}" end="${requestScope.pageBean.end}" step="1" var="i">
                    <c:if test="${requestScope.pageBean.pageNum == i}">
                        ${i}
                    </c:if>                
                    <c:if test="${requestScope.pageBean.pageNum != i}">
                        <a href="${pageContext.request.contextPath}/AdminBookServlet?method=findAllBookWithPage&pageNum=${i}">${i}</a>                                        
                    </c:if>                        
                </c:forEach>
                <a href="${pageContext.request.contextPath}/AdminBookServlet?method=findAllBookWithPage&pageNum=${requestScope.pageBean.pageNum+1}">下一页</a>                    
            </c:if>
            
            <%--如果当前页不是第一页也不是最后一页，则有上一页和下一页这个超链接显示 --%>
            <c:if test="${requestScope.pageBean.pageNum > 1 && requestScope.pageBean.pageNum < requestScope.pageBean.totalPage}">
                <a href="${pageContext.request.contextPath}/AdminBookServlet?method=findAllBookWithPage&pageNum=${requestScope.pageBean.pageNum-1}">上一页</a>
                <c:forEach begin="${requestScope.pageBean.start}" end="${requestScope.pageBean.end}" step="1" var="i">    
                    <c:if test="${requestScope.pageBean.pageNum == i}">
                        ${i}
                    </c:if>            
                    <c:if test="${requestScope.pageBean.pageNum != i}">
                        <a href="${pageContext.request.contextPath}/AdminBookServlet?method=findAllBookWithPage&pageNum=${i}">${i}</a>                                        
                    </c:if>                        
                </c:forEach>
                <a href="${pageContext.request.contextPath}/AdminBookServlet?method=findAllBookWithPage&pageNum=${requestScope.pageBean.pageNum+1}">下一页</a>    
            </c:if>
            
            <%-- 如果当前页是最后一页，则只有上一页这个超链接显示，下一页没有 --%>
            <c:if test="${requestScope.pageBean.pageNum == requestScope.pageBean.totalPage}">
                <a href="${pageContext.request.contextPath}/AdminBookServlet?method=findAllBookWithPage&pageNum=${requestScope.pageBean.pageNum-1}">上一页</a>
                <c:forEach begin="${requestScope.pageBean.start}" end="${requestScope.pageBean.end}" step="1" var="i">
                    <c:if test="${requestScope.pageBean.pageNum == i}">
                        ${i}
                    </c:if>
                    <c:if test="${requestScope.pageBean.pageNum != i}">
                        <a href="${pageContext.request.contextPath}/BookServlet?method=findAllBookWithPage&pageNum=${i}">${i}</a>                                        
                    </c:if>                
                </c:forEach>
            </c:if>
            <%--尾页 --%>
            <a href="${pageContext.request.contextPath}/AdminBookServlet?method=findAllBookWithPage&pageNum=${requestScope.pageBean.totalPage}">尾页</a>
  </div>
  
  
  </body>
 
</html>

