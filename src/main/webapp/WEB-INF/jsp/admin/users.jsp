<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户信息</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>
    <script>
        $(function () {
            $("#checkAll").click(function () {
                var cbs = document.getElementsByName("uid");
                for (var i = 0; i < cbs.length; i++) {
                    cbs[i].checked = this.checked;
                }
            });
        });
        function delselected() {
            var flag = false;
            if (confirm("您确定要提交删除选中用户信息？")) {
                var cbs = document.getElementsByName("uid");
                for (var i = 0; i < cbs.length; i++) {
                    if (cbs[i].checked) {
                        flag = true;
                    }
                }
                if (flag){
                    $("#uform").submit();
                }
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h3 style="text-align: center">用户信息列表</h3>
    <div style="float: left; margin: 5px; height: 34px;">
        <form class="form-inline" action="${pageContext.request.contextPath}/admin/allUser">
            <div class="form-group">
                <label for="uname">姓名</label>
                <input type="text" class="form-control" name="uname" id="uname">
            </div>
            <div class="form-group">
                <label for="uaddress">籍贯</label>
                <input type="text" class="form-control" name="uaddress" id="uaddress">
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>
    </div>
    <div style="float: right; margin: 5px;">
        <a class="btn btn-primary" href="javascript:delselected()">删除选中</a>
    </div>
    <form style="height: 319px;" id="uform" action="${pageContext.request.contextPath}/admin/delselected" method="post">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th><input id="checkAll" type="checkbox"></th>
                <th>编号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>籍贯</th>
                <th>QQ</th>
                <th>邮箱</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${allUser.list}" var="user" varStatus="i">
                <tr>
                    <td><input type="checkbox" name="uid" value="${user.uid}"></td>
                    <td>${i.count}</td>
                    <td>${user.uname}</td>
                    <td>${user.usex}</td>
                    <td>${user.uage}</td>
                    <td>${user.uaddress}</td>
                    <td>${user.uqq}</td>
                    <td>${user.uemail}</td>
                    <td>
                        <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/admin/update?uid=${user.uid}">修改</a>&nbsp;
                        <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/admin/deleteUser?uid=${user.uid}">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>
    <div align="center">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${allUser.pageNum > 1}">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/allUser?page=${allUser.pageNum-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach begin="${allUser.pageNum}" end="${allUser.isLastPage ? allUser.pages : allUser.pageNum + 1}" var="i">
                    <c:if test="${allUser.pageNum == i}">
                        <li class="active"> <a href="${pageContext.request.contextPath}/admin/allUser?page=${i}">${i}</a></li>
                    </c:if>
                    <c:if test="${allUser.pageNum != i}">
                        <li> <a href="${pageContext.request.contextPath}/admin/allUser?page=${i}">${i}</a></li>
                    </c:if>
                </c:forEach>
                <c:if test="${allUser.pageNum < allUser.pages}">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/allUser?page=${allUser.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
    <table border="1" class="table table-bordered table-hover">
        <tr><td>在线用户</td></tr>
        <c:forEach items="${onlines}" var="user">
            <tr><td>${user.uname}</td></tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
