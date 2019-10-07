$(document).ready(function () {

    $(document).on('click', '#btnAddNote', function (e) {
       // e.preventDefault();
        alert("haha");
        $("#formNote").valid();
        alert("haha");
         
    });
    
    $("#formNote").validate({
        rules:{
            inputNoteTitle : {
                required: true
            },
            inputNote : {
                required: true
            }
        },
        submitHandler: function (form) {
            var request = {
                noteTitle: $("#inputNoteTitle").val(),
                note: $("#inputNote").val(),
                noteId: $("#btnAddNote").data('id')
            };


            $.ajax({
                url: "addNote",
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



