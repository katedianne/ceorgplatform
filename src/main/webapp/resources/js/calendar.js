$(document).ready(function () {
    $("#inputDateStart").datepicker({
        dateFormat: 'yy-mm-dd',
        minDate: 0 
    });
    
    $("#inputDateEnd").datepicker({
        dateFormat: 'yy-mm-dd',
        minDate: 0 
    });

    $(document).on('click', '.btnEditCalendar', function (e) {
        var str = $(this).data("id");

        $("#inputEvent").val($(this).parent().siblings()[0].innerHTML);  //get room id from datatable

        $("#inputDateStart").val($(this).parent().siblings()[1].innerHTML); //get event name from datatable

        $("#inputDateEnd").val($(this).parent().siblings()[2].innerHTML);  //get date from datatable

        $("#inputDescription").val($(this).parent().siblings()[3].innerHTML);  //get time start from datatable

        $("#btnAddCalendar").data('id', str); 
    });

    $(document).on('click', '#btnAddCalendar', function (e) {
       // e.preventDefault();
         $("#formCalendar").valid();

    });
    
    var table = $("#tableCalendar").DataTable({
        "bJQueryUI": true,
        "deferRender": true,
        "ajax": {
            "url": "getCalendar",
            "dataSrc": ""
        },
        "columns": [
            {"data": "activityId",
                "render": function (data, type, row) {
                    if (currentRoleId === 4) { //check if current user has user role only
                        return "<button class=\"btnEditCalendar\"  data-id=\"" + data + "\"><i class=\"far fa-edit\"></i></button>" +
                                "<button class=\"btnDeleteCalendar\"  data-id=\"" + data + "\"><i class=\"far fa-trash-alt\"></i></button>";
                    }
                    else {
                        return "<button class=\"btnEditCalendar\"  data-id=\"" + data + "\"><i class=\"far fa-edit\"></i></button>" +
                                "<button class=\"btnDeleteCalendar\"  data-id=\"" + data + "\"><i class=\"far fa-trash-alt\"></i></button>"
                                
                    }
                }
            },
            {"data": "activityName"},
            {"data": "activityStartDate"},
            {"data": "activityEndDate"},
            {"data": "description"}
        ],
        "columnDefs": [
            {
                targets: 0,
                className: 'text-center'
            }
        ]
        
    });
    
    $(document).on('click', '.btnDeleteCalendar', function (e) {
        var request = {
                        activityId: $(this).data('id')
                    };
        $("#dialogDeleteActivity").data("request", request);

        dialogDeleteActivity.dialog( "open" );
        
    });
    
    var dialogDeleteActivity = $( "#dialogDeleteActivity" ).dialog({
                autoOpen: false,
                resizable: false,
                height: 250,
                width: 400,
                modal: true,
                buttons: {
                  "Yes": function(){
                    
                    var request = $("#dialogDeleteActivity").data("request");
                    
                    $.ajax({
                        url: "deleteActivity",
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
                      
                    dialogDeleteActivity.dialog( "close" );

                  },
                  
                  "Cancel": function() {
                    dialogDeleteActivity.dialog( "close" );
                  }
                },
                close: function() {
                  //form[ 0 ].reset();
                  dialogDeleteActivity.dialog( "close" );
                }
            });
    
    $("#formCalendar").validate({
        rules:{
            inputEvent : {
                required: true
            },
            inputDateStart : {
                required: true, 
                date : true
            },
            inputDateEnd : {
                required: true, 
                date : true
            },
            inputDescription : {
                required: true
            }
        },
        submitHandler: function (form) {
            var request = {
                activityName: $("#inputEvent").val(),
                activityStartDate: $("#inputDateStart").val(),
                activityEndDate: $("#inputDateEnd").val(),
                description: $("#inputDescription").val(),
                activityId: $("#btnAddCalendar").data('id')
            };


            $.ajax({
                url: "addCalendar",
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
                        alert("There is a conflict in your request.");
                    }

                }
            });
            return false;
        }

    });
    
    

});
