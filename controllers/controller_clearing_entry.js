function load_clearing_info(vh_id, callBack) {
    if (parseInt(vh_id) !== '') {
        $.post("models/vehicle_clearing.php", {action: 'load_clearing_info', vh_id: vh_id}, function(e) {
            if (e === undefined || e.length === 0 || e === null) {
                // alertify.error("No Data Found", 1000);
            } else {
                $.each(e, function(index, qData) {
                    // $('#vh_id').val(qData.vh_id);
                    $('#vh_code').val(qData.vh_code);
                    $('#shipped_date').val(qData.shipped_date);
                    $('#driver_name').val(qData.driver_name);
                    $('#vessel').val(qData.vessel);
                    $('#refund').val(qData.refunds);
                    $('#arrival_date').val(qData.arrival_date);
                    $('#document_status').val(qData.document_status);
                    $('#clearing_status').val(qData.clr_status);
                    $('#to_clearing_agent').val(qData.to_clr_agent);
                    $('#duty').val(qData.duty);
                    $('#clearing_date').val(qData.clr_date);
                    $('#carrier_by').val(qData.transporter_name);
                    $('#lc_no').val(qData.lc_no);

                    // $('#shipped_date').attr('disabled', 'disabled');
                    // $('#arrival_date').attr('disabled', 'disabled');
                });
                chosenRefresh();
                //show_ct_btn();
                if (callBack !== undefined) {
                    if (typeof callBack === 'function') {

                        callBack();
                    }
                }
            }
        }, "json");
    } else {
        alertify.error("Invalid selection", 1000);
    }
}



function save_clearing_list() {
//@Ashan
    var vh_id = $('#vh_id').val();
    var shipped_date = $('#shipped_date').val();
    var driver_name = $('#driver_name').val();
    var vessel = $('#vessel').val();
    var refund = $('#refund').val();
    var clearing_status = $('#clearing_status').val();
    var arrival_date = $('#arrival_date').val();
    var document_status = $('#document_status').val();
    var to_clearing_agent = $('#to_clearing_agent').val();
    var duty = $('#duty').val();
    var clearing_date = $('#clearing_date').val();
    var carrier_by = $('#carrier_by').val();
    var lc_no = $('#lc_no').val();
    if (vh_id.length !== 0) {
        var data_array = {
            vh_id: vh_id,
            shipped_date: shipped_date,
            driver_name: driver_name,
            vessel: vessel,
            refund: refund,
            clearing_status: clearing_status,
            arrival_date: arrival_date,
            document_status: document_status,
            to_clearing_agent: to_clearing_agent,
            duty: duty,
            clearing_date: clearing_date,
            carrier_by: carrier_by,
            lc_no: lc_no,
            vh_code:$('#vh_code').val()
        }

        $.post("models/vehicle_clearing.php", {action: 'save_clr_entry', form_data: data_array}, function(reply) {
            alertifyMsgDisplay(reply, 2000, function() {
                clear_clr_entry_form();
                clear_vhList();
                sendClear_selectedVh();
            });
        }, 'json');
    } else {
        alertify.error("Enter Data To Add", 2500);
    }
}


function update_clear_entry() {

    //@AShan
    var vh_id = $('#vh_id').val();
    var shipped_date = $('#shipped_date').val();
    var driver_name = $('#driver_name').val();
    var vessel = $('#vessel').val();
    var refund = $('#refund').val();
    var clearing_status = $('#clearing_status').val();
    var arrival_date = $('#arrival_date').val();
    var document_status = $('#document_status').val();
    var to_clearing_agent = $('#to_clearing_agent').val();
    var duty = $('#duty').val();
    var clearing_date = $('#clearing_date').val();
    var carrier_by = $('#carrier_by').val();
    var lc_no = $('#lc_no').val();


//    if (isNaN(parseFloat(ag_paid)) || isNaN(parseFloat(ag_paid)) || parseFloat(ag_paid <= 0) || parseFloat(ag_paid <= 0)) {
//        alertify.error("Enter a valid charge or paid amounts!", 4000);
//        return;
//    }
    if (vh_id.length !== 0) {
        var data_array = {
            vh_id: vh_id,
            shipped_date: shipped_date,
            driver_name: driver_name,
            vessel: vessel,
            refund: refund,
            clearing_status: clearing_status,
            arrival_date: arrival_date,
            document_status: document_status,
            to_clearing_agent: to_clearing_agent,
            duty: duty,
            clearing_date: clearing_date,
            carrier_by: carrier_by,
            lc_no: lc_no
        }

        $.post("models/model_vehicle_clearing.php", {action: 'update_clearing_entry', form_data: data_array}, function(reply) {
            alertifyMsgDisplay(reply, 2000, function() {

                clear_clearing_entry_form();
                setTimeout(function() {
                    window.location = 'view_clearing_list.php';
                }, 3000);

            });
        }, 'json');
    } else {
        alertify.error("Enter Data To Add", 2500);
    }
}

function update_clearing() {
    ////Update clearing balance form
    //@AShan
    var vh_id = $('#vh_id').val();
    var shipped_date = $('#shipped_date').val();
    var driver_name = $('#driver_name').val();
    var vessel = $('#vessel').val();
    var refund = $('#refund').val();
    var clearing_status = $('#clearing_status').val();
    var arrival_date = $('#arrival_date').val();
    var document_status = $('#document_status').val();
    var to_clearing_agent = $('#to_clearing_agent').val();
    var duty = $('#duty').val();
    var clearing_date = $('#clearing_date').val();
    var carrier_by = $('#carrier_by').val();
    var lc_no = $('#lc_no').val();
    alert(clearing_date);

//    if (isNaN(parseFloat(ag_paid)) || isNaN(parseFloat(ag_paid)) || parseFloat(ag_paid <= 0) || parseFloat(ag_paid <= 0)) {
//        alertify.error("Enter a valid charge or paid amounts!", 4000);
//        return;
//    }
    if (vh_id.length !== 0) {
        var data_array = {
            vh_id: vh_id,
            shipped_date: shipped_date,
            driver_name: driver_name,
            vessel: vessel,
            refund: refund,
            clearing_status: clearing_status,
            arrival_date: arrival_date,
            document_status: document_status,
            to_clearing_agent: to_clearing_agent,
            duty: duty,
            clearing_date: clearing_date,
            carrier_by: carrier_by,
            lc_no: lc_no
        }

        $.post("models/model_vehicle_clearing.php", {action: 'update_clrBalance_entry', form_data: data_array}, function(reply) {
            alertifyMsgDisplay(reply, 2000, function() {
                $('#btn_clearing_balance_add').removeClass('hidden');
                $('#btn_clearing_balance_update').addClass('hidden');
                $('#btn_clearing_balance_reset').removeClass('hidden');

                clear_clearing_entry_form();
                load_clearBalance();
            });
        }, 'json');
    } else {
        alertify.error("Enter Data To Add", 2500);
    }
}


function clear_clearing_entry_form() {
//@AShan
    $('#vh_id').val('');
    $('#shipped_date').val('');
    $('#driver_name').val('');
    $('#vessel').val('');
    $('#refund').val('');
    $('#clearing_status').val('');
    $('#arrival_date').val('');
    $('#document_status').val('');
    $('#to_clearing_agent').val('');
    $('#duty').val('');
    $('#clearing_date').val('');
    $('#carrier_by').val('');
    $('#lc_no').val('');

    hide_supp_btn();
}

function show_clearing_add_btn() {
    if ($('#btn_clearing_add').hasClass('hidden')) {
        $('#btn_clearing_add').removeClass('hidden');
        $('#btn_clearing_reset').removeClass('hidden');
    }
    if (!$('#btn_update').hasClass('hidden')) {
        $('#btn_update').addClass('hidden');
    }
}

function show_clearing_update_btn() {
    if ($('#btn_update').hasClass('hidden')) {
        $('#btn_update').removeClass('hidden');
    }

    if (!$('#btn_clearing_add').hasClass('hidden')) {
        $('#btn_clearing_add').addClass('hidden');
        //  $('#btn_clearing_reset').addClass('hidden');
    }
}


function   clear_vhList() {

    var idList = $('#vh_id_list').val();
    alert(idList);
}