<%@ page import="com.company.entity.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP Page</title>
    <link href="assets/css/user.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>


<%

    User u = (User) request.getAttribute("user");
    String action = request.getParameter("action");


%>

<%
    if (action.equals("detail")) {
%>
<div class="container">
    <form action="userdetail" method="GET">
        <div class="form-row">
            <input type="hidden" name="id" value="<%=u.getId()%>"/>
            <div class="form-group col-md-6">
                <label>Name</label>
                <input type="text" name="name" value="<%=u.getName()%>" class="form-control"/>
            </div>
            <div class="form-group col-md-6">
                <label>Surname</label>
                <input type="text" name="surname" value="<%=u.getSurname()%>" class="form-control"/>
            </div>
            <div class="form-group col-md-6">
                <label>Phone</label>
                <input type="text" name="phone" value="<%=u.getPhone()%>" class="form-control"/>
            </div>
            <div class="form-group col-md-6">
                <label>Email</label>
                <input type="email" name="email" value="<%=u.getEmail()%>" class="form-control"/>
            </div>
            <div class="form-group col-md-6">
                <label>Birthdate</label>
                <input type="date" name="date" value="<%=u.getBirthdate()%>" class="form-control"/>
            </div>
        </div>
    </form>
    <%
    }

    else {
    %>
</div>

<div class="container">
    <form action="userdetail" method="POST">
        <div class="form-row">
            <input type="hidden" name="id" value="<%=u.getId()%>">
            <div class="form-group col-md-6">
                <label>Name</label>
                <input type="text" name="name" value="<%=u.getName()%>" class="form-control" id="inputEmail4"
                       placeholder="Enter name">
            </div>
            <div class="form-group col-md-6">
                <label for="inputPassword4">Surname</label>
                <input type="text" name="surname" value="<%=u.getSurname()%>" class="form-control" id="inputPassword4"
                       placeholder="Enter surname">
            </div>
        </div>
        <div class="form-group">
            <label for="inputAddress">Phone</label>
            <input type="text" name="phone" value="<%=u.getPhone()%>" class="form-control" id="inputAddress"
                   placeholder="Phone">
        </div>
        <div class="form-group">
            <label for="inputAddress2">Email</label>
            <input type="email" name="email" value="<%=u.getEmail()%>" class="form-control" id="inputAddress2"
                   placeholder="Enter Email">
        </div>
        <div class="form-group">
            <label for="inputAddress3">Birthday</label>
            <input type="date" name="date" value="<%=u.getBirthdate()%>" class="form-control" id="inputAddress3"
                   placeholder="BirthDate"/>
        </div>


        <button type="submit" name="action" value="update" class="btn btn-primary">Update</button>
    </form>
    <%
        }
    %>

</div>

</body>
</html>