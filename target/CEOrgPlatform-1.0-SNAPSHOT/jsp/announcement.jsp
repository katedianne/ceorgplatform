
<%-- 
    Document   : announcement
    Created on : Sep 1, 2019, 10:43:24 PM
    Author     : Kate Dianne
--%>

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
        <link href="${contextPath}/resources/css/bootstrap-select.min.css" rel="stylesheet">
        <link href="${contextPath}/resources/webfonts/fa-regular-400.ttf" rel="stylesheet">
        <link href="${contextPath}/resources/webfonts/fa-regular-400.eot" rel="stylesheet">
        <link href="${contextPath}/resources/webfonts/fa-solid-900.woff" rel="stylesheet">
        <link href="${contextPath}/resources/webfonts/fa-solid-900.ttf" rel="stylesheet">

        <script src="${contextPath}/resources/js/jquery.min.js"></script>
        <script src="${contextPath}/resources/js/bootstrap.bundle.min.js"></script>
        <script src="${contextPath}/resources/js/jquery-ui.min.js"></script>
        <script src="${contextPath}/resources/js/jquery.dataTables.min.js"></script>
        <script src="${contextPath}/resources/js/bootstrap-select.min.js"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
    
        <![endif]-->
        <script>

            $(document).ready(function () {

                $('#inputRecipient').selectpicker();

                $("#btnAddAnnouncement").click(function () {
                    alert("dfsd");
                    var request = {
                        announcementName: $("#inputAnnouncementName").val(),
                        announcement: $("#inputAnnouncement").val(),
                        recipient: [{
                                announcedTo: parseInt($("#inputRecipient").val())
                            }]
                    };


                    $.ajax({
                        url: "${contextPath}/addAnnouncement",
                        type: "POST",
                        contentType: "application/json",
                        data: JSON.stringify(request), //Stringified Json Object
                        dataType: 'json',
                        success: function (response) {
                            alert(response.userId);
                            if (response.userId > 0)
                                alert("added to database");

                        }
                    });

                });

                $.ajax({
                    url: "${contextPath}/getAnnouncement",
                    type: "GET",
                    contentType: "application/json",
                    //data: JSON.stringify(request), //Stringified Json Object
                    //dataType: 'json',
                    success: function (data) {

                        $("#tableReservation").dataTable({
                            bJQueryUI: true,
                            data: data,
                            columns: [
                                {"data": "reservationId"},
                                {"data": "eventRooms.eventRoomName"},
                                {"data": "eventName"},
                                {"data": "dateRequested"},
                                {"data": "scheduledStartTime"},
                                {"data": "scheduledEndTime"},
                                {"data": "remarks"},
                                {"data": "status"}
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
                    <h1 class="h3 mb-0 text-gray-800">Announcement</h1>
                    <!-- <div>
                      <button type="button" class="btn btn-light">ADD</button>
                      <button type="button" class="btn btn-dark">CANCEL</button>
                    </div> -->
                </div>
                <!-- Summary -->
                <div id="tabs-1">
                    <div class="row form-group">
                        <div class="col-lg-6">
                            <input id="inputAnnouncementName" type="text" class="announcement_title_textarea form-control" data-toggle="tooltip" title="Announcement Title" placeholder="Enter Announcement Title">
                        </div>
                        <div class="col-lg-2"> </div>
                        <div class="col-lg-4">
                            <select id="inputRecipient" multiple class="selectpicker form-control mdb-select md-form">
                                <option value="0"> Send to </option>
                                <option value="1"> ACCESS </option>
                                <option value="2"> CEHS </option>
                                <option value="3"> ECESS </option>
                                <option value="4"> EEN </option>
                                <option value="5"> PICE </option>
                                <option value="6"> PIIE </option>
                                <option value="7"> PSME </option>
                                <option value="8"> PUP Aggregates </option>
                                <option value="9"> PUP-RAILS </option>
                                <option value="10"> CE-SC </option>
                            </select>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-lg-12">
                            <textarea id="inputAnnouncement" class="announcement_textarea form-control" data-toggle="tooltip" title="Announcement Information" placeholder="Enter Announcement Information here" rows="6"></textarea>
                        </div>
                    </div>
                    <div class="row button_class">
                        <div class="col row_button_announcements">
                            <button class="btn btn-primary button_bold" type="button" data-toggle="tooltip" title="bold"> B </button>
                            <button class="btn btn-primary button_italicize" type="button" data-toggle="tooltip" title="italicize"> i </button>
                            <button class="btn btn-primary button_image" type="button" data-toggle="tooltip" title="Attach file">
                                <i class="fa fa-paperclip"> </i> 
                            </button>
                            <button class="btn btn-primary button_image" type="button" data-toggle="tooltip" title="Upload image"> 
                                <i class="far fa-image"> </i>
                            </button>
                            <button id="btnAddAnnouncement" class="btn btn-primary" > SEND </button>
                        </div>
                    </div>
                    <div class="container row" >
                        <!--                                                                                <button id="btnCancelAnnounce" style="float:right; border-radius: 1px; background-color: #FC5E5E; margin-left: 3px; margin-bottom: 2px">CANCEL</button>
                                                                                                        <button id="btnSaveAnnounce" style="float:right; border-radius: 1px; background-color: #F8C471; margin-left: 3px; margin-bottom: 2px">SAVE</button>
                                                                                                        <button id="btnAddAnnounce" style="float:right; border-radius: 1px; background-color: #7DCEA0; margin-bottom: 3px;">ADD</button>-->
                    </div> 
                    <div class="container"> </br>
                        <table id="dtBasicExample" class="table table-bordered" cellspacing="0" width="100%" style="font-size: 0.8em; background-color: white;">
                            <thead style="background-color: black; color: white;">
                                <tr>
                                    <th class="th-sm" style="text-align: center; vertical-align: middle; width: 50px"> </th>
                                    <th class="th-sm" style="text-align: center; vertical-align: middle;">Date</th>
                                    <th class="th-sm" style="text-align: center; vertical-align: middle;">Announcement Title</th>
                                    <th class="th-sm" style="text-align: center; vertical-align: middle;">Announcement Information</th>
                                    <th class="th-sm" style="text-align: center; vertical-align: middle;">Author</th>
                                </tr>
                            </thead>
                            <tbody style="color: black;">
                                <tr>
                                    <td> <button style="border:none; background-color: white;" title="View"> <i class="fas fa-eye"></i> </button> </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td> <button style="border:none; background-color: white;" title="View"> <i class="fas fa-eye"></i> </button> </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td> <button style="border:none; background-color: white;" title="View"> <i class="fas fa-eye"></i> </button> </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td> <button style="border:none; background-color: white;" title="View"> <i class="fas fa-eye"></i> </button> </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td> <button style="border:none; background-color: white;" title="View"> <i class="fas fa-eye"></i> </button> </td>
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
    </body>
</html>
