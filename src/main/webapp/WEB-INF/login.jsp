<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>


<body class="login_background">
<form action="login" method="POST">
    <input type="hidden" name="${_csrf.parameterName}"
    value="${_csrf.token}" />
    <div class="col-4 container login_fix_">
        <center>
            <h1>Login:</h1>
        </center>
        <div class="form-group">
            <label>Email address:</label>
            <input type="email" class="form-control" placeholder="email@example.com" name="username">
        </div>
        <div class="form-group">
            <label>Password:</label>
            <input type="password" class="form-control" placeholder="Password" name="password">
        </div>
        <button type="submit" class="btn-btn-primary" name="login">Login</button>

    </div>
</form>

</body>
</html>
