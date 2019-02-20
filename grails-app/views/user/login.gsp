<%--
  Created by IntelliJ IDEA.
  User: Red Skull
  Date: 1/17/2019
  Time: 3:37 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <g:render template="/include/header"/>
    <asset:stylesheet href="login-style.css"></asset:stylesheet>
</head>
<body style="">
            <div class="container">
                <g:form action="home" controller="User" method="Post">
                    <label style="margin-left:50px"><b>Username</b></label>
                    <input type="text" placeholder="Enter Username" name="name" required>

                    <label style="margin-left:50px;"><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" name="password" required>

                    <button type="submit" class="mx-auto">Login</button>

                </g:form>
            </div>
</body>
</html>