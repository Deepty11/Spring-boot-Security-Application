<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: rehnuma
  Date: 7/8/20
  Time: 11:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link  href="/resources/static/style.css" rel="stylesheet" >
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
    <title>Home</title>
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

    <a class="navbar-brand" href="/"><img src="/resources/images/logo.jpg" alt="logo"  width="70" height="70"/></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/login">Signin<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/signUp">Signup</a>
            </li>

        </ul>
        <div class="dropdown drop-div">
            <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                <img class="userImage" src="/resources/user_Images/${user.file_name}" width="50" height="50"/>${user.name}
            </a>

            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                <a class="dropdown-item" href="#">Your profile</a>
                <a class="dropdown-item" href="/logout">Logout</a>
            </div>
        </div>
    </div>
</nav>
<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name!=null}">
        <form id="logoutForm" method="post" action="/logout">

        </form>
        <h2>Welcome ${user} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
        <h2>image: ${user.file_name}</h2>
    </c:if>

</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</body>
</html>
