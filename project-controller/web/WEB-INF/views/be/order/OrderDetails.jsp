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
                            订单详情<input id="orderNo" type="hidden" value="${details}">
                        </h1>
                    </div>
                </div>
                <div class="col-md-12 column">
                    <hr/>
                </div>
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
    </div>
</div>
<%--vue容器作用域范围 --%>
</body>
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


    // 手动通过点击模拟高亮菜单项
    $('#treeMenu').on('click', 'a', function () {
        $('#treeMenu li.active').removeClass('active');
        $(this).closest('li').addClass('active');
    });
</script>
</html>