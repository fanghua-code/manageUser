<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理</title>
</head>

<frameset rows="75, *" cols="*" frameborder="no">
    <frame src="${pageContext.request.contextPath}/admin/top" name="title" scrolling="no" noresize="noresize">
    <frameset cols="275, *" frameborder="no">
        <frame src="${pageContext.request.contextPath}/admin/left" name="tree" scrolling="auto"  noresize="noresize">
        <frame src="${pageContext.request.contextPath}/admin/admin" name="main" scrolling="yes"  noresize="noresize">
    </frameset>
</frameset>

<body>
<%--
    <h1 align="center">${admin.aname}，欢迎来到管理员界面</h1>
    <div align="center">
        <a href="${pageContext.request.contextPath}/admin/allUser">查询所有用户信息</a>
    </div>
--%>
</body>
</html>
