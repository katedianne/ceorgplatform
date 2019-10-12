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
        <script src="${contextPath}/resources/js/jquery.validate.min.js"></script>

        <script>
            var currentRoleId = ${currentRoleId};
            var currentUserId = ${currentUserId};
            var currentOrgId = ${currentOrgId};
        </script>
        <script src="${contextPath}/resources/js/calendar.js"></script>

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
                    <h1 class="h3 mb-0 text-gray-800">Calendar of Events</h1>
                    <!-- <div>
                      <button type="button" class="btn btn-light">ADD</button>
                      <button type="button" class="btn btn-dark">CANCEL</button>
                    </div> -->
                </div>
                <div id="tabs-1">
                    <form id="formCalendar">
                        <div class="row">
                            <div class="form-group col-md-2">
                                <label>Event:</label>
                                <input id="inputEvent" name="inputEvent" type="text" class="form-control" >
                            </div>
                            <div class="form-group col-md-3">
                                <label>Date Start: </label>
                                <input id="inputDateStart" name="inputDateStart" type="date" class="form-control"/>
                            </div>
                            <div class="form-group col-md-3">
                                <label>Date End:</label>
                                <input id="inputDateEnd" name="inputDateEnd" type="date" class="form-control">
                            </div>
                            <div class="form-group col-md-4">
                                <label>Description: </label>
                                <input id="inputDescription" name="inputDescription" type="text" class="form-control"/>
                            </div>
                        </div>
                        <div class="container" style="float: right;">
                            <button id="btnCancelCalendar" style="float:right; border-radius: 1px; background-color: #FC5E5E; margin-left: 3px; margin-bottom: 2px">CANCEL</button>
                            <!--                            <button id="btnSaveCalendar" style="float:right; border-radius: 1px; background-color: #F8C471; margin-left: 3px; margin-bottom: 2px">SAVE</button>-->
                            <button id="btnAddCalendar" type="submit" style="float:right; border-radius: 1px; background-color: #7DCEA0; margin-bottom: 3px;">ADD</button>
                        </div>
                    </form>
                    <div class="container">
                        <table id="tableCalendar" class="table table-bordered" cellspacing="0" width="100%" style="font-size: 0.8em; background-color: white;">
                            <thead style="background-color: black; color: white;">
                                <tr>
                                    <th class="th-sm" style="text-align: center; vertical-align: middle; width: 9%"></th>
                                    <th class="th-sm" style="text-align: center; vertical-align: middle;">Event</th>
                                    <th class="th-sm" style="text-align: center; vertical-align: middle;">Date Start</th>
                                    <th class="th-sm" style="text-align: center; vertical-align: middle;">Date End</th>
                                    <th class="th-sm" style="text-align: center; vertical-align: middle;">Description</th>
                                </tr>
                            </thead>
                            <tbody style="color: black;">
                                <tr>
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
        <div id="dialogDeleteActivity" title="Delete Activity" style="display:none">
            <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>This Activity will be deleted. Do you want to continue?</p>
        </div>
    </body>
</html>
    