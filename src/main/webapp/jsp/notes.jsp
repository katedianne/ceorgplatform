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
                    <h1 class="h3 mb-0 text-gray-800">Notes</h1>
                </div>

                <!-- Content Row -->
                <div class="row">

                    <div class="col-lg-4">
<!--                        <div class="input-group md-form form-sm form-1 pl-0">
                            <div class="input-group-prepend">
                                <span class="input-group-text blue lighten-3" id="basic-text1"><i class="fas fa-search text-white" aria-hideen="true"></i></span>
                            </div>
                            <input class="form-control my-0 py-0" type="text" placeholder="Search" aria-label="Search">
                        </div>-->
                        <form id="formNote">
                            <div class="form-group md-form form-sm form-1 pl-0">
                                <input id="inputNoteTitle" name="inputNoteTitle" class="form-control" type="text" placeholder="Title" aria-label="Title">
                            </div>

                            <div class="form-group md-form form-sm form-1 pl-0">
                                <textarea id="inputNote" name="inputNote" class="form-control" rows="10"  placeholder="Note"></textarea>
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
                    </div>


                </div>
                <!-- End of Main Content -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <jsp:include page="_footer.jsp" />  
        
         <div id="dialogDeleteNote" title="Delete Note" style="display:none">
            <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>This note will be deleted. Do you want to continue?</p>
        </div>
    </body>
</html>
