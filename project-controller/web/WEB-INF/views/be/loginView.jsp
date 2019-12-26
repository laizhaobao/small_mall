<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>后台管理</title>
    <!-- zui css -->
    <link rel="stylesheet" href="/static/zui-ui/dist/css/zui.min.css">
    <link rel="stylesheet" href="/static/zui-ui/dist/theme/blue.css">
    <!-- app css -->
    <link rel="stylesheet" href="/static/zui-ui/css/app.css">
    <!-- jquery js -->
    <script src="/static/zui-ui/dist/lib/jquery/jquery.js"></script>

</head>
<body class="bg-primary">
<div class="page page-login text-center">
    <div class="panel">
        <div class="panel-body">
            <div class="logo">
                <a href="#">后台登录</a>
            </div>
            <form action="/be/login" method="post">
                <div class="form-group">
                    <input type="text" name="username" class="form-control" placeholder="帐号">
                </div>
                <div class="form-group">
                    <input type="password" name="pwd" class="form-control" placeholder="密码">
                </div>
                <div class="form-group">
                    <div class="input-control has-icon-left has-icon-right">
                        <input type="text" id="verificationCode" name="verificationCode" style="width: 100px" placeholder="验证码">
                       <img style="top: 20px" src="/be/defaultKaptcha">
                    </div>
                </div>
                <button type="submit" class="btn btn-lg btn-primary btn-block">登录</button>
            </form>
        </div>
    </div>
    <footer class="page-copyright page-copyright-inverse">
        <p>WEBSITE BY Bob</p>
        <p>© 2019. All RIGHT RESERVED.</p>
    </footer>
</div>


<!-- zui js -->
<script src="/static/zui-ui/dist/js/zui.js"></script>
<%--<!-- app js -->--%>
<script src="/static/zui-ui/js/app.js"></script>
<script type="text/javascript">

</script>
</body>
</html>