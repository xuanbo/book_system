<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>     
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试页面</title>
</head>
<body>
   <p>${title }</p>
   <c:if test="${not empty user}">
      username     password<br>
      <c:forEach items="${user }" var="u">
          ${u.getName() }   ${u.getPassword() }<br>
      </c:forEach>
   </c:if>
</body>
</html>