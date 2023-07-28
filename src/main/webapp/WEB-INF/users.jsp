<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="cfmt" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>
<head>
    <title>JSP Page</title>
    <link href="assets/css/users.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <script src="assets/js/users.js"></script>
</head>

<body>


<%--<%--%>
<%--    User userObj = (User) session.getAttribute("loggedUser");--%>

<%--%>--%>

<%--<%=userObj.getEmail()%>--%>


<%--<%--%>

<%--    List<User> list = (List<User>) request.getAttribute("user");--%>

<%--%>--%>

<%--<%--%>
<%--    List<User> list = (List<User>) request.getAttribute("users");--%>
<%--%>--%>

<form style="margin-left: 87%" action="logout" method="POST">
    <input type="submit" value="Logout">
</form>

<div class="container">

    <div class="control_panel">
        <form:form action="usersm" method="GET" modelAttribute="user">
            <div class="form-group">
                <label>Name</label>
                <form:input path="name" class="form-control" aria-describedby="emailHelp" placeholder="Enter name"/>
                <form:errors path="name" />
            </div>
            <div class="form-group">
                <label>Surname</label>
                <form:input path="surname" class="form-control" placeholder="Enter surname"/>
                <form:errors path="surname" />
            </div>

            <form:button type="submit" class="btn btn-primary">Search</form:button>
        </form:form>
    </div>
    <br/>


    <div>
        <table class="table">
            <thead>
            <tr>
                <th>name</th>
                <th>surname</th>
                <th>phone</th>
                <th>email</th>
                <th>birthdate</th>
                <th>nationality</th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%--            <%--%>
            <%--                for (User u : list) {--%>
            <%--            %>--%>
            <cfmt:forEach items="${users}" var="u">
                <tr>
                    <td>${u.name}
                    </td>
                    <td>${u.surname}
                    </td>
                    <td>
                            ${u.phone}
                    </td>
                    <td>
                            ${u.email}
                    </td>
                    <td>
                            <%--                    <cfmt:formatDate value="${u.date}" pattern="yyyy-MM-dd"/>--%>
                            <%--                    <fmt:formatDate pattern="yyyy-MM-dd" value="${u.date}" />--%>

                    </td>


                    <td style="width: 5px;">
                        <input type="hidden" name="id" value="${u.id}">
                        <input type="hidden" name="action" value="delete">
                        <button class="btn btn-danger btn_table" type="submit" value="delete" data-toggle="modal"
                                data-target="#exampleModal"
                                onclick="setIdForDelete(${u.id})">
                            <i class=" fa-solid fa-trash"></i>
                        </button>

                    </td>
                    <td style="width: 5px;">
                        <form action="userdetail" method="GET">
                            <input type="hidden" name="id" value="${u.id}"/>
                            <input type="hidden" name="action" value="update"/>
                            <button class="btn btn-secondary btn_table" type="submit" value="update">
                                <i class=" fa-sharp fa-solid fa-marker"></i>
                            </button>
                        </form>

                    </td>

                    <td style="width: 5px;">
                        <form action="userdetail" method="GET">
                            <input type="hidden" name="id" value="${u.id}"/>
                            <input type="hidden" name="action" value="detail"/>
                            <button class="btn btn-secondary btn_table" type="submit">
                                <i class="fa-solid fa-info"></i>
                            </button>
                        </form>

                    </td>


                </tr>
            </cfmt:forEach>
            </tbody>
        </table>

    </div>

</div>

<!-- Button trigger modal -->
<!-- Modal -->


<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure?
            </div>
            <div class="modal-footer">
                <form action="userdetail" method="POST">
                    <input type="hidden" name="id" value="" id="idForDelete"/>
                    <input type="hidden" name="action" value="delete"/>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-danger" value="Delete"/>
                </form>

            </div>
        </div>
    </div>
</div>

</body>
</html>