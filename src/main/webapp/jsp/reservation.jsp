<%--
  Created by IntelliJ IDEA.
  User: JC
  Date: 29/08/2019
  Time: 10:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
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
    <link href="${contextPath}/resources/css/jquery.timepicker.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/font-awesome/all.min.css" rel="stylesheet">


    <script src="${contextPath}/resources/js/jquery.min.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.bundle.min.js"></script>
    <script src="${contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${contextPath}/resources/js/jquery.dataTables.min.js"></script>
    <script src="${contextPath}/resources/js/jquery.timepicker.min.js"></script>

 
    <script>
        $(document).ready(function () {

            $("#inputResDate").datepicker({
                dateFormat : 'yy-mm-dd'
            });

            $("#inputResTimeStart").timepicker({
                timeFormat : 'HH:mm:ss'
            });

            $("#inputResTimeEnd").timepicker({
                timeFormat : 'HH:mm:ss'
            });



            $("#btnAddRes").click(function () {
                alert("dfsd");
                var request = {
                    scheduledStartTime: $("#inputResTimeStart").val(),
                    scheduledEndTime: $("#inputResTimeEnd").val(),
                    eventRoomId: $("#selectResLocation").val(),
                    eventName: $("#inputResEvent").val(),
                    remarks: $("#inputResRemarks").val(),
                    dateRequested: $("#inputResDate").val()
                };


                $.ajax({
                    url: "${contextPath}/addReservation",
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify(request), //Stringified Json Object
                    dataType: 'json',
                    success: function (response) {
                        alert(response.userId);
                        if (response.userId > 0) alert ("added to database");
                        
                    }
                });
        
            });
            
            $.ajax({
                    url: "${contextPath}/getReservation",
                    type: "GET",
                    contentType: "application/json",
                    //data: JSON.stringify(request), //Stringified Json Object
                    //dataType: 'json',
                    success: function (data) {
                   
                        $("#tableReservation").dataTable({
                            bJQueryUI : true,
                            data : data,
                            columns :[
                                    { "data": "reservationId" },
                                    { "data": "eventRooms.eventRoomName" },
                                    { "data": "eventName" },
                                    { "data": "dateRequested" },
                                    { "data": "scheduledStartTime" },
                                    { "data": "scheduledEndTime" },
                                    { "data": "remarks" },
                                    { "data": "status" }
                                    ]
                       

                        });
                    }       
             });
                
//                "bServerSide": true,
//                            "bJQueryUI" : true,
//                            "sPaginationType" : "full_numbers",
//                            "sAjaxSource": "../getReservation",
//                            "aoColumns": [
//                                {"mData": "reservationId", "sTitle": " ", "sWidth": "2%", "bSortable" : false , "sClass" : "center"},
//                                {"mData": "eventRooms.eventRoomName", "sTitle": "Location", "sWidth": "10%", "bSortable" : true , "sClass" : "center"},
//                                {"mData": "eventName", "sTitle": "Event", "sWidth": "10%", "bSortable" : true , "sClass" : "center"},
//                                {"mData": "dateRequested", "sTitle": "Date", "sWidth": "10%", "bSortable" : true , "sClass" : "center"},
//                                {"mData": "scheduledStartTime", "sTitle": "Start Time", "sWidth": "10%", "bSortable" : false , "sClass" : "center"},
//                                {"mData": "scheduledEndTime", "sTitle": "End Time", "sWidth": "10%", "bSortable" : false , "sClass" : "center"},
//                                {"mData": "remarks", "sTitle": "Remarks", "sWidth": "10%", "bSortable" : true , "sClass" : "center"},
//                                {"mData": "url", "sTitle": "Status", "sWidth": "10%", "bSortable" : true , "sClass" : "center"}
//                            ],
//                            "oLanguage": {
//                                "sSearch": "Filter Search Result:",
//                                "sProcessing": "Loading Please Wait...",
//                                "sLoadingRecords": "Loading Please Wait...",
//                                "sZeroRecords": "No Records Found!",
                
               
//                    "fnServerParams": function (aoData) {
//                        aoData.push({ "name": "reservationId", "value": 0 });
//                    },
//"mRender" : "function ( aaData, type, full )  {return  '<button id=\"reservationEdit\" data-id=\"' + reservationId + '\">edit</button>'", 
                

        });
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
                    <h1 class="h3 mb-0 text-gray-800">Reservation</h1>
                    <!-- <div>
                      <button type="button" class="btn btn-light">ADD</button>
                      <button type="button" class="btn btn-dark">CANCEL</button>
                    </div> -->
                </div>
                <!-- Summary -->
                <div id="tabs-1">
                    <div class="row">
                        <div class="form-group col-md-2">
                            <label>Location:</label>
                            <select class="custom-select" id="selectResLocation">
                                <option value="1">Gabsi</option>
                                <option value="2">NDC</option>
                            </select>
                        </div>
                        <div class="form-group col-md-2">
                            <label>Event:</label>
                            <input type="text" class="form-control" id="inputResEvent">
                        </div>
                        <div class="form-group col-md-2">
                            <label>Date: </label>
                            <input type="date" class="form-control" id="inputResDate"/>
                        </div>
                        <div class="form-group col-md-2">
                            <label>Time Start:</label>
                            <input type="text" class="form-control" id="inputResTimeStart">
                        </div>
                        <div class="form-group col-md-2">
                            <label>Time End: </label>
                            <input type="text" class="form-control" id="inputResTimeEnd"/>
                        </div>
                        <div class="form-group col-md-2">
                            <label>Remarks: </label>
                            <input type="text" class="form-control" id="inputResRemarks"/>
                        </div>
                    </div>
                    <div class="container" style="float: right;">
                        <button style="float:right; border-radius: 1px; background-color: #F8C471; margin-left: 3px; margin-bottom: 2px">
                            CANCEL
                        </button>
                        <button id="btnAddRes"
                                style="float:right; border-radius: 1px; background-color: #7DCEA0; margin-bottom: 3px;">
                            ADD
                        </button>
                    </div>
                    <div class="container">
                        <table id="tableReservation" class="table table-bordered" cellspacing="0" width="100%"
                               style="font-size: 0.8em; background-color: white;">
                            <thead style="background-color: black; color: white;">
                            <tr>
                                 <th class="th-sm" style="text-align: center; vertical-align: middle;"></th>
                                <th class="th-sm" style="text-align: center; vertical-align: middle;">Location</th>
                                <th class="th-sm" style="text-align: center; vertical-align: middle;">Event</th>
                                <th class="th-sm" style="text-align: center; vertical-align: middle;">Date</th>
                                <th class="th-sm" style="text-align: center; vertical-align: middle;">Start Time</th>
                                <th class="th-sm" style="text-align: center; vertical-align: middle;">End Time</th>
                                <th class="th-sm" style="text-align: center; vertical-align: middle;">Remarks</th>
                                <th class="th-sm" style="text-align: center; vertical-align: middle;">Status</th>
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
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
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
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2019</span>
                        </div>
                    </div>
                </footer>
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
                            <span aria-hidden="true">×</span>
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
</body>
</html>
