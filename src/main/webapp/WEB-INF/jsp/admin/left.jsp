<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body,ul{
            margin: 0;
            padding: 0;
        }
        .left ul{
            height: 1000px;
            list-style: none;
        }
        .left li{
            height: 36px;
            width: 100%;
            border-bottom: 1px solid #E1E1E1;
            text-align: center;
            line-height: 36px;
        }
        .left a{
            text-decoration: none;
            color: #000;
        }
    </style>
</head>
<body>
    <div class="left">
        <ul>
            <li><a href="${pageContext.request.contextPath}/admin/admin" target="main">管理员信息</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/allUser" target="main">用户信息</a></li>
        </ul>
    </div>
</body>
</html>
