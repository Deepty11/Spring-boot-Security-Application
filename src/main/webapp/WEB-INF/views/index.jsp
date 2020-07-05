<!DOCTYPE html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link  href="/resources/static/style.css" rel="stylesheet" >
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<head>
    <title>Index</title>
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
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
<c:choose>
    <c:when test="${mode=='MODE_HOME'}">
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
        <section class="testimonial py-5" id="testimonial" style="background: #0d0d0d">
            <div class="container">
                <div class="row ">
                    <div class="col-md-4 py-5 text-white text-center " style="background: teal">
                        <div class=" ">
                            <div class="card-body">
                                <img src="resources/images/reg.png" style="width:30%">
                                <h2 class="py-3">Registration as Blogger</h2>
                                <p>Fullfill Your Dream as a blogger... post whatever you like ... ta da !!

                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 py-5 border" style="background: white">
                        <h4 class="pb-4">Please fill with your details</h4>
                        <form method="post" action="/signUp/saveUser">
                            <input type="hidden"
                                   name="id"
                                   value="${user.id}">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <input id="Name"
                                           name="name"
                                           placeholder="Full Name"
                                           class="form-control"
                                           type="text"
                                           value="${user.name}">
                                </div>
                                <div class="form-group col-md-6">
                                    <input type="email"
                                           class="form-control"
                                           id="inputEmail4"
                                           placeholder="Email"
                                           name="email"
                                           value="${user.email}">
                                </div>

                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <input id="Mobile No."
                                           name="contact"
                                           placeholder="Mobile No."
                                           class="form-control"
                                           required="required"
                                           type="text"
                                           value="${user.contact}">
                                </div>
                                <div class="form-group col-md-6">
                                    <input type="password"
                                           class="form-control"
                                           id="password1"
                                           placeholder="Password"
                                           name="password"
                                           value="${user.password}">
                                </div>
                                <div class="form-group col-md-12">
                                    <textarea id="comment"
                                              name="comment"
                                              cols="40" rows="5"
                                              class="form-control"
                                              ></textarea>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group">
                                    <div class="form-group">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="invalidCheck2" required>
                                            <label class="form-check-label" for="invalidCheck2">
                                                <small>By clicking Submit, you agree to our Terms & Conditions, Visitor Agreement and Privacy Policy.</small>
                                            </label>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="form-row">
                                <button type="submit" class="btn btn-danger">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

    </c:when>
    <c:when test="${mode=='MODE_LOGIN'}">
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->

                <!-- Icon -->
                <div class="fadeIn first">
                    <img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" />
                </div>
                <div class="form-group ${error != null ? 'has-error' : ''}">
                <span>${logout}</span>

                <!-- Login Form -->
                <form method="post" action="/login">
                    <input type="text" id="login" class="fadeIn second" name="email" placeholder="email">
                    <input type="password" id="password" class="fadeIn third" name="password" placeholder="password">
                    <input type="submit" class="fadeIn fourth" value="Log In">
                </form>

                <!-- Remind Passowrd -->
                <div id="formFooter">
                    <a class="underlineHover" href="#">Forgot Password?</a>
                </div>

            </div>
        </div>
    </c:when>
</c:choose>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

</body>
</html>