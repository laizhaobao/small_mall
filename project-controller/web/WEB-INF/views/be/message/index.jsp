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
                <li class="active">留言管理</li>
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
                                           placeholder="按用户名搜索">
                                    <span class="input-group-btn">
										<button class="btn btn-default" type="button" @click="searchName()">搜索</button>
									</span>
                                </div>
                            </div>
                            <div class="tools-group">

                            </div>
                        </div>
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>用户名</th>
                                <th>留言内容</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="(mes,index) in pageInfo.list">
                                <td>{{index+1}}</td>
                                <td>{{mes.username}}</td>
                                <td>{{mes.content}}</td>
                                <td>
                                    <input type="button" class="btn btn-primary" @click="showModal(mes)" value="查看">
                                    <input type="button" class="btn btn-danger" @click="del(mes.id)" value="删除">
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
                                    <div class="form-group">
                                        <label for="userId" class="col-sm-2 control-label">用户ID</label>
                                        <div class="col-sm-10">
                                            <input type="text" disabled class="form-control" id="userId" name="id" v-model="id"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="username" class="col-sm-2 control-label">用户名称</label>
                                        <div class="col-sm-10">
                                            <input type="text" disabled class="form-control" id="username" name="username"
                                                   v-model="username"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="content" class="col-sm-2 control-label">留言内容</label>
                                        <div class="col-sm-10">
                                            <input type="text" disabled class="form-control" id="content" name="content"
                                                   v-model="content"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                            </button>
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
            id: null,
            username: null,
            content:null
        }, methods: {
            /*
        * 这里是写方法的地方
        * 方法名字:function(){
        *
        * }
        * */ showModal: function (data) {
                $("#myModal").data("op", "update");
                vm.id = data.id;
                vm.username = data.username;
                vm.content = data.content;
                $("#myModalLabel").text("留言管理");

                $("#myModal").modal('show');
            }
            ,
            searchName:function(){
                const name = $("#inputSearchExample3").val();
                $.post('/message/search', {pageNum: vm.page,name: name}, function (data) {
                    vm.pageInfo = data.data;
                }, "json");
            },
            del: function (id) {
                if (confirm("是否删除?")) {
                    $.post('/message/delete', {id:id}, function (data) {
                        if(data.code == "200"){
                            alert(data.message);
                            window.location.reload();
                        }
                    }, "json");
                }
            },
            save: function (){

            }
        },
        mounted: function () {//初始化数据 第一次会执行的方法
            $.post('/message/list', {pageNum: 1}, function (data) {
                vm.pageInfo = data.data;
            }, "json");
        },
        watch: {//监听属性 当属性发生改变执行
            page: function () {
                $.get('/message/list', {pageNum: vm.page}, function (data) {
                    vm.pageInfo = data.data;
                }, "json");
            }
        }
    });
</script>

</body>
</html>
