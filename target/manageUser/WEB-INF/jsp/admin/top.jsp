<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body{
            margin: 0;
            padding: 0;
        }
        .top{
            height: 75px;
            width: 100%;
            background: linear-gradient(45deg, #1c98bd, #27a5a7);
        }
        .top_msg{
            float: right;
            height: 100%;
        }
        .top_msg p{
            margin: 25px 10px 0 0;
            color: white;
        }
    </style>
</head>
<body>
    <div class="top">
        <h2 style="float: left; color: white; margin-left: 10px;">用户管理系统</h2>
        <div class="top_msg">
            <p>当前用户：${admin.aname}<a style="margin-left: 10px;" href="${pageContext.request.contextPath}/admin/exit" target="_parent">安全退出</a></p>
        </div>
    </div>
</body>
</html>
