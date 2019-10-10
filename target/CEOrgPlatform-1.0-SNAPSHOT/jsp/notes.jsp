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
        <script src="${contextPath}/resources/js/jquery.validate.min.js"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
    
        <![endif]-->
        <script>
            var currentRoleId = ${currentRoleId};
            var currentUserId = ${currentUserId};
            var currentOrgId = ${currentOrgId};
        </script>
        <script src="${contextPath}/resources/js/notes.js"></script>
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

                    <div class="col-lg-4">
                        <div class="input-group md-form form-sm form-1 pl-0">
                            <div class="input-group-prepend">
                                <span class="input-group-text blue lighten-3" id="basic-text1"><i class="fas fa-search text-white" aria-hideen="true"></i></span>
                            </div>
                            <input class="form-control my-0 py-0" type="text" placeholder="Search" aria-label="Search">
                        </div>
                        <form id="formNote">
                            <div class="input-group md-form form-sm form-1 pl-0">
                                <input id="inputNoteTitle" class="form-control my-4 py-0" type="text" placeholder="Title" aria-label="Title">
                            </div>

                            <div class="form-group">
                                <textarea id="inputNote" class="form-control rounded-0 my-0 py-4" row="10" placeholder="notes"></textarea>
                            </div>  

                            <div>
                                <button id="btnAddNote" type="submit" class="btn btn-success">ADD</button>
                                <button id="btnCancelNote" type="button" class="btn btn-danger">CANCEL</button>
                            </div>
                        </form>
                    </div>

                    <div class="col-lg-4" id="firstColNotesContainer">
                        
                    </div>

                    <div class="col-lg-4" id="secondColNotesContainer">
<!--                        <div class="card shadow mb-4">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between border-bottom-primary">
                                <h6 class="m-0 font-weight-bold text-primary">Title </h6>
                                <div class="dropdown no-arrow">
                                    <a href="#" class="btnEditNote"><i class="fas fa-edit fa-sm fa-fw"></i></a>
                                    <a href="#" class="btnDeleteNote"> <i class="fas fa-trash-alt fa-sm fa-fw"></i></a>
                                </div>
                            </div>

                            <div class="card-body">
                                Dropdown menus can be  placed in the card header in order to extend the functionality of a basic card. In this dropdown card example, the Font Awesome vertical ellipsis icon in the card header can be clicked on in order to toggle a dropdown menu.
                            </div>
                        </div>-->
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
