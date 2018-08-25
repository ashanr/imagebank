// ************************** SUBJECT MANAGEMENT ********************************** //

function subject_save() {
//   @Ashan
    var subject_name = $('#subject_name').val();
    var subject_code = $('#subject_code').val();
    if (subject_name.length !== 0) {
        $.post("views/commenSettingView.php", {action: 'subject_save', subject_name: subject_name, subject_code: subject_code}, function (e) {
            alertifyMsgDisplay(e, 2000);
            load_subject_table();
            reset_subject();
        }, "json");
    } else {
        alertify.error("Enter valid Subject Name", 2500)
    }
}

function subject_update(subject_id) {

    var subject_name = $('#subject_name').val();
    var subject_code = $('#subject_code').val();
    var form_data = {
        subject_id: subject_id,
        subject_name: $('#subject_name').val(),
        subject_code: $('#subject_code').val()
    };
    if (subject_code.length !== 0 && subject_name.length !== 0) {
        $.post('views/commenSettingView.php', {action: 'subject_update', form_data: form_data}, function (e) {
            alertifyMsgDisplay(e, 2000);
            load_subject_table();
            reset_subject();

        }, 'json');
    } else {
        alertify.error("Enter valid Data", 2500)
    }
}

function subject_delete(subject_id) {
//   @Ashan
    if (subject_id.length !== 0) {
        $.post("views/commenSettingView.php", {action: 'delete_subject', subject_id: subject_id}, function (e) {
            alertifyMsgDisplay(e, 2000);
            load_subject_table();
            reset_subject();
        }, "json");
    } else {
        alertify.error("Enter valid Subject Name", 2500)
    }
}

function reset_subject() {
    $('#subject_name').val("");
    $('#subject_code').val("");
    show_save_btn();
}


function select_subject(subject_id) {
//@Ashan 
    if (parseInt(subject_id) !== 0) {
        $.post("views/commenSettingView.php", {action: 'subject_select', subject_id: subject_id}, function (e) {
            if (e === undefined || e.length === 0 || e === null) {
                alertify.error("No Data Found", 1000);
            } else {
                show_update_btn();
                $.each(e, function (index, qData) {
                    $('#subject_update_btn').val(qData.subject_id);
                    $('#subject_id').val(qData.subject_id);
                    $('#subject_name').val(qData.subject_name);
                    $('#subject_code').val(qData.subject_code);
                });
            }
        }, "json");
    } else {
        alertify.error("Invalid Sub category selection", 1000);
    }
}


function show_update_btn() {

    if (!$('#subject_save_btn').hasClass('hidden')) {
        $('#subject_save_btn').addClass('hidden');
    }
    if ($('#subject_update_btn').hasClass('hidden')) {
        $('#subject_update_btn').removeClass('hidden');
    }
}

function show_save_btn() {

    if ($('#subject_save_btn').hasClass('hidden')) {
        $('#subject_save_btn').removeClass('hidden');
    }
    if (!$('#subject_update_btn').hasClass('hidden')) {
        $('#subject_update_btn').addClass('hidden');
    }

}