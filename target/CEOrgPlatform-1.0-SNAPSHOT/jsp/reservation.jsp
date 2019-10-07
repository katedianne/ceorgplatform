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

<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Reservation</title>


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

        
        <script>
            var currentRoleId = ${currentRoleId};
            var currentUserId = ${currentUserId};
            var currentOrgId = ${currentOrgId};
        </script>
        <script src="${contextPath}/resources/js/reservation.js"></script>

        <style>
            .help-block {
                color: red
                
            }
        </style>
        
    </head>
    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <jsp:include page="_navigationBar.jsp" />

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
                    <form id="formReservation">
                        <div class="row">
                            <div class="form-group col-md-2">
                                <label>Location:</label>
                                <select class="custom-select" id="selectResLocation" name="selectResLocation">
                                    <option value="">Please select a room</option>
                                    <option value="1">Gabsi</option>
                                    <option value="2">NDC</option>
                                    <option value="3">AVR</option>
                                    <option value="4">CONFERENCE ROOM</option>
                                </select>
                            </div>
                            <div class="form-group col-md-2">
                                <label>Event:</label>
                                <input type="text" class="form-control" id="inputResEvent" name="inputResEvent">
                            </div>
                            <div class="form-group col-md-2">
                                <label>Date: </label>
                                <input type="text" class="form-control" id="inputResDate" name="inputResDate"/>
                            </div>
                            <div class="form-group col-md-2">
                                <label>Time Start:</label>
                                <input type="text" class="form-control" id="inputResTimeStart" name="inputResTimeStart">
                            </div>
                            <div class="form-group col-md-2">
                                <label>Time End: </label>
                                <input type="text" class="form-control" id="inputResTimeEnd" name="inputResTimeEnd" disabled=""/>
                            </div>
                            <div class="form-group col-md-2">
                                <label>Remarks: </label>
                                <input type="text" class="form-control" id="inputResRemarks" name="inputResRemarks"/>
                            </div>
                        </div>
                        <div class="container" style="float: right;">
                            <button type="button" id="btnCancelReservation" style="float:right; border-radius: 1px; background-color: #F8C471; margin-left: 3px; margin-bottom: 2px">
                                CANCEL
                            </button>
                            <button type="submit" id="btnAddReservation" data-id="0"
                                    style="float:right; border-radius: 1px; background-color: #7DCEA0; margin-bottom: 3px;">
                                ADD
                            </button>
                        </div>
                    </form>
                    <div class="container">
                        <table id="tableReservation" class="row-border" >
                            <thead style="background-color: black; color: white;">
                                <tr>
                                    <th class="th-sm" ></th>
                                    <th class="th-sm" >Location</th>
                                    <th class="th-sm">Event</th>
                                    <th class="th-sm" >Date</th>
                                    <th class="th-sm">Start Time</th>
                                    <th class="th-sm">End Time</th>
                                    <th class="th-sm" >Remarks</th>
                                    <th class="th-sm" >Status</th>
                                    <th class="th-sm" ></th>
                                </tr>
                            </thead>
                            <tbody style="color: black;" >
                                <tr>
                                    <td></td>
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


            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->


        <jsp:include page="_footer.jsp" />   


        <div id="dialogDeleteReservation" title="Delete Reservation Request" style="display:none">
            <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>This reservation request will be permanently deleted. Do you want to continue?</p>
        </div>
        <div id="dialogConfirmReservation" title="Confirm Reservation Request" style="display:none">
            <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>This reservation request will be approved. Do you want to continue?</p>
        </div>
    </body>
</html>
