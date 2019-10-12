<%-- 
    Document   : payment
    Created on : Sep 13, 2019, 12:45:31 PM
    Author     : Mark Jason Medina
--%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Payment</title>


        <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        <link href="${contextPath}/resources/css/jquery-ui.css" rel="stylesheet">
        <link href="${contextPath}/resources/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="${contextPath}/resources/css/jquery.timepicker.min.css" rel="stylesheet">
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
        <script src="${contextPath}/resources/js/jquery.timepicker.min.js"></script>
        <script src="${contextPath}/resources/js/jquery.validate.min.js"></script>
        <script src="${contextPath}/resources/js/payment.js"></script>


    </head>
    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <jsp:include page="_navigationBar.jsp" />
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
                                   data-toggle="dropdown"
                                   aria-haspopup="true" aria-expanded="false">
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
                            <h1 class="h3 mb-0 text-gray-800">Payment</h1>
                            <!-- <div>
                              <button type="button" class="btn btn-light">ADD</button>
                              <button type="button" class="btn btn-dark">CANCEL</button>
                            </div> -->
                        </div>
                        <!-- Summary -->
                        <div id="tabs-1">
                            <form id="formReservation">
                                <div class="row">
                                    <div class="form-group col-md-2">
                                        <label>Balance:</label>
                                        <input type="text" class="form-control" id="inputResEvent" name="inputResEvent">
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label>Amount:</label>
                                        <input type="text" class="form-control" id="inputResEvent" name="inputResEvent">
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label>Payment:</label>
                                        <input type="text" class="form-control" id="inputResDate" name="inputResDate"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-4">
                                        <label>First Name:</label>
                                        <input type="text" class="form-control" id="inputResEvent" name="inputResEvent">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label>Last Name:</label>
                                        <input type="text" class="form-control" id="inputResEvent" name="inputResEvent">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label>Remarks: </label>
                                        <input type="text" class="form-control" id="inputResRemarks" name="inputResRemarks"/>
                                    </div>
                                </div>
                                <div class="container" style="float: right;">
                                    <button type="button" id="btnCancelReservation" style="float:right; border-radius: 1px; background-color: #F8C471; margin-left: 3px; margin-bottom: 2px">
                                        CANCEL
                                    </button>
                                    <button type="button" id="btnAddReservation" data-id="0"
                                            style="float:right; border-radius: 1px; background-color: #7DCEA0; margin-bottom: 3px;">
                                        ADD
                                    </button>
                                </div>
                            </form>
                            <div class="container">
                                <table id="tableReservation" class="table table-bordered" cellspacing="0" width="100%"
                                       style="font-size: 0.8em; background-color: white;">
                                    <thead style="background-color: black; color: white;">
                                        <tr>
                                            <th class="th-sm" style="text-align: center; vertical-align: middle;"></th>
                                            <th class="th-sm" style="text-align: center; vertical-align: middle;">Balance</th>
                                            <th class="th-sm" style="text-align: center; vertical-align: middle;">Amount</th>
                                            <th class="th-sm" style="text-align: center; vertical-align: middle;">Payment</th>
                                            <th class="th-sm" style="text-align: center; vertical-align: middle;">Name</th>
                                            <th class="th-sm" style="text-align: center; vertical-align: middle;">Remarks</th>
                                        </tr>
                                    </thead>
                                    <tbody style="color: black;">
                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>


                        <!-- Footer -->
                        <jsp:include page="_footer.jsp" />  
                        <!-- End of Footer -->

                    </div>
                    <!-- End of Content Wrapper -->

                </div>
                <!-- End of Page Wrapper -->

                <!-- Scroll to Top Button-->
                <a class="scroll-t  o-top rounded" href="#page-top">
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
                                    <span aria-hidden="true">�</span>
                                </button>
                            </div>
                            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                <a class="btn btn-primary" href="login.html">Logout</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Bootstrap core JavaScript-->
                <%--        <script src="vendor/jquery/jquery.min.js"></script>--%>
                <%--        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>

                <%--        <!-- Core plugin JavaScript-->--%>
                <%--        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>--%>

                <%--        <!-- Custom scripts for all pages-->--%>
                <%--        <script src="js/sb-admin-2.min.js"></script>--%>

                <%--        <!-- Page level plugins -->--%>
                <%--        <script src="vendor/chart.js/Chart.min.js"></script>--%>

                <%--        <!-- Page level custom scripts -->--%>
                <%--        <script src="js/demo/chart-area-demo.js"></script>--%>
                <%--        <script src="js/demo/chart-pie-demo.js"></script>--%>
            </div>
        </div>
        <div id="dialogDeleteReservation" title="Delete Reservation Request">
            <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>This reservation request will be permanently deleted. Do you want to continue?</p>
        </div>
        <div id="dialogConfirmReservation" title="Confirm Reservation Request">
            <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>This reservation request will be approved. Do you want to continue?</p>
        </div>
    </body>
</html>

