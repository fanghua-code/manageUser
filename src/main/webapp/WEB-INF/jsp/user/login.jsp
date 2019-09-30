<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container login" style="width: 500px;">
    <h3 style="text-align: center;">用户登录</h3>
    <form class="form-horizontal" action="${pageContext.request.contextPath}/user/uLogin" method="post">
        <div class="form-group" align="center">
            <label class="col-sm-2 control-label" for="uname">用户名:</label>
            <div class="col-sm-10">
                <input type="text" id="uname" name="uname" class="form-control">
            </div>
        </div>
        <div class="form-group" align="center">
            <label class="col-sm-2 control-label" for="upassword">密码:</label>
            <div class="col-sm-10">
                <input type="password" id="upassword" name="upassword" class="form-control">
            </div>
        </div>
        <div class="form-group" style="text-align: center;">
            <input class="btn btn-primary" type="submit" value="登录">
            <span style="position: absolute; line-height: 34px; color: red;">${login_msg}</span>
            <p style="margin: 5px 0 0 0;">没有账户，前往<a href="${pageContext.request.contextPath}/user/regist">注册</a></p>
            <p><a href="${pageContext.request.contextPath}/admin/login">管理员登录</a></p>
        </div>
    </form>
</div>
</body>
</html>
