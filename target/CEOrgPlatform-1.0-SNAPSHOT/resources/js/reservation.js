
$(document).ready(function () {
    
     $("#inputResDate").datepicker({
        dateFormat: 'yy-mm-dd'
    });

    $("#inputResTimeStart").timepicker({
        timeFormat: 'HH:mm:ss'
    });

    $("#inputResTimeEnd").timepicker({
        timeFormat: 'HH:mm:ss'
    });
    
    $(document).on('click', '#btnAddReservation', function (e) {
        e.preventDefault();
        
        var request = {
            scheduledStartTime: $("#inputResTimeStart").val(),
            scheduledEndTime: $("#inputResTimeEnd").val(),
            eventRoomId: $("#selectResLocation").val(),
            eventName: $("#inputResEvent").val(),
            remarks: $("#inputResRemarks").val(),
            dateRequested: $("#inputResDate").val(),
            reservationId: $("#btnAddReservation").attr('data-id')
        };


        $.ajax({
            url: "addReservation",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(request), //Stringified Json Object
            dataType: 'json',
            success: function (response) {

                if (response.userId > 0) {
                    alert("added to database");
                    table.ajax.reload();
                }
           
            }
        });

    });

    $(document).on('click', '.btnEditReservation', function (e) {
        var str = $(this).data("id");

        var text = $(this).parent().siblings()[0].innerHTML;

        $("#selectResLocation option").each(function () {
            if ($(this).text() == text) {
                $(this).attr('selected', 'selected');
            }
        });

        $("#inputResEvent").val($(this).parent().siblings()[1].innerHTML);

        $("#inputResDate").val($(this).parent().siblings()[2].innerHTML);

        $("#inputResTimeStart").val($(this).parent().siblings()[3].innerHTML);

        $("#inputResTimeEnd").val($(this).parent().siblings()[4].innerHTML);

        $("#inputResRemarks").val($(this).parent().siblings()[5].innerHTML);

        $("#btnAddReservation").attr('data-id', str);
    });


    

    $(document).on('click', '.btnDeleteReservation', function (e) {
        var request = {
                        reservationId: $(this).data('id')
                    };
        $("#dialogDeleteReservation").data("request", request);

        dialogDeleteReservation.dialog( "open" );
        
    });
    
     $(document).on('click', '.btnConfirmReservation', function (e) {
     
        var request = {
            reservationId: $(this).data('id'),
            scheduledStartTime: $("#inputResTimeStart").val(),
            scheduledEndTime: $("#inputResTimeEnd").val(),
            eventRoomId: $("#selectResLocation").val(),
            dateRequested: $("#inputResDate").val()
            
        };
        
        $("#dialogConfirmReservation").data("request", request);

        dialogConfirmReservation.dialog( "open" );

        

    });
    
    $(document).on('click', '#btnCancelReservation', function (e) {
        
        
        $("#btnAddReservation").attr('data-id', 0);
        $("#inputResTimeStart").val('');
        $("#inputResTimeEnd").val('');
        $("#selectResLocation").val('');
        $("#inputResEvent").val('');
        $("#inputResRemarks").val('');
        $("#inputResDate").val('');
    });

    var table = $("#tableReservation").DataTable({
        "bJQueryUI": true,
        "deferRender": true,
        "ajax": {
            "url": "getReservation",
            "dataSrc": ""
        },
        "columns": [
            {"data": "reservationId",
                "render": function (data, type, row) {
                    return "<button class=\"btnEditReservation\"  data-id=\"" + data + "\"><i class=\"far fa-edit\"></i></button>" +
                            "<button class=\"btnDeleteReservation\"  data-id=\"" + data + "\"><i class=\"far fa-trash-alt\"></i></button>" +
                            "<button class=\"btnConfirmReservation\"  data-id=\"" + data + "\"><i class=\"far fa-check-circle\"></i></button>";
                }
            },
            {"data": "eventRooms.eventRoomName"},
            {"data": "eventName"},
            {"data": "dateRequested"},
            {"data": "scheduledStartTime"},
            {"data": "scheduledEndTime"},
            {"data": "remarks"},
            {"data": "status"}
        ]


    });
    
    var dialogDeleteReservation = $( "#dialogDeleteReservation" ).dialog({
                autoOpen: false,
                height: 200,
                width: 350,
                modal: true,
                buttons: {
                  "Yes": function(){
                    
                    var request = $("#dialogDeleteReservation").data("request");
                    
                    $.ajax({
                        url: "deleteReservation",
                        type: "POST",
                        contentType: "application/json",
                        data: JSON.stringify(request), //Stringified Json Object
                        dataType: 'json',
                        success: function (response) {

                            if (response.userId > 0) {
                                alert("deleted to database");
                                table.ajax.reload();
                            }
                        }
                    });
                      
                    dialogDeleteReservation.dialog( "close" );

                  },
                  
                  "Cancel": function() {
                    dialogDeleteReservation.dialog( "close" );
                  }
                },
                close: function() {
                  //form[ 0 ].reset();
                  dialogDeleteReservation.dialog( "close" );
                }
            });
                
    var dialogConfirmReservation = $( "#dialogConfirmReservation" ).dialog({
                autoOpen: false,
                height: 200,
                width: 350,
                modal: true,
                buttons: {
                  "Yes": function(){
             
                    var request = $("#dialogConfirmReservation").data("request");
                    
                    $.ajax({
                      url: "confirmReservation",
                      type: "POST",
                      contentType: "application/json",
                      data: JSON.stringify(request), //Stringified Json Object
                      dataType: 'json',
                      success: function (response) {

                          if (response.userId > 0) {
                              alert("reserve to database");
                              table.ajax.reload();
                          }
                      }
                });

                dialogConfirmReservation.dialog("close");

                  },
                  "Cancel": function() {
                    dialogConfirmReservation.dialog( "close" );
                  }
                },
                close: function() {
                  //form[ 0 ].reset();
                   dialogConfirmReservation.dialog( "close" );
                }
            });

//    $("#formReservation").validate({
//        rules:{
//            selectResLocation : {
//                required: true
//            },
//            inputResEvent : {
//                required: true
//            },
//            inputResDate : {
//                required: true, 
//                date : true
//                
//            },
//            inputResTimeStart : {
//                required: true
//            },
//            inputResTimeEnd : {
//                required : true
//            },
//            inputResRemarks : {
//                required : true
//            }
//            
//        },
//        errorElement: "em",
//        errorPlacement: function (error, element) {
//            // Add the `help-block` class to the error element
//            error.addClass("help-block");
//            error.insertAfter(element);
//
//        },
//        highlight: function (element, errorClass, validClass) {
//            $(element).parents(".col-md-2").addClass("has-error").removeClass("has-success");
//        },
//        unhighlight: function (element, errorClass, validClass) {
//            $(element).parents(".col-md-2").addClass("has-success").removeClass("has-error");
//        }
//        
//    });
            
     
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


