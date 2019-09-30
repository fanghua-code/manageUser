<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户信息</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script>
        $(function () {
            $("#return").click(function () {
                location.href = "${pageContext.request.contextPath}/admin/allUser";
            });
        });
        $().ready(function() {
            // 在键盘按下并释放及提交后验证提交表单
            $("#updateform").validate({
                rules: {
                    uemail: {
                        required: true,
                        email: true
                    },
                    uage: {
                        required: true
                    },
                    uaddress: {
                        required: true
                    },
                    uqq: {
                        required: true
                    }
                },
                messages: {
                    uemail: "请输入一个正确的邮箱",
                    uage: "请填写年龄",
                    uaddress: "请填写籍贯",
                    uqq: "请填写QQ"
                },
                errorPlacement: function(error, element) {
                    //将错误信息放到<label>元素之后显示
                    $( element ).closest("form" ).find( "label[for='" + element.attr( "id" ) + "']" ).append( error );
                },
                errorElement: "span"  //将错误信息置于span标签中
            });
        });
    </script>
    <style>
        .error{
            color: red;
        }
    </style>
</head>
<body>
<div class="container" style="width: 400px;">
    <h3 style="text-align: center;">修改联系人</h3>
    <form id="updateform" action="${pageContext.request.contextPath}/admin/updateUser" method="post">
        <div class="form-group">
            <label for="uname">姓名：</label>
            <input type="text" class="form-control" id="uname" name="uname"  readonly="readonly" value="${user.uname}" />
        </div>

        <div class="form-group">
            <label>性别：</label>
            <input type="radio" checked name="usex" value="男"  />男
            <input type="radio" name="usex" value="女"  />女
        </div>

        <div class="form-group">
            <label for="uage">年龄：</label>
            <input type="text" class="form-control" id="uage"  name="uage" placeholder="请输入年龄" />
        </div>

        <div class="form-group">
            <label for="uaddress">籍贯：</label>
            <input type="text" class="form-control" id="uaddress" name="uaddress" placeholder="请输入籍贯" />
        </div>

        <div class="form-group">
            <label for="uqq">QQ：</label>
            <input type="text" class="form-control" id="uqq" name="uqq" placeholder="请输入QQ号码"/>
        </div>

        <div class="form-group">
            <label for="uemail">Email：</label>
            <input type="email" class="form-control" id="uemail" name="uemail" placeholder="请输入邮箱地址"/>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交" />
            <input class="btn btn-default" type="reset" value="重置" />
            <input id="return" class="btn btn-default" type="button" value="返回"/>
        </div>
    </form>
</div>
</body>
</html>
