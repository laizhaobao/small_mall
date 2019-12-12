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
                <div class="col-md-12 column">
                    <div class="col-md-4 column">
                        <h1>
                            类型管理
                        </h1>
                    </div>
                    <div class="col-md-8 column" style="text-align: right;top:18px">
                        <a class="btn btn-primary" href="#" @click="addModal()">添加类型</a>
                    </div>
                    <hr/>
                </div>
                <div class="col-md-12 column">
                    <hr/>
                </div>
                <%--                 搜索--%>
                <div class="input-group" style="margin-bottom: 20px">
                    <div class="input-control search-box search-box-circle has-icon-left has-icon-right search-example"
                         id="searchboxExample">
                        <input id="inputSearchExample3" type="search" style="width: 200px;"
                               class="form-control search-input" placeholder="按名称搜索">
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
                            <th>编号</th>
                            <th>类型名称</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for="(cate,index) in pageInfo.list">
                            <td>{{cate.id}}</td>
                            <td>{{cate.name}}</td>
                            <td>
                                <input type="button" class="btn btn-danger" @click="del(cate.id)" value="删除">
                                <input type="button" class="btn btn-primary" @click="updateModal(cate)" value="编辑">
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
    <!-- 模态框（Modal）-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">

                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="myform">
                        <div class="form-group" hidden>
                            <label for="categoryId" class="col-sm-2 control-label">用户ID</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="categoryId" name="id" v-model="id"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="name" name="name"
                                       v-model="name"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                </button>
                                <a class="btn btn-primary" href="#" @click="save()">保存</a>
                            </div>
                        </div>
                    </form>
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
            page: 1,
            id: null,
            name: null
        }, methods: {
            /*
        * 这里是写方法的地方
        * 方法名字:function(){
        * 
        * }
        * */
            searchName:function(){
               const name = $("#inputSearchExample3").val();
                $.post('/category/search', {pageNum: vm.page,name: name}, function (data) {
                    vm.pageInfo = data.data;
                }, "json");
            },
            del: function (id) {
                if (confirm("是否删除?")) {
                    $.post('/category/delete', {id:id}, function (data) {
                       if(data.code == "200"){
                           alert(data.message);
                           window.location.reload();
                       }
                    }, "json");
                }
            },
            addModal: function () {
                $("#myModal").data("op", "insert");
                $("#myModalLabel").text("类型管理---添加类型");
                vm.name = null;
                $("#myModal").modal('show');
            },
            updateModal: function (data) {
                $("#myModal").data("op", "update");
                vm.id = data.id;
                vm.name = data.name;
                $("#myModalLabel").text("类型管理---修改类型");
                $("#myModal").modal('show');
            }
            ,
            save: function (){
                const op = $("#myModal").data("op");
                const forData = new FormData(document.querySelector("#myform"));
                if (op != "update") {
                    $.ajax({
                        url: "/category/insert",
                        dataType: "json",
                        type: "post",
                        cache: false,
                        processData: false,
                        contentType: false,
                        data: forData,
                        success: function (data) {
                            if (data.code = "200") {
                                alert(data.message)
                                $("#myModal").modal('hide');
                                window.location.reload();
                            } else {
                                alert(data.message)
                            }
                        }
                    })
                } else {
                    $.ajax({
                        url: "/category/update",
                        dataType: "json",
                        type: "post",
                        cache: false,
                        processData: false,
                        contentType: false,
                        data: forData,
                        success: function (data) {
                            if (data.code = "200") {
                                alert(data.message)
                                $("#myModal").modal('hide');
                                window.location.reload();
                            } else {
                                alert(data.message)
                            }
                        }
                    })
                }

            }
        },
        mounted: function () {//初始化数据 第一次会执行的方法
            $.post('/category/list', {pageNum: 1}, function (data) {
                vm.pageInfo = data.data;
            }, "json");
        },
        watch: {//监听属性 当属性发生改变执行
            page: function () {
                $.get('/category/list', {pageNum: vm.page}, function (data) {
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