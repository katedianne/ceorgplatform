<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Log in with your account</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">
    <script src="${contextPath}/resources/js/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    
    <![endif]-->
    <script>



        $(document).ready(function () {

            $("#btnLogin").click(function () {

//                var login = {
//                    username: $("#inputUsername").val(),
//                    password: $("#inputPassword").val()
//                };
//
//
//
//                    $.ajax({
//                        url: "loginProcess",
//                        type: "POST",
//                        contentType: "application/json",
//                        data: JSON.stringify(login), //Stringified Json Object
//                       // dataType: 'json',
//                        success: function (response) {
//                            alert(response);
//                            alert(response.username);
//
//                        }
//                    });


            });
        });



    </script>
</head>

<body>
<div class="container">
    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-10 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                </div>
                                <form class="user" method="post" action="loginProcess">
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" name="username" id="inputUsername" aria-describedby="emailHelp" placeholder="Enter Username...">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user" name="password" id="inputPassword" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <span >${message}</span>
                                    </div>
                                    <button type="submit" id="btnLogin" class="btn btn-primary btn-user btn-block">Login</button>
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="#">Forgot Password?</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>

</body>
</html>