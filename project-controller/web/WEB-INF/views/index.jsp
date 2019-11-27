<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/11/25
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="/static/js/vue.js" type="text/javascript"></script>
<script src="/static/js/jquery-3.4.1.min.js" type="text/javascript"></script>
<body>
<div id="mytable">
    <table>
        <tr>
            <td>编号</td>
            <td>账号</td>
            <td>密码</td>
            <td>邮箱</td>
            <td>联系方式</td>
            <td>密保问题</td>
            <td>密保答案</td>
            <td>角色权限</td>
            <td>创建时间</td>
            <td>修改时间</td>
        </tr>
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
            <td>{{user.createTime}}</td>
            <td>{{user.updateTime}}</td>
            <td>
                <input type="button" @click="id=user.id" value="删除">
                <input type="button" @click="id=user.id" value="修改">
            </td>
        </tr>
        </tbody>
    </table>
    <button v-for="(nums,index) in pageInfo.navigatepageNums" :class="{'color':page==nums}" @click="page=nums">
        {{nums}}
    </button>
</div>

</body>
<script type="text/javascript">
    var vue = new Vue({
        el: "#mytable",
        data: {
            //定义变量接收数据
            pageInfo: [],
            page: 1,
        }, methods: {
            first: function () {
                vue.page = 1;
            },
            prev: function () {
                vue.page = vue.pageInfo.prePage;
            },
            next: function () {
                vue.page = vue.pageInfo.nextPage;
            },
            last: function () {
                vue.page = vue.pageInfo.pages;
            }
        },
        mounted: function () {//初始化数据 第一次会执行的方法
            $.post('/list', {pageNum: 1}, function (data) {
                alert(data.message);
                if(data.code == "200"){
                    vue.pageInfo = data.data;
                } else {
                    alert(data.message);
                }
            }, "json");
        },
        watch: {//监听属性 当属性发生改变执行
            page: function () {
                $.post('/list', {pageNum: vue.page}, function (data) {
                    vue.pageInfo = data;
                }, "json");
            }
        }
    });
</script>
</html>
