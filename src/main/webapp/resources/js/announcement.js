$(document).ready(function () {

    $('#inputRecipient').selectpicker();

    $("#btnAddAnnouncement").click(function () {
         $("#formAnnouncement").valid();
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

        dialogDeleteAnnouncement.dialog("open");

    });

    var dialogDeleteAnnouncement = $("#dialogDeleteAnnouncement").dialog({
        autoOpen: false,
        resizable: false,
        height: 250,
        width: 400,
        modal: true,
        buttons: {
            "Yes": function () {

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

                dialogDeleteAnnouncement.dialog("close");

            },
            "Cancel": function () {
                dialogDeleteAnnouncement.dialog("close");
            }
        },
        close: function () {
            //form[ 0 ].reset();
            dialogDeleteAnnouncement.dialog("close");
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


    $("#formAnnouncement").validate({
        rules: {
            inputAnnouncementName: {
                required: true
            },
            inputRecipient: {
                required: true
            },
            inputAnnouncement : {
                required: true
            }
        },
        submitHandler: function (form) {
            var recipient = [];
            
            for (var i = 0; i < $('#inputRecipient').val().length; i++) {
                recipient.push({
                    announcedTo: parseInt($('#inputRecipient').val()[i])
                });
            }
            
            var request = {
                announcementName: $("#inputAnnouncementName").val(),
                announcement: $("#inputAnnouncement").val(),
                recipient : recipient
            };


            $.ajax({
                url: "addAnnouncement",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(request), //Stringified Json Object
                dataType: 'json',
                success: function (response) {
                    alert(response.userId);
                    if (response.userId > 0)
                        alert("added to database");
                    table.ajax.reload();
                }
            });
            return false;
        }

    });

});