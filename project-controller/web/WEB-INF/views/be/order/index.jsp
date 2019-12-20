<%--
  Created by IntelliJ IDEA.
  User: fangchengfangcheng
  Date: 2019-12-02
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SMAll MAll ADMIN</title>

    <!-- zui css -->
    <link rel="stylesheet" href="/static/zui-ui/dist/css/zui.min.css">
    <link rel="stylesheet" href="/static/zui-ui/dist/theme/blue.css">
    <script type="text/javascript" src="/static/js/vue.min.js"></script>
    <!-- app css -->
    <link rel="stylesheet" href="/static/zui-ui/css/app.css">
</head>
<body>

<div class="wrapper" id="app">
    <header class="main-header">
        <nav class="navbar navbar-fixed-top bg-primary">
            <div class="navbar-header">
                <a class="navbar-toggle" href="javascript:;" data-toggle="collapse" data-target=".navbar-collapse"><i
                        class="icon icon-th-large"></i></a>
                <a class="sidebar-toggle" href="javascript:;" data-toggle="push-menu"><i class="icon icon-bars"></i></a>
                <a class="navbar-brand" href="#">
                    <span class="logo">SMAll MAll</span>
                    <span class="logo-mini">MAll</span>
                </a>
            </div>
            <div class="collapse navbar-collapse">
                <div class="container-fluid">
                    <ul class="nav navbar-nav">
                        <li><a href="javascript:;" data-toggle="push-menu"><i class="icon icon-bars"></i></a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">

                        <li class="dropdown">
                            <input type="hidden" id="userId" value="${user.uid}"/>
                            <a href="javascript:;" data-toggle="dropdown"><i class="icon icon-user"></i>${user.username}<span
                                    class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class="divider"></li>
                                <li><a href="/be/exit">注销</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <aside class="main-sidebar">
        <section class="sidebar">
            <ul id="treeMenu" class="sidebar-menu" data-widget="tree">
                <li class="header">主要菜单</li>
                <li class="treeview" id="menuTemplate">
                    <a href="javascript:;">
                        <span class="parent">模版</span>
                        <span class="pull-right-container">
                                <i class="icon icon-angle-left"></i>
                            </span>
                    </a>
                    <ul class="treeview-menu child">

                    </ul>
                </li>
            </ul>
        </section>
    </aside>
    <div class="content-wrapper">
        <div class="content-header">
            <ul class="breadcrumb">
                <li><a href="#"><i class="icon icon-home"></i></a></li>
                <li class="active">订单管理</li>
            </ul>
        </div>
        <div class="content-body">
            <div class="container-fluid">
                <div class="panel">

                    <div class="panel-body">
                        <div class="table-tools" style="margin-bottom: 15px;">
                            <div class="pull-right" style="width: 250px;">
                                <div class="input-group">
                                    <input id="inputSearchExample3" type="search" class="form-control search-input"
                                           placeholder="按订单号搜索">
                                    <span class="input-group-btn">
										<button class="btn btn-default" type="button" @click="searchName()">搜索</button>
									</span>
                                </div>
                            </div>
                            <div class="tools-group">
                                <button href="#" class="add btn btn-info" @click="page=1"><i
                                        class="icon icon-plus-sign"></i>返回首页
                                </button>
                            </div>
                        </div>
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>订单号</th>
                                <th>收件人</th>
                                <th>订单状态</th>
                                <th>订单总价</th>
                                <th>创建时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="(order,index) in pageInfo.list">
                                <td><a href="#" @click="details(order.orderNo)">{{order.orderNo}}</a></td>
                                <td>{{order.receiverName}}</td>
                                <td v-if="order.orderStatus==10">
                                    未支付
                                </td>
                                <td v-else-if="order.orderStatus==20">
                                    已支付
                                </td>
                                <td v-else-if="order.orderStatus==40">
                                    已发货
                                </td>
                                <td>￥{{order.payment}}</td>
                                <td>{{order.createTime}}</td>
                                <td>
                                    <input type="button" class="btn btn-primary" @click="details(order.orderNo)" value="查看">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <div>
                            <ul class="pager" v-for="(nums,index) in pageInfo.navigatepageNums">
                                <li @click="page=nums"><a href="#">{{nums}}</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <%--                内容区域--%>

            </div>
        </div>
    </div>
</div>
<script src="/static/js/jquery-3.3.1.min.js"></script>
<script src="/static/js/menu.js"></script>
<script src="/static/zui-ui/dist/js/zui.min.js" charset="utf-8"></script>
<script src="/static/zui-ui/js/app.js"></script>
<script type="text/javascript">
    const vm = new Vue({
        el: "#app",
        data: {
            //定义变量接收数据
            pageInfo: [],
            page: 1
        }, methods: {
            /*
        * 这里是写方法的地方
        * 方法名字:function(){
        *
        * }
        * */
            // jumpPage:function () {
            //     location.href="/order/index";
            // },
            details:function(data){
                location.href="/order/details?details="+data;
            },
            searchName: function () {
                const orderNo = $("#inputSearchExample3").val();
                $.post('/order/search', {pageNum: vm.page, orderNo: orderNo}, function (data) {
                    vm.pageInfo = data.data;
                }, "json");
            }

        },
        mounted: function () {//初始化数据 第一次会执行的方法
            $.post('/order/list', {pageNum: 1}, function (data) {
                vm.pageInfo = data.data;
            }, "json");
        },
        watch: {//监听属性 当属性发生改变执行
            page: function () {
                $.get('/order/list', {pageNum: vm.page}, function (data) {
                    vm.pageInfo = data.data;
                }, "json");
            }
        }
    });
</script>

</body>
</html>