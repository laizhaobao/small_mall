<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/12/3
  Time: 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台管理</title>
    <script type="text/javascript" src="/static/zui-ui/lib/jquery/jquery.js"></script>
    <link rel="stylesheet" href="/static/zui-ui/css/zui.min.css"/>
    <script type="text/javascript" src="/static/zui-ui/js/zui.min.js"></script>
    <script type="text/javascript" src="/static/js/vue.js"></script>
</head>
<body>
<div class="container" id="app">
    <div class="row clearfix">
        <div class="col-md-12 column" style="background-color: #F1F1F1;">
            <div class="col-md-4 column">
                <h1>
                    SAMll ADMIN
                </h1>
            </div>
            <div class="col-md-8 column">
                <h3 class="pull-right username">
                    当前用户：${username} <a href="/be/exit">退出</a>
                </h3>

            </div>
        </div>
        <div class="row clearfix" style="background-color: #FFFFFF;">
            <div class="col-md-3 column">
                <nav class="menu" data-ride="menu" style="width: 200px">
                    <ul id="treeMenu" class="tree tree-menu" data-ride="tree">
                        <li>
                            <a href="/be/index"><i class="icon icon-th"></i>首页</a>
                        </li>
                        <li>
                            <a href="#"><i class="icon icon-archive"></i>用户</a>
                            <ul>
                                <li>
                                    <a href="/user/index">用户管理</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="icon icon-archive"></i>商品</a>
                            <ul>
                                <li>
                                    <a href="/product/index">商品管理</a>
                                </li>
                                <li>
                                    <a href="/category/index">品类管理</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="icon icon-envelope-alt"></i>留言</a>
                            <ul>
                                <li>
                                    <a href="#">留言管理</a>
                                </li>

                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="icon icon-shopping-cart"></i>订单</a>
                            <ul>
                                <li>
                                    <a href="#">订单管理</a>
                                </li>

                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="icon icon-bullhorn"></i>公告</a>
                            <ul>
                                <li>
                                    <a href="#">公告管理</a>
                                </li>

                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-md-9 column">
                <%--				填写数据的地方--%>
                <h1>HOME</h1>
                <hr>
                <h3>welcome</h3>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="center-block" style="width:400px;max-width:100%;background-color:#ccc;">
                <h3>无版权</h3>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    // 手动通过点击模拟高亮菜单项
    $('#treeMenu').on('click', 'a', function () {
        $('#treeMenu li.active').removeClass('active');
        $(this).closest('li').addClass('active');
    });
</script>
</html>