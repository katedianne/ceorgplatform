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

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${contextPath}/home">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">CE ORG PLATFORM</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="${contextPath}/home">
                        <i class="fas fa-home"></i>
                        <span>Home ${username}</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Interface
                </div>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="${contextPath}/reservation" >
                        <i class="fas fa-fw fa-wrench"></i>
                        <span>Reservation</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link collapsed" href="${contextPath}/announcement">
                        <i class="fas fa-bullhorn"></i>
                        <span>Announcements</span>
                    </a>

                <li class="nav-item">
                    <a class="nav-link" href="${contextPath}/letter">
                        <i class="fas fa-paper-plane"></i>
                        <span>Letter Tracker</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${contextPath}/calendar">
                        <i class="fas fa-calendar-alt"></i>
                        <span>Calendar</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${contextPath}/notes">
                        <i class="fas fa-sticky-note"></i>
                        <span>Notes</span></a>
                </li>
            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->


                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow mx-1">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Angela Enriquez</span>
                                    <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

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
                                        <!-- End of Page Content   -->

                                    </div>
                                    <!-- End of Main Content -->

                                </div>
                                <!-- End of Content Wrapper -->

                            </div>
                            <!-- End of Page Wrapper -->

                            <!-- Scroll to Top Button-->
                            <a class="scroll-to-top rounded" href="#page-top">
                                <i class="fas fa-angle-up"></i>
                            </a>

                            <!-- Logout Modal-->
                            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                        </div>
                                        <div class="modal-body" align="text-center">Select "Logout" below if you are ready to end your
                                            current session.
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                            <a class="btn btn-primary" href="login.html">Logout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

<!--                             Bootstrap core JavaScript
                            <script src="vendor/jquery/jquery.min.js"></script>
                            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

                             Core plugin JavaScript
                            <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

                             Custom scripts for all pages
                            <script src="js/sb-admin-2.min.js"></script>

                             Page level plugins 
                            <script src="vendor/chart.js/Chart.min.js"></script>

                             Page level custom scripts 
                            <script src="js/demo/chart-area-demo.js"></script>
                            <script src="js/demo/chart-pie-demo.js"></script>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
