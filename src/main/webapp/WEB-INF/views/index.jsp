<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link  href="/resources/static/style.css" rel="stylesheet" >
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<head>
    <title>Index</title>
    <style>
        .card-img-custom {
            background-image: url("resources/images/reg_photo.jpg");
            background-size: 100% 100%;
            background-repeat: no-repeat;
        }

        .idx-form-btn{
            background-color: teal ;
            color: white;
        }

        .login-left-img {
            background-image: url("resources/images/login_image.jpg");
            background-size: 100% 100%;
            background-repeat: no-repeat;
        }
    </style>
</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

    <a class="navbar-brand" href="/"><img src="/resources/images/bloggers_mania.png" alt="logo"  width="70" height="70"/></a>
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
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
<c:choose>
    <c:when test="${mode=='MODE_WELCOME'}">
        <div class="jumbotron">
            <h1 class="display-4">Hello, world!</h1>
            <p class="lead">This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
            <hr class="my-4">
            <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
            <p class="lead">
                <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
            </p>
        </div>
    </c:when>
    <c:when test="${mode=='MODE_REGISTRATION'}">
        <section class="testimonial py-5" id="testimonial" style="background: rgba(100,102,88,0.73)">
            <div class="container">
                <div class="row ">
                    <div class="col-md-4 py-5 text-white text-center card-img-custom"></div>
                    <div class="col-md-8 py-5 border" style="background: white">
                        <h2 class="form-signin-heading">Create your account</h2>

                        <c:if test="${check=='true'}">
                            <div class="alert alert-success"><c:out value="${success}"></c:out> </div>
                        </c:if>
                        <form:form method="POST" modelAttribute="user" class="form-signin" enctype="multipart/form-data">
                            <h5 class="pb-4">Please fill with your details</h5>
                            <spring:bind path="name">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="name" class="form-control" placeholder="Username"
                                                autofocus="true"></form:input>
                                    <form:errors path="name"></form:errors>
                                </div>
                            </spring:bind>
                            <spring:bind path="email">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="email" path="email" class="form-control" placeholder="Email"
                                                autofocus="true"></form:input>
                                    <form:errors path="email"></form:errors>
                                </div>
                            </spring:bind>
                            <spring:bind path="contact">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="contact" class="form-control" placeholder="Contact"
                                                autofocus="true"></form:input>
                                    <form:errors path="contact"></form:errors>
                                </div>
                            </spring:bind>

                            <spring:bind path="password">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                                    <form:errors path="password"></form:errors>
                                </div>
                            </spring:bind>

                            <spring:bind path="passwordConfirm">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="password" path="passwordConfirm" class="form-control"
                                                placeholder="Confirm your password"></form:input>
                                    <form:errors path="passwordConfirm"></form:errors>
                                </div>
                            </spring:bind>


                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="file" path="file" class="btn idx-form-btn"></form:input>
                            </div>

                            <div class="row">
                                <div class="col-sm-3 pull-right">
                                    <button class="btn idx-form-btn btn-block" type="submit">Submit</button>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </section>
    </c:when>
    <c:when test="${mode=='MODE_LOGIN'}">
        <section class="testimonial py-5" id="testimonial" style="background: rgba(100,102,88,0.73)">
            <div class="container">
                <div class="row ">
                    <div class="col-md-4 py-5 text-white text-center login-left-img"></div>
                    <div class="col-md-8 py-5 border" style="background: white">
                        <div class=""><h1>Sign In</h1></div>
                        <div class=""><h3>Fill out your credentials</h3></div>
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger div-alert">
                                <h6 class="alert-h1"><c:out value="${error}"></c:out></h6>
                            </div>
                        </c:if>
                        <form method="POST" action="/doLogin" >
                            <div class="form-group row">
                                <span>${message}</span>
                                <div class="col-sm-7">
                                    <input type="email"
                                           class="form-control"
                                           name="email"
                                           placeholder="Email"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-7">
                                    <input type="password"
                                           class="form-control"
                                           name="password"
                                           placeholder="Password"/>
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-3">
                                    <button type="submit" class="btn idx-form-btn">Login</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <a href="${contextPath}/registration" style="font-size: large; color: teal">
                                        Create a new account
                                    </a>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-4">
                                    <a href="${contextPath}/registration" style="font-size: large; color: teal">
                                        Forgot Password?
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </c:when>
</c:choose>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

</body>
</html>