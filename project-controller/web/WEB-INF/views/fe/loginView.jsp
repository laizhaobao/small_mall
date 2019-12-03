<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/3
  Time: 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>后台管理</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <link rel="stylesheet" href="https://www.jq22.com/jquery/bootstrap-4.2.1.css">
    <link rel="stylesheet" href="/static/css/style.default.css" id="theme-stylesheet">
</head>
<body>
<div class="page login-page">
    <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
            <div class="row">
                <!-- Logo & Information Panel-->
                <div class="col-lg-6">
                    <div class="info d-flex align-items-center">
                        <div class="content">
                            <div class="logo">
                                <h1>欢迎登录</h1>
                            </div>
                            <p>后台管理系统</p>
                        </div>
                    </div>
                </div>
                <!-- Form Panel    -->
                <div class="col-lg-6 bg-white">
                    <div class="form d-flex align-items-center">
                        <div class="content">
                            <form method="post" action="/fe/login" class="form-validate" id="loginFrom">
                                <div class="form-group">
                                    <input id="login-username" type="text" name="username" required data-msg="请输入用户名" placeholder="用户名" value="admin" class="input-material">
                                </div>
                                <div class="form-group">
                                    <input id="login-password" type="password" name="pwd" required data-msg="请输入密码" placeholder="密码" class="input-material">
                                </div>
                                <button id="login" type="submit" class="btn btn-block btn-primary">登录</button>
                                <div style="margin-top: -40px;">
                                </div>
                            </form>
                            <br />

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- JavaScript files-->
<script src="https://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="https://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
<script src="/static/vendor/jquery-validation/jquery.validate.min.js"></script><!--表单验证-->
<!-- Main File-->
<script src="/static/js/front.js"></script>
</body>
</html>
