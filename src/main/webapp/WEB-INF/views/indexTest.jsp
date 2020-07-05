<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="static/css/style.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
    <meta charset="UTF-8">
    <title>Index</title>
</head>
<body >
<nav class="navbar navbar-expand-lg navbar-light bg-dark nav-div">
    <a class="navbar-brand" href="/welcome"><img src="resources/images/logo.jpg" width="150" height="70"/> </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/welcome">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/login">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/register">Registration</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/showUsers">All Users</a>
            </li>


        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
<c:choose>

    <c:when test="${mode=='MODE_HOME'}">
        <div class="jumbotron jumb-div" >
            <h1 class="display-4">The Beatles</h1>
            <p class="lead">This is a fan page of The Beatles band , An english band which was formed in 1960 in Liverpool</p>
            <hr class="my-4">
            <p>The Beatles are the best-selling music act of all time, with certified sales of over 183 million
                units in the US and estimated sales of 600 million units worldwide. They hold the record for
                most number-one albums on the UK Albums Chart, most number-one hits on the Billboard Hot 100 chart,
                and most singles sold in the UK.</p>
            <p class="lead">
                <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
            </p>
        </div>
    </c:when>

    <c:when test="${mode=='MODE_REGISTRATION'}">


        <div class="registration"><h1>Registration</h1></div>


        <form method="POST" action="saveUser" class="form2"  >
            <input type="hidden" name="userid" value="${user.id}" />

            <div class="form-group row">
                <label  class="col-sm-2 col-form-label" >Name</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control"  name="name" placeholder="Name" value="${user.name}" />
                </div>
            </div>
            <div class="form-group row">
                <label  class="col-sm-2 col-form-label" >Email</label>
                <div class="col-sm-7">
                    <input type="email"
                           class="form-control"
                           name="email"
                           placeholder="Email"
                           value="${user.email}"/>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Password</label>
                <div class="col-sm-7">
                    <input type="password"
                           class="form-control"
                           name="password"
                           placeholder="Password"
                           value="${user.password}" />
                </div>
            </div>


            <div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">Sign in</button>
                </div>
            </div>
        </form>
    </c:when>
    <c:when test="${mode=='ALL_USERS'}">
        <table class="table table-light ">
            <thead class="thead-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Edit</th>
                <th scope="col">Delete</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${user}">
                <tr>
                    <th scope="row">${user.id}</th>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td><a href="/update?id=${user.id}">Edit</a> </td>
                    <td><a href="/deleteUser?id=${user.id}"><span class="glyphicon glyphicon-trash">Delete</span></a></td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </c:when>
    <c:when test="${mode=='MODE_EDIT'}">
        <div class="update"><h1>Edit Information</h1></div>


        <form method="POST" action="updateUser${user.id}" class="form2"  >
            <input type="hidden" name="id" value="${user.id}" />


            <div class="form-group row">
                <label  class="col-sm-2 col-form-label" >Name</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control"  name="name" placeholder="name" value="${user.name}" />
                </div>
            </div>
            <div class="form-group row">
                <label  class="col-sm-2 col-form-label" >Email</label>
                <div class="col-sm-7">
                    <input type="email"
                           class="form-control"
                           name="email"
                           placeholder="Email"
                           value="${user.email}"/>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Password</label>
                <div class="col-sm-7">
                    <input type="password"
                           class="form-control"
                           name="password"
                           placeholder="Password"
                           value="${user.password}" />
                </div>
            </div>


            <div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </div>
        </form>
    </c:when>
    <c:when test="${mode=='MODE_LOGIN'}">
        <div class="login"><h1>Login</h1></div>

        <c:if test="${not empty error}">
            <div class="alert alert-danger div-alert "><h6 class="alert-h1"><c:out value="${error}"></c:out></h6></div>
        </c:if>
        <form method="POST" action="/loginUser" class="form2"  >

            <div class="form-group row">
                <label  class="col-sm-2 col-form-label" >Email</label>
                <div class="col-sm-7">
                    <input type="email"
                           class="form-control"
                           name="email"
                           placeholder="Email"
                           value="${user.email}"/>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Password</label>
                <div class="col-sm-7">
                    <input type="password"
                           class="form-control"
                           name="password"
                           placeholder="Password"
                           value="${user.password}" />
                </div>
            </div>


            <div class="form-group row">
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
            </div>
        </form>
    </c:when>

</c:choose>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
</body>
</html>