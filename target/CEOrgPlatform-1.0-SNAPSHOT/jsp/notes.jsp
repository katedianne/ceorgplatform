<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html lang="en">
    <head>

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Log in with your account</title>


        <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="${contextPath}/resources/css/jquery-ui.css" rel="stylesheet">
        <link href="${contextPath}/resources/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="${contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
        <link href="${contextPath}/resources/css/all.min.css" rel="stylesheet">
        <link href="${contextPath}/resources/webfonts/fa-regular-400.ttf" rel="stylesheet">
        <link href="${contextPath}/resources/webfonts/fa-regular-400.eot" rel="stylesheet">
        <link href="${contextPath}/resources/webfonts/fa-solid-900.woff" rel="stylesheet">
        <link href="${contextPath}/resources/webfonts/fa-solid-900.ttf" rel="stylesheet">

        <script src="${contextPath}/resources/js/jquery.min.js"></script>
        <script src="${contextPath}/resources/js/bootstrap.bundle.min.js"></script>
        <script src="${contextPath}/resources/js/jquery-ui.min.js"></script>
        <script src="${contextPath}/resources/js/jquery.dataTables.min.js"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
    
        <![endif]-->
        <script>


            //         $(document).ready(function () {
            //             $("#tabs").tabs();
            //
            //             $("#btnAddChecklist").click(function () {
            //                 $("#liCheklist").show();
            //                 $("#liAuditFindings").show();
            //                 $("#liMatrix").show();
            //
            //                 $("#tabs").tabs("option", "active", 1);
            //             });
            //
            //             $("#btnLogin").click(function () {
            //
            //
            // //                var login = {
            // //                    username: $("#inputUsername").val(),
            // //                    password: $("#inputPassword").val()
            // //                };
            // //
            // //
            // //
            // //                    $.ajax({
            // //                        url: "loginProcess",
            // //                        type: "POST",
            // //                        contentType: "application/json",
            // //                        data: JSON.stringify(login), //Stringified Json Object
            // //                       // dataType: 'json',
            // //                        success: function (response) {
            // //                            alert(response);
            // //                            alert(response.username);
            // //
            // //                        }
            // //                    });
            //
            //
            //             });
            //
            //         });


        </script>
    </head>
    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <jsp:include page="_navigationBar.jsp" />

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Notes</h1>
                </div>

                <!-- Content Row -->
                <div class="row">

                    <div class="col-md-4">
                        <div class="input-group md-form form-sm form-1 pl-0">
                            <div class="input-group-prepend">
                                <span class="input-group-text blue lighten-3" id="basic-text1"><i class="fas fa-search text-white" aria-hideen="true"></i></span>
                            </div>
                            <input class="form-control my-0 py-0" type="text" placeholder="Search" aria-label="Search">
                        </div>

                        <div class="input-group md-form form-sm form-1 pl-0">
                            <input class="form-control my-4 py-0" type="text" placeholder="Title" aria-label="Title">
                        </div>

                        <div class="form-group">
                            <label>     </label>
                            <textarea class="form-control rounded-0 my-0 py-4" row="10"></textarea>
                        </div>

                        <div>
                            <button type="button" class="btn btn-success">ADD</button>
                            <button type="button" class="btn btn-danger">CANCEL</button>
                        </div>

                    </div>

                    <div class="col-md-4">

                        <div class="card mb-2 py-4 border-bottom-primary">
                            <div class="card-header py-1 mb-1">
                                <h5 class="m-0 font-weight-bold text-primary">Note 1</h5>
                            </div>
                            <div class="card-body">
                                lorem ipsum
                            </div>
                        </div>

                        <div class="card mb-2 py-4 border-bottom-warning">
                            <div class="card-header py-1 mb-1">
                                <h5 class="m-0 font-weight-bold text-primary">Note 1</h5>
                            </div>
                            <div class="card-body">
                                .border-left-primary
                            </div>
                        </div>

                        <div class="card mb-2 py-4 border-bottom-success">
                            <div class="card-header py-1 mb-1">
                                <h5 class="m-0 font-weight-bold text-primary">Note 1</h5>
                            </div>
                            <div class="card-body">
                                .border-left-primary
                            </div>
                        </div>

                    </div>

                    <!-- Border Bottom Utilities -->
                    <div class="col-md-4">

                        <div class="card shadow mb-4 border-bottom-warning">
                            <a href="#collapseCardExample1" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                <h6 class="m-0 font-weight-bold text-primary">Collapsable Card Example</h6>
                            </a>
                            <!-- Card Content - Collapse -->
                            <div class="collapse show" id="collapseCardExample1">
                                <div class="card-body">
                                    This is a collapsable card example using Bootstrap's built in collapse functionality. <strong>Click on the card header</strong> to see the card body collapse and expand!
                                </div>
                            </div>

                            <div class="card shadow mb-4 border-bottom-danger">
                                <a href="#collapseCardExample2" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                    <h6 class="m-0 font-weight-bold text-primary">Collapsable Card Example</h6>
                                </a>
                                <!-- Card Content - Collapse -->
                                <div class="collapse" id="collapseCardExample2">
                                    <div class="card-body">
                                        This is a collapsable card example using Bootstrap's built in collapse functionality. <strong>Click on the card header</strong> to see the card body collapse and expand!
                                    </div>
                                </div>

                                <div class="card shadow mb-4 border-bottom-success">
                                    <a href="#collapseCardExample3" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                        <h6 class="m-0 font-weight-bold text-primary">Collapsable Card Example</h6>
                                    </a>
                                    <!-- Card Content - Collapse -->
                                    <div class="collapse" id="collapseCardExample3">
                                        <div class="card-body">
                                            This is a collapsable card example using Bootstrap's built in collapse functionality. <strong>Click on the card header</strong> to see the card body collapse and expand!
                                        </div>
                                    </div>

                                    <div class="card shadow mb-4 border-bottom-primary">
                                        <a href="#collapseCardExample5" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
                                            <h6 class="m-0 font-weight-bold text-primary">Collapsable Card Example</h6>
                                        </a>
                                        <!-- Card Content - Collapse -->
                                        <div class="collapse" id="collapseCardExample5">
                                            <div class="card-body">
                                                This is a collapsable card example using Bootstrap's built in collapse functionality. <strong>Click on the card header</strong> to see the card body collapse and expand!
                                            </div>
                                        </div>
                                    </div>              
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                </div>
                <!-- End of Main Content -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <jsp:include page="_footer.jsp" />  
    </body>
</html>
