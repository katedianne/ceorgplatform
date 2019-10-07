$(document).ready(function () {
    $("#inputDateStart").datepicker({
        dateFormat: 'yy-mm-dd',
        minDate: 0 
    });
    
    $("#inputDateEnd").datepicker({
        dateFormat: 'yy-mm-dd',
        minDate: 0 
    });



    $(document).on('click', '#btnAddCalendar', function (e) {
       // e.preventDefault();
         $("#formCalendar").valid();

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
