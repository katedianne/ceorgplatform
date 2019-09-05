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

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>CE ORG PLATFORM</title>

  <link href="${contextPath}/resources/css/font-awesome/all.min.css" rel="stylesheet" type="text/css">
  <link href="css/font-googleapis.css" rel="stylesheet">
  <link href="css/boostrap-datetimepicker.css" rel="stylesheet">
  <link href="${contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
  <link href="css/announcement.css" rel="stylesheet" type="text/css" >

  <script src="${contextPath}/resources/js/jquery.min.js"></script>
  <script src="${contextPath}/resources/js/bootstrap.bundle.min.js"></script>
  <script src="${contextPath}/resources/js/jquery.easing.min.js"></script>
  <script src="${contextPath}/resources/js/sb-admin-2.min.js"></script>
  <script src="vendor/chart.js/Chart.min.js"></script>
  <script src="js/demo/chart-area-demo.js"></script>
  <script src="js/demo/chart-pie-demo.js"></script>

  <script>


        $(document).ready(function () {
            $("#btnAddAnnouncement").click(function () {
                alert("hoho");
                var request = {
                    
                    announcementName: $("#inputAnnouncementName").val(),
                    announcement: $("#inputAnnouncement").val(),
                    remarks: $("#inputAnnouncementRemarks").val(),
                };


                $.ajax({
                    url: "../addReservation",
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

        });


    </script>

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
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
      <li class="nav-item">
        <a class="nav-link" href="index.html">
          <i class="fas fa-home"></i>
          <span>Home</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
          Interface
        </div>

        <li class="nav-item ">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
          aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>Reservation</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="Reservation.html">Create</a>
            <a class="collapse-item" href="Reservation-history.html">History</a>
          </div>
        </div>
      </li>

      <li class="nav-item active">
        <a class="nav-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
        aria-controls="collapseTwo">
        <i class="fas fa-bullhorn"></i>
        <span>Announcements</span>
      </a>
      <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
          <a class="collapse-item" href="Announcement-Create.html">Create</a>
          <a class="collapse-item" href="Announcement-Edit.html">Edit</a>
        </div>
      </div>
    </li>

    <li class="nav-item">
      <a class="nav-link" href="Letter-Tracker.html">
        <i class="fas fa-paper-plane"></i>
        <span>Letter Tracker</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Calendar.html">
          <i class="fas fa-calendar-alt"></i>
          <span>Calendar</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Notes.html">
            <i class="fas fa-sticky-note"></i>
            <span>Notes</span></a>
          </li>
        </ul>
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
                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Angela Enriquez</span>
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
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
            <div class="col">
              <input id="inputAnnouncementName" type="text" class="announcement_title_textarea" data-toggle="tooltip" title="Announcement Title" placeholder="Enter Announcement Title">
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
                <textarea id="inputAnnouncement" class="announcement_textarea" data-toggle="tooltip" title="Announcement Information" placeholder="Enter Announcement Information here"></textarea>
            </div>
          </div>
          <div class="row">
            <div class="col">
              <input id="inputAnnouncementRemarks" type="text" class="announcement_title_textarea" data-toggle="tooltip" title="Remarks" placeholder="Remarks">
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
            </div>
          <div class="container" style="float: right;">
            <button style="float:right; border-radius: 1px; background-color: #F8C471; margin-left: 3px; margin-bottom: 2px">CANCEL</button>
            <button id="btnAddAnnouncement" style="float:right; border-radius: 1px; background-color: #7DCEA0; margin-bottom: 3px;">ADD</button>
          </div>
          <div class="container">
          <table id="dtBasicExample" class="table table-bordered" cellspacing="0" width="100%" style="font-size: 0.8em; background-color: white;">
            <thead style="background-color: black; color: white;">
              <tr>
                <th class="th-sm" style="text-align: center; vertical-align: middle; width: 50px">No.</th>
                <th class="th-sm" style="text-align: center; vertical-align: middle;">Announcement Title</th>
                <th class="th-sm" style="text-align: center; vertical-align: middle;">Announcement Information</th>
                <th class="th-sm" style="text-align: center; vertical-align: middle;">Date</th>
              </tr>
            </thead>
            <tbody style="color: black;">
              <tr>
                <td>1</td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td>2</td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td>3</td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td>4</td>
                <td></td>
                <td></td>
                <td></td>
              </tr>
              <tr>
                <td>5</td>
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

</body>

</html>
