<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
</head>
<body>
<h1>${user.uname}，你好</h1>
<a href="${pageContext.request.contextPath}/user/logout?uid=${user.uid}">注销</a>
</body>
</html>
