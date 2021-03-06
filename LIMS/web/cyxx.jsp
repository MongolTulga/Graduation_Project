<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>机器人创新实验室管理系统</title>

    <link rel="stylesheet" href="css/bace.css" type="text/css">
    <link rel="stylesheet" href="css/admin.css" type="text/css">

    <style>
        .cyxx_table table {
            border-collapse: collapse;
        }
        .cyxx_table table th, tr, td {
            height: 20px;
            white-space: nowrap;
        }
        .cyxx_table table th {
            width: 80px;
            padding: 5px 0;
            background: lightblue;
            border: lightblue solid 1px;
        }
        .cyxx_table table tr:hover {
            background: #f7f7f7;
        }
        .cyxx_table table td {
            border: gainsboro solid 1px;
            width: 40px;
            text-align: center;
            padding: 5px 10px;
        }
        .cyxx_table table a {
            display: inline-block;
            width: 50px;
            height: 30px;
            line-height: 30px;
            background: white;
            border: gainsboro solid 1px;
            border-radius: 4px;
            outline: none;
        }
        .cyxx_table table a:hover {
            color: #333;
            background-color: #e6e6e6;
            border-color: #adadad;
        }
    </style>
</head>

<body>
<div class="top">
    <p>
        <c:choose>
            <c:when test="${user == null}">
                <!-- 未登录 -->
                欢迎访问！
            </c:when>
            <c:when test="${user.getAuthoritiy() == 1}">
                <!-- 已登录 管理员 -->
                尊贵的${user.name}您好！您的上次登录时间是：<fmt:formatDate value="${user.last_time_login}" pattern="yyyy-MM-dd HH:mm:ss"/>
                &nbsp;&nbsp;
                <a href="${pageContext.request.contextPath}/index.jsp">返回主页</a>
                &nbsp;|&nbsp;
                <a href="${pageContext.request.contextPath}/logoutServlet">注销</a>
            </c:when>
        </c:choose>
    </p>
</div>

<header>
    <h1>机器人创新实验室后台管理系统</h1>
    <img src="image/logo.jpg" alt="内蒙古师范大学logo">
</header>

<div class="admin_menu">
    <ul>
        <li><a href="${pageContext.request.contextPath}/getViewTimesServlet">首页</a></li>
        <li><a href="">实验室信息管理</a></li>
        <li><a href="${pageContext.request.contextPath}/userListServlet">成员信息管理</a></li>
        <li><a href="">权限管理</a></li>
        <li><a href="">值日表管理</a></li>
        <li><a href="${pageContext.request.contextPath}/applyUserByPageServlet">审核申请</a></li>
        <li><a href="${pageContext.request.contextPath}/findMessageServlet">查看留言</a></li>
    </ul>
</div>

<div class="cyxx_table">
    <table>
        <tr>
            <th>编号</th>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>籍贯</th>
            <th>班级</th>
            <th>手机号</th>
            <th>邮箱</th>
            <th>权限</th>
            <th>操作</th>
        </tr>

        <c:forEach items="${member}" var="user" varStatus="s">
            <tr>
                <td>${s.count}</td>
                <td>${user.number}</td>
                <td>${user.name}</td>
                <td>${user.gender}</td>
                <td>${user.age}</td>
                <td>${user.province}${user.city}${user.district}</td>
                <td>${user.classes}</td>
                <td>${user.phone_number}</td>
                <td>${user.email}</td>
                <td>${user.authoritiy}级</td>
                <td><a href="javascript:deleteUser(${user.id});">删除</a></td>
            </tr>
        </c:forEach>
    </table>
</div>

<script>
    //确定删除提示框
    function deleteUser(id) {
        if (confirm("您确定要删除成员吗？")) {
            location.href = "/deleteUserServlet?id="+id;
        }
    }
</script>
</body>
</html>