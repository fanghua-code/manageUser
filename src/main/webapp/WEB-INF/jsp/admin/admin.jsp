<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员信息</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        .admin{
            position: absolute;
            top: 0;
            left: 50%;
            transform: translate(-50%, 125px);
        }
    </style>
</head>
<body>
    <div class="admin">
        <div style="background: #EEEEEE; height: 155px; width: 600px;">
            <h1 align="center" style="line-height: 155px;">欢迎来到管理员页面</h1>
        </div>
        <div align="center" style="margin-top: 20px;">
            <table class="table table-bordered" style="text-align: center;">
                <tr>
                    <td>管理员</td>
                    <td>${admin.aname}</td>
                </tr>
                <tr>
                    <td>权限</td>
                    <td>全部</td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
