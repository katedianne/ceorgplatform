$(document).ready(function () {
                
    $("#inputDateReleased").datepicker({
        dateFormat: 'yy-mm-dd'
    });

   $(document).on('click', '.btnEditLetter', function (e) {
        var str = $(this).data("id");

        $("#inputLetterType").val($(this).parent().siblings()[1].innerHTML);  //get room id from datatable

        $("#inputLetterName").val($(this).parent().siblings()[2].innerHTML); //get event name from datatable

        $("#inputDateReleased").val($(this).parent().siblings()[3].innerHTML);  //get date from datatable

        $("#inputRemarks").val($(this).parent().siblings()[4].innerHTML);  //get time start from datatable

        $("#btnAddLetter").data('id', str); 
    });

    $(document).on('click', '#btnAddLetter', function (e) {
     
        $("#formLetter").valid();
       
    
    });
    
    var table = $("#tableLetter").DataTable({
        "bJQueryUI": true,
        "deferRender": true,
        "ajax": {
            "url": "getLetter",
            "dataSrc": ""
        },
        "columns": [
            {"data": "letterId",
                "render": function (data, type, row) {
                    if (currentRoleId === 4) { //check if current user has user role only
                        return "<button class=\"btnEditLetter\"  data-id=\"" + data + "\"><i class=\"far fa-edit\"></i></button>" +
                                "<button class=\"btnDeleteLetter\"  data-id=\"" + data + "\"><i class=\"far fa-trash-alt\"></i></button>";
                    }
                    else {
                        return "<button class=\"btnEditLetter\"  data-id=\"" + data + "\"><i class=\"far fa-edit\"></i></button>" +
                                "<button class=\"btnDeleteLetter\"  data-id=\"" + data + "\"><i class=\"far fa-trash-alt\"></i></button>"
                                
                    }
                }
            },
            {"data": "controlNumber"},
            {"data": "letterTypeName"},
            {"data": "letterName"},
            {"data": "dateReleased"},
            {"data": "remarks"}
        ],
        "columnDefs": [
            {
                targets: 0,
                className: 'text-center'
            }
        ]
        
    });
    
    $("#formLetter").validate({
        rules:{
            inputLetterName : {
                required: true
            },
            inputLetterType : {
                required: true, 
            },
            inputDateReleased : {
                required: true, 
                date : true
            },
            inputRemarks : {
                required: true
            }
        },
        submitHandler: function (form) {
            var request = {
                letterName: $("#inputLetterName").val(),
                letterTypeId: parseInt($("#inputLetterType").val()),
                dateReleased: $("#inputDateReleased").val(),
                remarks: $("#inputRemarks").val(),
                letterId: $("#btnAddLetter").data('id')
            };


            $.ajax({
                url: "addLetter",
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
    
    
    
    $(document).on('click', '.btnDeleteLetter', function (e) {
        var request = {
                        letterId: $(this).data('id')
                    };
        $("#dialogDeleteLetter").data("request", request);

        dialogDeleteLetter.dialog( "open" );
        
    });
    
    var dialogDeleteLetter = $( "#dialogDeleteLetter" ).dialog({
                autoOpen: false,
                resizable: false,
                height: 250,
                width: 400,
                modal: true,
                buttons: {
                  "Yes": function(){
                    
                    var request = $("#dialogDeleteLetter").data("request");
                    
                    $.ajax({
                        url: "deleteLetter",
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
                      
                    dialogDeleteLetter.dialog( "close" );

                  },
                  
                  "Cancel": function() {
                    dialogDeleteLetter.dialog( "close" );
                  }
                },
                close: function() {
                  //form[ 0 ].reset();
                  dialogDeleteLetter.dialog( "close" );
                }
            });
});
