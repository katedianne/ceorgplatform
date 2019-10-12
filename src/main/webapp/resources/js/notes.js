$(document).ready(function () {
    
    getNotes();

    $(document).on('click', '.btnEditNote', function (e) {
        var str = $(this).data("id");
   
        $("#inputNoteTitle").val($(this).parent().siblings().html()); //get event name from datatable

        $("#inputNote").val($(this).parents().eq(2).children('div.card-body').html());  //get date from datatable

        $("#btnAddNote").data('id', str);
    });

    $(document).on('click', '#btnAddNote', function (e) {

        $("#formNote").valid();
    });
    
    $(document).on('click', '#btnCancelNote', function (e) {
        $("#inputNoteTitle").val('');
        $("#inputNote").val('');
        $("#btnAddNote").data('id', 0);
    });
    
    $(document).on('click', '.btnDeleteNote', function (e) {
        var request = {
                        noteId: $(this).data('id')
                    };
        $("#dialogDeleteNote").data("request", request);

        dialogDeleteNote.dialog( "open" );
        
    });

    var dialogDeleteNote = $( "#dialogDeleteNote" ).dialog({
                autoOpen: false,
                resizable: false,
                height: 250,
                width: 400,
                modal: true,
                buttons: {
                  "Yes": function(){
                    
                    var request = $("#dialogDeleteNote").data("request");
                    
                    $.ajax({
                        url: "deleteNote",
                        type: "POST",
                        contentType: "application/json",
                        data: JSON.stringify(request), //Stringified Json Object
                        dataType: 'json',
                        success: function (response) {

                            if (response.userId > 0) {
                                alert("deleted to database");
                                getNotes();
                            }
                        }
                    });
                      
                    dialogDeleteNote.dialog( "close" );

                  },
                  
                  "Cancel": function() {
                    dialogDeleteNote.dialog( "close" );
                  }
                },
                close: function() {
                  dialogDeleteNote.dialog( "close" );
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

    $("#formNote").validate({
        rules: {
            inputNoteTitle: {
                required: true
            },
            inputNote: {
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
                        getNotes();
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

function getNotes(){
    
    $('#firstColNotesContainer').html('');
    $('#secondColNotesContainer').html('');
    
    $.ajax({
        url: "getNotes",
        type: "GET",
        contentType: "application/json",
        dataType: 'json',
        success: function (response) {

            $.each(response, function(key, val){
               if(key%2 == 0){
                   $('#firstColNotesContainer').append('<div class="card shadow mb-4">\n\
                                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between border-bottom-primary">\n\
                                                <h6 class="m-0 font-weight-bold ">' + val.noteTitle + '</h6>\n\
                                                <div class="dropdown no-arrow">\n\
                                                <a href="#" class="btnEditNote" data-id=\"' + val.noteId + '\">\n\
                                                <i class="fas fa-edit fa-sm fa-fw"></i></a>\n\
                                                <a href="#" class="btnDeleteNote" data-id=\"' + val.noteId + '\">\n\
                                                <i class="fas fa-trash-alt fa-sm fa-fw"></i></a>\n\
                                                </div></div><div class="card-body">' + val.note + '</div></div>'); 
               }
               else{
                   $('#secondColNotesContainer').append('<div class="card shadow mb-4">\n\
                                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between border-bottom-primary">\n\
                                                <h6 class="m-0 font-weight-bold ">' + val.noteTitle + '</h6>\n\
                                                <div class="dropdown no-arrow">\n\
                                                <a href="#" class="btnEditNote" data-id=\"' + val.noteId + '\">\n\
                                                <i class="fas fa-edit fa-sm fa-fw"></i></a>\n\
                                                <a href="#" class="btnDeleteNote" data-id=\"' + val.noteId + '\">\n\
                                                <i class="fas fa-trash-alt fa-sm fa-fw"></i></a>\n\
                                                </div></div><div class="card-body">' + val.note + '</div></div>'); 
               }
            });

        }
    });
}



