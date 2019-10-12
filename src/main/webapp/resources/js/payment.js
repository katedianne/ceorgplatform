$(document).ready(function () {
                
   

   $(document).on('click', '.btnEditPayment', function (e) {
        var str = $(this).data("id");

       $("#inputPaymentOrg").val($(this).data('org'));  //get room id from datatable

        $("#inputPaymentBalance").val($(this).parent().siblings()[2].innerHTML); //get event name from datatable

        $("#inputPaymentPN").val($(this).parent().siblings()[3].innerHTML);  //get date from datatable

        $("#inputPaymentRemarks").val($(this).parent().siblings()[4].innerHTML);  //get time start from datatable

        $("#btnAddPayment").data('id', str); 
    });

    $(document).on('click', '#btnAddPayment', function (e) {
     
        $("#formPayment").valid();
       
    
    });
    
    $(document).on('click', '#btnCancelPayment', function (e) {
        e.preventDefault();
        
        $("#btnAddLetter").data('id', 0);
        $("#inputLetterType").val('');
        $("#inputLetterName").val('');
        $("#inputDateReleased").val('');
        $("#inputRemarks").val('');
     
    });
    
    var table = $("#tablePayment").DataTable({
        "bJQueryUI": true,
        "deferRender": true,
        "ajax": {
            "url": "getPayment",
            "dataSrc": ""
        },
        "columns": [
            {"data": "paymentId",
                "render": function (data, type, row) {
                    if (currentRoleId === 4) { //check if current user has user role only
                        return "<button class=\"btnEditPayment\"  data-id=\"" + data + "\" data-org=\"" + row.orgId + "\"><i class=\"far fa-edit\"></i></button>" +
                                "<button class=\"btnDeletePayment\"  data-id=\"" + data + "\"><i class=\"far fa-trash-alt\"></i></button>";
                    }
                    else {
                       return "<button class=\"btnEditPayment\"  data-id=\"" + data + "\" data-org=\"" + row.orgId + "\"><i class=\"far fa-edit\"></i></button>" +
                                "<button class=\"btnDeletePayment\"  data-id=\"" + data + "\"><i class=\"far fa-trash-alt\"></i></button>";
                                
                    }
                }
            },
            {"data": "paymentBalance"},
            {"data": "principalAmount"},
            {"data": "paymentName"},
            {"data": "remarks"}
        ],
        "columnDefs": [
            {
                targets: 0,
                className: 'text-center'
            }
        ]
        
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
    
    $("#formPayment").validate({
        rules:{
            inputPaymentFullName : {
                required: true
            },
            inputPaymentBalance : {
                required: true 
            },
            inputPaymentPN : {
                required: true
            },
            inputPaymentRemarks : {
                required: true
            }
        },
        submitHandler: function (form) {
            var request = {
                orgId: $("#inputPaymentOrg").val(),
                paymentBalance: parseInt($("#inputPaymentBalance").val()),
                paymentName: $("#inputPaymentPN").val(),
                remarks: $("#inputPaymentRemarks").val(),
                paymentId: $("#btnAddPayment").data('id')
            };


            $.ajax({
                url: "addPayment",
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
    
    
    
    $(document).on('click', '.btnDeletePayment', function (e) {
        var request = {
                        paymentId: $(this).data('id')
                    };
        $("#dialogDeletePayment").data("request", request);

        dialogDeletePayment.dialog( "open" );
        
    });
    
    var dialogDeletePayment = $( "#dialogDeletePayment" ).dialog({
                autoOpen: false,
                resizable: false,
                height: 250,
                width: 400,
                modal: true,
                buttons: {
                  "Yes": function(){
                    
                    var request = $("#dialogDeletePayment").data("request");
                    
                    $.ajax({
                        url: "deletePayment",
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
                      
                    dialogDeletePayment.dialog( "close" );

                  },
                  
                  "Cancel": function() {
                    dialogDeletePayment.dialog( "close" );
                  }
                },
                close: function() {
                  //form[ 0 ].reset();
                  dialogDeletePayment.dialog( "close" );
                }
            });
});
