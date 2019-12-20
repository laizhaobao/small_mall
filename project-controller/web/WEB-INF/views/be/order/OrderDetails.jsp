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
                <li class="active">订单详情</li><input id="orderNo" type="hidden" value="${details}">
            </ul>
        </div>
        <div class="content-body">
            <div class="container-fluid">
                <div class="panel">
                    <div class="panel-heading">
                        <div class="tools-group">
                            <button href="#" class="add btn btn-info" @click="jumpPage()"><i
                                    class="icon icon-plus-sign"></i>返回首页
                            </button>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-12 column">
                            <form class="form-horizontal ">
                                <div class="form-group">
                                    <label class="col-sm-2">订单号:</label>
                                    <div class="col-md-6 col-sm-10">
                                        <p class="form-control-static">{{OrderInfo.orderNo}}</p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2">创建时间:</label>
                                    <div class="col-md-6 col-sm-10">
                                        <p class="form-control-static">{{OrderInfo.createTime}}</p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2">收件人:</label>
                                    <div class="col-md-6 col-sm-10">
                                        <p v-if="OrderInfo.receiverProvince!=null" class="form-control-static">
                                            {{OrderInfo.receiverName}}
                                            {{OrderInfo.receiverProvince}}
                                            {{OrderInfo.receiverCity}}
                                            {{OrderInfo.receiverDistrict}}
                                        </p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2">订单状态:</label>
                                    <div class="col-md-6 col-sm-10">
                                        <p v-if="OrderInfo.orderStatus==0" class="form-control-static">
                                            已取消
                                        </p>
                                        <p v-else-if="OrderInfo.orderStatus==10" class="form-control-static">
                                            未支付
                                        </p>
                                        <p v-else-if="OrderInfo.orderStatus==20" class="form-control-static">
                                            已支付 <input type="button" class="btn btn-success" @click="deliverGoods()" value="立即发货">
                                        </p>
                                        <p v-else-if="OrderInfo.orderStatus==40" class="form-control-static">
                                            已发货
                                        </p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2">支付方式:</label>
                                    <div class="col-md-6 col-sm-10">
                                        <p v-if="OrderInfo.paymentType==1" class="form-control-static">
                                            在线支付
                                        </p>
                                        <p v-else class="form-control-static">
                                            未支付
                                        </p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2">订单金额:</label>
                                    <div class="col-md-6 col-sm-10">
                                        <p class="form-control-static">
                                            ￥{{OrderInfo.payment}}
                                        </p>
                                    </div>
                                </div>
                            </form>
                            <div class="table-responsive">
                                <table class="table">
                                    <tr>
                                        <th>商品图片</th>
                                        <th>商品信息</th>
                                        <th>单价</th>
                                        <th>数量</th>
                                        <th>合计</th>
                                    </tr>
                                    <tr v-for="(item,index) in OrderItem">
                                        <td><img style="width: 80px;height: 80px" :src="item.imageUrl"></td>
                                        <td>{{item.productName}}</td>
                                        <td>￥{{item.currentUnitPrice}}</td>
                                        <td>{{item.quantity}}</td>
                                        <td>￥{{item.totalPrice}}</td>
                                    </tr>
                                </table>
                            </div>

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
            OrderInfo: [],
            OrderItem:[]
        }, methods: {
            /*
        * 这里是写方法的地方
        * 方法名字:function(){
        *
        * }
        * */
             jumpPage:function () {
                 location.href="/order/index";
             },
            deliverGoods:function(){
                $.post('/order/updateStatus', {"orderNo": $("#orderNo").val()}, function (data) {
                    if(data.code=="200"){
                        alert(data.message);
                        window.location.reload();
                    } else {
                        alert(data.message);
                    }
                }, "json");
            }
        },
        mounted: function () {//初始化数据 第一次会执行的方法
            $.post('/order/getByOrderNo', {"orderNo": $("#orderNo").val()}, function (data) {
                vm.OrderInfo = data.data;
            }, "json");
            $.post('/order/getOrderItem', {"orderNo": $("#orderNo").val()}, function (data) {
                vm.OrderItem = data.data;
            }, "json");
        },
        watch: {//监听属性 当属性发生改变执行
        }
    });

</script>

</body>
</html>