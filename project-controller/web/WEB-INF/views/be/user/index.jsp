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
                                    <a href="#">品类管理</a>
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
                            用户管理
                        </h1>
                    </div>
                    <div class="col-md-8 column" style="text-align: right;top:18px">
                        <a class="btn btn-primary" href="#" @click="addModal()">添加用户</a>
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
                               class="form-control search-input" placeholder="按账号搜索">
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
                            <th>账号</th>
                            <th>密码</th>
                            <th>邮箱</th>
                            <th>手机号码</th>
                            <th>密保问题</th>
                            <th>密保答案</th>
                            <th>用户权限</th>
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
                            <td>{{user.role}}</td>
                            <td>
                                <input type="button" class="btn btn-danger" @click="del(user.id)" value="删除">
                                <input type="button" class="btn btn-primary" @click="updateModal(user)" value="编辑">
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
                    <form class="form-horizontal" role="form">
                        <div class="form-group" hidden>
                            <label for="userid" class="col-sm-2 control-label">用户ID</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="userid" name="id" v-model="id"/>
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
                                <input type="password" class="form-control" id="pwd" name="pwd" v-model="pwd"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="email" name="email" v-model="email"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phone" class="col-sm-2 control-label">手机号码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="phone" name="phone" v-model="phone"/>
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
                                <input type="tel" class="form-control" id="answer" name="answer" v-model="answer"/>
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
            searchName:function(){
               const name = $("#inputSearchExample3").val();
                $.post('/user/search', {pageNum: vm.page,username: name}, function (data) {
                    vm.pageInfo = data.data;
                }, "json");
            },
            del: function (id) {
                if (confirm("是否删除?")) {
                    $.post('/user/delete', {id:id}, function (data) {
                       if(data.code == "200"){
                           alert(data.message);
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
                vm.id = data.id;
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
                                alert(data.message)
                                $("#myModal").modal('hide');
                            } else {
                                alert(data.message)
                            }
                        }
                    })
                } else {
                    const obj = {
                        id: vm.id,
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
                                alert(data.message)
                                $("#myModal").modal('hide');
                            } else {
                                alert(data.message)
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


    // 手动通过点击模拟高亮菜单项
    $('#treeMenu').on('click', 'a', function () {
        $('#treeMenu li.active').removeClass('active');
        $(this).closest('li').addClass('active');
    });
</script>
</html>