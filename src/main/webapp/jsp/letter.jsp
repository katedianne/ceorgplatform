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
        <link href="${contextPath}/resources/css/jquery.timepicker.min.css" rel="stylesheet">
        <link href="${contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
        <link href="${contextPath}/resources/css/all.min.css" rel="stylesheet">
        <link href="${contextPath}/resources/webfonts/fa-regular-400.ttf" rel="stylesheet">
        <link href="${contextPath}/resources/webfonts/fa-regular-400.eot" rel="stylesheet">
        <link href="${contextPath}/resources/webfonts/fa-solid-900.woff" rel="stylesheet">
        <link href="${contextPath}/resources/webfonts/fa-solid-900.ttf" rel="stylesheet">

        <script src="${contextPath}/resources/js/jquery.min.js"></script>
        <script src="${contextPath}/resources/js/bootstrap.bundle.min.js"></script>
        <script src="${contextPath}/resources/js/jquery.timepicker.min.js"></script>
        <script src="${contextPath}/resources/js/jquery-ui.min.js"></script>
        <script src="${contextPath}/resources/js/jquery.dataTables.min.js"></script>
        <script src="${contextPath}/resources/js/jquery.validate.min.js"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
    
        <![endif]-->
        <script>
            var currentRoleId = ${currentRoleId};
            var currentUserId = ${currentUserId};
            var currentOrgId = ${currentOrgId};
        </script>
        <script src="${contextPath}/resources/js/letter.js"></script>
    
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
                    <h1 class="h3 mb-0 text-gray-800">Letter Tracker</h1>
                </div>

                <div id="tabs-1">
                    <form id="formLetter">
                        <div class="row">
                            <div class="form-group col-md-2">
                                <label>Letter Type:</label>
                                <input type="text" class="form-control" id="inputLetterType" name="inputLetterType">
                            </div>
                            <div class="form-group col-md-3">
                                <label>Letter Name: </label>
                                <input type="text" class="form-control" id="inputLetterName" name="inputLetterName"/>
                            </div>
                            <div class="form-group col-md-3">
                                <label>Date Released:</label>
                                <input type="date" class="form-control" id="inputDateReleased" name="inputDateReleased">
                            </div>
                            <div class="form-group col-md-4">
                                <label>Remarks: </label>
                                <input type="text" class="form-control" id="inputRemarks" name="inputRemarks"/>
                            </div>
                            <div class="container" style="float: right;">
                                <button id="btnCancelLetter" style="float:right; border-radius: 1px; background-color: #FC5E5E; margin-left: 3px; margin-bottom: 2px">CANCEL</button>
<!--                                <button id="btnSaveLetter" style="float:right; border-radius: 1px; background-color: #F8C471; margin-left: 3px; margin-bottom: 2px">SAVE</button>-->
                                <button type="submit" id="btnAddLetter" style="float:right; border-radius: 1px; background-color: #7DCEA0; margin-bottom: 3px;">ADD</button>
                            </div>

                            <div class="container">
                                <table id="tableLetter" class="table table-bordered" cellspacing="0" width="100%" style="font-size: 0.8em; background-color: white;">
                                    <thead style="background-color: black; color: white;">
                                        <tr>
                                            <th class="th-sm" style="text-align: center; vertical-align: middle; width: 9%;"> </th>
                                            <th class="th-sm" style="text-align: center; vertical-align: middle;"> Control Number </th>
                                            <th class="th-sm" style="text-align: center; vertical-align: middle;"> Letter Type </th>
                                            <th class="th-sm" style="text-align: center; vertical-align: middle;"> Letter Name </th>
                                            <th class="th-sm" style="text-align: center; vertical-align: middle;"> Date Released </th>
                                            <th class="th-sm" style="text-align: center; vertical-align: middle;"> Remarks </th>
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
                    </form>

                </div>




            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <jsp:include page="_footer.jsp" />     
        <div id="dialogDeleteLetter" title="Delete Letter" style="display:none">
            <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>This Letter will be deleted. Do you want to continue?</p>
        </div>
    </body>
</html>
