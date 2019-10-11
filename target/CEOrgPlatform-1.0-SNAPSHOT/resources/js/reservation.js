
$(document).ready(function () {
 
    $("#inputResDate").datepicker({
        dateFormat: 'yy-mm-dd',
        minDate: 0 
    });

    $("#inputResTimeStart").timepicker({
        timeFormat: 'HH:mm:ss',
        interval: 30,
        minTime: '7:30am',
        maxTime: '9:00pm',
        change: function (time) {
            $("#inputResTimeEnd").prop('disabled', false);
            var minStartTime = $(this).timepicker().format(time);
            $("#inputResTimeEnd").timepicker({
                timeFormat: 'HH:mm:ss',
                interval: 30,
                minTime: minStartTime,
                maxTime: '9:00pm'

            });
        }
    });

    

    $(document).on('click', '#btnAddReservation', function (e) {
       // e.preventDefault();
         $("#formReservation").valid();

    });

    $(document).on('click', '.btnEditReservation', function (e) {
        var str = $(this).data("id");

        $("#selectResLocation").val($(this).data('room'));  //get room id from datatable

        $("#inputResEvent").val($(this).parent().siblings()[1].innerHTML); //get event name from datatable

        $("#inputResDate").val($(this).parent().siblings()[2].innerHTML);  //get date from datatable

        $("#inputResTimeStart").val($(this).parent().siblings()[3].innerHTML);  //get time start from datatable

        $("#inputResTimeEnd").val($(this).parent().siblings()[4].innerHTML);  //get time end from datatable

        $("#inputResRemarks").val($(this).parent().siblings()[5].innerHTML);  //get location from datatable

        $("#btnAddReservation").data('id', str); 
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
            scheduledStartTime: $(this).parent().siblings()[3].innerHTML,
            scheduledEndTime: $(this).parent().siblings()[4].innerHTML,
            eventRoomId: $(this).data('room'),
            dateRequested: $(this).parent().siblings()[2].innerHTML
            
        };
        
        $("#dialogConfirmReservation").data("request", request);

        dialogConfirmReservation.dialog( "open" );

        

    });
    
    $(document).on('click', '#btnCancelReservation', function (e) {
        e.preventDefault();
        
        $("#btnAddReservation").data('id', 0);
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
                    if (currentRoleId === 4) { //check if current user has user role only
                        return "<button class=\"btnEditReservation\"  data-id=\"" + data + "\" data-room=\"" + row.eventRoomId + "\"><i class=\"far fa-edit\"></i></button>" +
                                "<button class=\"btnDeleteReservation\"  data-id=\"" + data + "\"><i class=\"far fa-trash-alt\"></i></button>";
                    }
                    else {
                        return "<button class=\"btnEditReservation\"  data-id=\"" + data + "\" data-room=\"" + row.eventRoomId + "\"><i class=\"far fa-edit\"></i></button>" +
                                "<button class=\"btnDeleteReservation\"  data-id=\"" + data + "\"><i class=\"far fa-trash-alt\"></i></button>" +
                                "<button class=\"btnConfirmReservation\"  data-id=\"" + data + "\" data-room=\"" + row.eventRoomId + "\"><i class=\"far fa-check-circle\"></i></button>";
                    }
                }
            },
            {"data": "eventRooms.eventRoomName"},
            {"data": "eventName"},
            {"data": "dateRequested"},
            {"data": "scheduledStartTime"},
            {"data": "scheduledEndTime"},
            {"data": "remarks"},
            {"data": "status"},
            {"data": "eventRoomId"}
        ],
        "columnDefs": [
            {
                targets: 0,
                className: 'text-center'
            }
        ]
        
    });

    table.column( 8 ).visible( false );
    
    var dialogDeleteReservation = $( "#dialogDeleteReservation" ).dialog({
                autoOpen: false,
                resizable: false,
                height: 250,
                width: 400,
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
                resizable: false,
                height: 250,
                width: 400,
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
                              alert("reserved to database");
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
            
    $.validator.setDefaults({
        errorElement: "span",
        errorClass: "help-block",
        highlight: function (element) {
            $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
        },
        unhighlight: function (element) {
            $(element).closest('.form-group').removeClass('has-error').addClass('has-success');
        },
        errorPlacement: function (error, element) {
            if (element.parent('.input-group').length || element.prop('type') === 'checkbox' || element.prop('type') === 'radio') {
                error.insertAfter(element.parent());
            } else {
                error.insertAfter(element);     
            }
        }
    });      
  

    $("#formReservation").validate({
        rules:{
            selectResLocation : {
                required: true
            },
            inputResEvent : {
                required: true
            },
            inputResDate : {
                required: true, 
                date : true
               
            },
            inputResTimeStart : {
                required: true
            },
            inputResTimeEnd : {
                required : true
//                remote:
//                    {
//                      url: 'validateEmail.php',
//                      type: "post",
//                      data:
//                      {
//                          inputResTimeEnd : function()
//                          {
//                              return $('#register-form :input[name="email"]').val();
//                          }
//                      }
//                    }
            },
            inputResRemarks : {
                required : true
            }     
        },
        submitHandler: function (form) {
            var request = {
                scheduledStartTime: $("#inputResTimeStart").val(),
                scheduledEndTime: $("#inputResTimeEnd").val(),
                eventRoomId: $("#selectResLocation").val(),
                eventName: $("#inputResEvent").val(),
                remarks: $("#inputResRemarks").val(),
                dateRequested: $("#inputResDate").val(),
                reservationId: $("#btnAddReservation").data('id')
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
                    else {
                        alert("There is a conflict in your reservation request.");
                    }

                }
            });
            return false;
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


