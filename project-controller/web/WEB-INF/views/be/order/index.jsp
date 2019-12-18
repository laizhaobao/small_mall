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
    <script type="text/javascript" src="/static/js/vue.min.js"></script>
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
                                    <a href="/message/index">留言管理</a>
                                </li>

                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="icon icon-shopping-cart"></i>订单</a>
                            <ul>
                                <li>
                                    <a href="/order/index">订单管理</a>
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
                <div class="col-md-12 column">
                    <div class="col-md-4 column">
                        <h1>
                            订单管理
                        </h1>
                    </div>
                </div>
                <div class="col-md-12 column">
                    <hr/>
                </div>
                <%--                 搜索--%>
                <div class="input-group" style="margin-bottom: 20px">
                    <div class="input-control search-box search-box-circle has-icon-left has-icon-right search-example"
                         id="searchboxExample">
                        <input id="inputSearchExample3" type="search" style="width: 200px;"
                               class="form-control search-input" placeholder="按订单号搜索">
                        <label for="inputSearchExample3" class="input-control-icon-left search-icon"
                               style="top: 8px;"><i class="icon icon-search"></i></label>
                        <span class="input-group-btn">
   				                 <button class="btn btn-primary" type="button" @click="searchName()">搜索</button>
                            </span>
                    </div>
                </div>
                <div class="col-md-12 column">
                    <table class="table table-bordered">
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
                    <ul class="pager" v-for="(nums,index) in pageInfo.navigatepageNums">
                        <li @click="page=nums"><a href="#">{{nums}}</a></li>
                    </ul>
                </div>
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
<%--vue容器作用域范围 --%>
</body>
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
        * */details:function(data){
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


    // 手动通过点击模拟高亮菜单项
    $('#treeMenu').on('click', 'a', function () {
        $('#treeMenu li.active').removeClass('active');
        $(this).closest('li').addClass('active');
    });
</script>
</html>