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
        
        <script>
            var currentRoleId = ${currentRoleId};
            var currentUserId = ${currentUserId};
            var currentOrgId = ${currentOrgId};
        </script>
        <script src="${contextPath}/resources/js/payment.js"></script>

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
            <!-- End of Sidebar -->

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
                    <form id="formPayment">
                        <div class="row">
                            <div class=" form-group col-md-4">
                                <label>Organization: </label>
                                <select id="inputPaymentOrg" name="inputPaymentOrg" class="custom-select">
                                    <option value=""> Please select your organization </option>
                                    <option value="1"> ACCESS </option>
                                    <option value="2"> PUP Aggregates </option>
                                    <option value="3"> PICES </option>
                                    <option value="4"> ECESS </option>
                                    <option value="5"> PUP-RAILS </option>
                                    <option value="6"> EEN </option>
                                    <option value="7"> PIIE </option>
                                    <option value="8"> PSME </option>
                                    <option value="9"> CSHS </option>
                                    <option value="10"> CE-SC </option>
                                </select>
                            </div>
                            <div class="form-group col-md-2">
                                <label>Balance:</label>
                                <input type="text" class="form-control" id="inputPaymentBalance" name="inputPaymentBalance">
                            </div>
                            <!--                            <div class="form-group col-md-2">
                                                            <label>Amount:</label>
                                                            <input type="text" class="form-control" id="inputResEvent" name="inputResEvent">
                                                        </div>-->
                            <div class="form-group col-md-2">
                                <label>Payment Name:</label>
                                <input type="text" class="form-control" id="inputPaymentPN" name="inputPaymentPN"/>
                            </div>
                            <div class="form-group col-md-3">
                                <label>Remarks: </label>
                                <input type="text" class="form-control" id="inputPaymentRemarks" name="inputPaymentRemarks"/>
                            </div>
                        </div>

                        <div class="container" style="float: right;">
                            <button type="button" id="btnCancelPayment" style="float:right; border-radius: 1px; background-color: #F8C471; margin-left: 3px; margin-bottom: 2px">
                                CANCEL
                            </button>
                            <button type="submit" id="btnAddPayment" data-id="0"
                                    style="float:right; border-radius: 1px; background-color: #7DCEA0; margin-bottom: 3px;">
                                ADD
                            </button>
                        </div>
                    </form>
                    <div class="container">
                        <table id="tablePayment" class="table table-bordered" cellspacing="0" width="100%"
                               style="font-size: 0.8em; background-color: white;">
                            <thead style="background-color: black; color: white;">
                                <tr>
                                    <th class="th-sm" style="text-align: center; vertical-align: middle;"></th>
                                    <th class="th-sm" style="text-align: center; vertical-align: middle;">Balance</th>
                                    <th class="th-sm" style="text-align: center; vertical-align: middle;">Amount</th>
                                    <th class="th-sm" style="text-align: center; vertical-align: middle;">Payment Name</th>

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

                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>




            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Footer -->
        <jsp:include page="_footer.jsp" />  
        <!-- End of Footer -->
        <div id="dialogDeletePayment" title="Delete Payment Request" style="display: none">
            <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>This payment will be deleted. Do you want to continue?</p>
        </div>
<!--        <div id="dialogConfirmPayment" title="Confirm Reservation Request" style="display: none">
            <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>This reservation request will be approved. Do you want to continue?</p>
        </div>-->
    </body>
</html>

