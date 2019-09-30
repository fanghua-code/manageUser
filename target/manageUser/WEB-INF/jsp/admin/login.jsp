<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container login" style="width: 500px;">
    <h3 style="text-align: center;">管理员登录</h3>
    <form class="form-horizontal" action="${pageContext.request.contextPath}/admin/adLogin" method="post">
        <div class="form-group" align="center">
            <label class="col-sm-2 control-label" for="aname">用户名:</label>
            <div class="col-sm-10">
                <input type="text" id="aname" name="aname" class="form-control">
            </div>
        </div>
        <div class="form-group" align="center">
            <label class="col-sm-2 control-label" for="apassword">密码:</label>
            <div class="col-sm-10">
                <input type="password" id="apassword" name="apassword" class="form-control">
            </div>
        </div>
        <div class="form-group" style="text-align: center;">
            <input class="btn btn-primary" type="submit" value="登录">
            <span style="position: absolute; line-height: 34px; color: red;">${login_msg}</span>
        </div>
        <a style="position: relative; left: 220px;" href="${pageContext.request.contextPath}/user/login">返回</a>
    </form>
</div>
</body>
</html>
