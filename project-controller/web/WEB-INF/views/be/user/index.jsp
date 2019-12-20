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
                <li class="active">用户管理</li>
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
                                           placeholder="按账号搜索">
                                    <span class="input-group-btn">
										<button class="btn btn-default" type="button" @click="searchName()">搜索</button>
									</span>
                                </div>
                            </div>
                            <div class="tools-group">
                                <button href="#" class="add btn btn-info" @click="addModal()"><i
                                        class="icon icon-plus-sign"></i>新增
                                </button>
                            </div>
                        </div>
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>账号</th>
                                <th>密码</th>
                                <th>邮箱</th>
                                <th>手机号码</th>
                                <th>密保问题</th>
                                <th>密保答案</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="(user,index) in pageInfo.list">
                                <td>{{index+1}}</td>
                                <td>{{user.username}}</td>
                                <td>{{user.pwd}}</td>
                                <td>{{user.email}}</td>
                                <td>{{user.phone}}</td>
                                <td>{{user.question}}</td>
                                <td>{{user.answer}}</td>
                                <td>
                                    <input type="button" class="btn btn-danger" @click="del(user.uid)" value="删除">
                                    <input type="button" class="btn btn-primary" @click="updateModal(user)" value="编辑">
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
                <!-- 模态框（Modal）-->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
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
                                <form class="form-horizontal" role="form">
                                    <div class="form-group" hidden>
                                        <label for="uid" class="col-sm-2 control-label">用户ID</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="uid" name="uid" v-model="uid"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="username" class="col-sm-2 control-label">账号</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="username" name="username"
                                                   v-model="username"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="pwd" class="col-sm-2 control-label">密码</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" id="pwd" name="pwd"
                                                   v-model="pwd"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" class="col-sm-2 control-label">邮箱</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="email" name="email"
                                                   v-model="email"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone" class="col-sm-2 control-label">手机号码</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="phone" name="phone"
                                                   v-model="phone"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="question" class="col-sm-2 control-label">密保问题</label>
                                        <div class="col-sm-10">
                                            <input type="tel" class="form-control" id="question" name="question"
                                                   v-model="question"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="answer" class="col-sm-2 control-label">密保答案</label>
                                        <div class="col-sm-10">
                                            <input type="tel" class="form-control" id="answer" name="answer"
                                                   v-model="answer"/>
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
                <%--模态框--%>
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
            page: 1,
            uid: null,
            username: null,
            pwd: null,
            email: null,
            phone: null,
            question: null,
            answer: null
        }, methods: {
            /*
        * 这里是写方法的地方
        * 方法名字:function(){
        *
        * }
        * */
            searchName: function () {
                const name = $("#inputSearchExample3").val();
                $.post('/user/search', {pageNum: vm.page, username: name}, function (data) {
                    vm.pageInfo = data.data;
                }, "json");
            },
            del: function (data) {
                alert(data);
                if (confirm("是否删除?")) {
                    $.post('/user/delete', {id: data}, function (data) {
                        if (data.code == "200") {
                            // 创建 Messager 实例
                            const message = new $.zui.Messager(data.message, {
                                type: 'danger'// 定义颜色主题
                            }).show();
                            window.location.reload();
                        }
                    }, "json");
                }
            },
            addModal: function () {
                $("#myModal").data("op", "insert");
                $("#myModalLabel").text("用户管理---添加用户");
                vm.username = null;
                vm.pwd = null;
                vm.email = null;
                vm.phone = null;
                vm.question = null;
                vm.answer = null;
                $("#myModal").modal('show');
            },
            updateModal: function (data) {
                $("#myModal").data("op", "update");
                vm.uid = data.uid;
                vm.username = data.username;
                vm.pwd = data.pwd;
                vm.email = data.email;
                vm.phone = data.phone;
                vm.question = data.question;
                vm.answer = data.answer;
                $("#myModalLabel").text("用户管理---修改用户");
                $("#myModal").modal('show');
            }
            ,
            save: function () {
                const op = $("#myModal").data("op");
                if (op != "update") {
                    const obj = {
                        username: vm.username,
                        pwd: vm.pwd,
                        email: vm.email,
                        phone: vm.phone,
                        question: vm.question,
                        answer: vm.answer,
                    }
                    $.ajax({
                        url: "/user/insert",
                        dataType: "json",
                        type: "post",
                        data: obj,
                        success: function (data) {
                            if (data.code = "200") {
                                // 创建 Messager 实例
                                const message = new $.zui.Messager(data.message, {
                                    type: 'success'// 定义颜色主题

                                }).show();
                                $("#myModal").modal('hide');
                            } else {
                                // 创建 Messager 实例
                                const message = new $.zui.Messager(data.message, {
                                    type: 'danger'// 定义颜色主题
                                }).show();
                            }
                        }
                    })
                } else {
                    const obj = {
                        uid: vm.uid,
                        username: vm.username,
                        pwd: vm.pwd,
                        email: vm.email,
                        phone: vm.phone,
                        question: vm.question,
                        answer: vm.answer,
                    }
                    $.ajax({
                        url: "/user/update",
                        dataType: "json",
                        type: "post",
                        data: obj,
                        success: function (data) {
                            if (data.code = "200") {
                                // 创建 Messager 实例
                                const message = new $.zui.Messager(data.message, {
                                    type: 'success',// 定义颜色主题
                                    time: 0
                                }).show();
                                $("#myModal").modal('hide');
                                window.location.reload();
                            } else {
                                // 创建 Messager 实例
                                const message = new $.zui.Messager(data.message, {
                                    type: 'danger',// 定义颜色主题
                                    time: 0
                                }).show();
                            }
                        }
                    })
                }

            }
        },
        mounted: function () {//初始化数据 第一次会执行的方法
            $.post('/user/list', {pageNum: 1}, function (data) {
                vm.pageInfo = data.data;
            }, "json");
        },
        watch: {//监听属性 当属性发生改变执行
            page: function () {
                $.get('/user/list', {pageNum: vm.page}, function (data) {
                    vm.pageInfo = data.data;
                }, "json");
            }
        }
    });
</script>

</body>
</html>
