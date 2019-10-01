<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>用户注册</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style>
        .form-control{
            width: 300px;
            position: absolute;
        }
        .error{
            position: absolute;
            top: 5px;
            left: 320px;
            color: red;
        }
    </style>
    <script>
        $(function () {
            $("#uname").blur(function () {
                var uname = $("#uname").val();
                $.ajax({
                    url: "${pageContext.request.contextPath}/ajax/userRegist",
                    type: "post",
                    data: JSON.stringify({uname:uname}),
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var s_user = $("#s_user");
                        var submit = $("#submit");
                        console.log("你好");
                        if (data == 1) {
                            s_user.html("该用户名可用");
                            s_user.css("color", "green");
                            submit.removeAttr("disabled");
                            submit.attr("disabled", false);
                        }else {
                            s_user.html("该用户名已存在！");
                            s_user.css("color", "red");
                            submit.attr("disabled", true);
                        }
                    }
                });
                if ("" != uname) {
                    $("#s_error").css("display", "none");
                }
            });
        });
    </script>
</head>
<body>
<div class="container login" style="width: 520px;">
    <h3 style="text-align: center;">用户注册</h3>
    <form:form modelAttribute="user" class="form-horizontal" action="${pageContext.request.contextPath}/user/uRegist" method="post">
        <div class="form-group" align="center">
            <label class="col-sm-2 control-label" for="uname">用户名:</label>
            <div class="col-sm-10">
                <form:input id="uname" path="uname" class="form-control" />
                <span id="s_error" class="error"><form:errors path="uname" /></span>
                <span id="s_user" style="position: absolute; top: 5px; left: 320px;"></span>
            </div>
        </div>
        <div class="form-group" align="center">
            <label class="col-sm-2 control-label" for="upassword">密码:</label>
            <div class="col-sm-10">
                <form:password id="upassword" path="upassword" class="form-control" />
                <span class="error"><form:errors path="upassword" /></span>
            </div>
        </div>
        <div class="form-group" align="center">
            <label class="col-sm-2 control-label">性别:</label>
            <div class="col-sm-10">
                <div style="height: 32px; width: 72px; position: absolute; top: 5px; left: 120px;">
                    <label>男</label>
                    <input type="radio" checked class="radio-inline" name="usex" value="男" />
                    <label>女</label>
                    <input type="radio" class="radio-inline" name="usex" value="女" />
                </div>
            </div>
        </div>
        <div class="form-group" align="center">
            <label class="col-sm-2 control-label" for="uage">年龄:</label>
            <div class="col-sm-10">
                <input type="text" id="uage" name="uage" class="form-control" />
                <%--<form:errors path="uage" />--%>
            </div>
        </div>
        <div class="form-group" align="center">
            <label class="col-sm-2 control-label" for="uaddress">籍贯:</label>
            <div class="col-sm-10">
                <form:input id="uaddress" path="uaddress" class="form-control" />
                <span class="error"><form:errors path="uaddress" /></span>
            </div>
        </div>
        <div class="form-group" align="center">
            <label class="col-sm-2 control-label" for="uqq">QQ:</label>
            <div class="col-sm-10">
                <form:input id="uqq" path="uqq" class="form-control" />
                <span class="error"><form:errors path="uqq" /></span>
            </div>
        </div>
        <div class="form-group" align="center">
            <label class="col-sm-2 control-label" for="uemail">邮箱:</label>
            <div class="col-sm-10">
                <form:input id="uemail" path="uemail" class="form-control" />
                <span class="error"><form:errors path="uemail" /></span>
            </div>
        </div>
        <div class="form-group" style="text-align: center;">
            <input id="submit" class="btn btn-primary" type="submit" value="注册">
            <p style="margin: 5px 0 0 0;">已有账户，前往<a href="${pageContext.request.contextPath}/user/login">登录</a></p>
        </div>
    </form:form>
</div>
</body>
</html>
