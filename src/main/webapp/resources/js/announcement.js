$(document).ready(function () {

    $('#inputRecipient').selectpicker();

    $("#btnAddAnnouncement").click(function () {
        alert("dfsd");
        var request = {
            announcementName: $("#inputAnnouncementName").val(),
            announcement: $("#inputAnnouncement").val()
        };

        var recipient = [];
        for (var i = 0; i < $('#inputRecipient').val().length; i++) {
            recipient.push({
                announcedTo: parseInt($('#inputRecipient').val()[i])
            });
        }

        request['recipient'] = recipient;


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

    var table = $("#tableAnnouncement").DataTable({
        "bJQueryUI": true,
        "deferRender": true,
        "ajax": {
            "url": "getAnnouncement",
            "dataSrc": ""
        },
        "columns": [
            {"data": "announcementId",
                "render": function (data, type, row) {
                    if (currentRoleId === 4) { //check if current user has user role only
                        return "<button class=\"btnViewAnnouncement\"  data-id=\"" + data + "\"><i class=\"far fas fa-eye\"></i></button>" +
                                "<button class=\"btnDeleteAnnouncement\"  data-id=\"" + data + "\"><i class=\"far fa-trash-alt\"></i></button>";
                    }
                    else {
                        return "<button class=\"btnViewAnnouncement\"  data-id=\"" + data + "\"><i class=\"far fas fa-eye\"></i></button>" +
                                "<button class=\"btnDeleteAnnouncement\"  data-id=\"" + data + "\"><i class=\"far fa-trash-alt\"></i></button>"
                                
                    }
                }
            },
            {"data": "dateCreated"},
            {"data": "announcementName"},
            {"data": "announcement"},
            {"data": "createdByName"}
        ],
        "columnDefs": [
            {
                targets: 0,
                className: 'text-center'
            }
        ]
        
    });
    
    $(document).on('click', '.btnDeleteAnnouncement', function (e) {
        var request = {
                        announcementId: $(this).data('id')
                    };
        $("#dialogDeleteAnnouncement").data("request", request);

        dialogDeleteAnnouncement.dialog( "open" );
        
    });
    
     var dialogDeleteAnnouncement = $( "#dialogDeleteAnnouncement" ).dialog({
                autoOpen: false,
                resizable: false,
                height: 250,
                width: 400,
                modal: true,
                buttons: {
                  "Yes": function(){
                    
                    var request = $("#dialogDeleteAnnouncement").data("request");
                    
                    $.ajax({
                        url: "deleteAnnouncement",
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
                      
                    dialogDeleteAnnouncement.dialog( "close" );

                  },
                  
                  "Cancel": function() {
                    dialogDeleteAnnouncement.dialog( "close" );
                  }
                },
                close: function() {
                  //form[ 0 ].reset();
                  dialogDeleteAnnouncement.dialog( "close" );
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