
function save_insurance_info() {
    var cnfrmation = parseInt($("input[type='radio'][name='confirmation']:checked").val());
    var pay_status = parseInt($("input[type='radio'][name='paym_status']:checked").val());
    var vhid = $('#vh_id').val()
    if (vhid == '') {
        alertify.error('cannot find Related Vehicle for this');
    }
    var data_array = {
        vh_id: $('#vh_id').val(),
        vh_code: $('#vh_code').val(), //refno
        customer_ComboBox: $('.customer_ComboBox').val(),
        coordinator: $('#coordinator_id').val(),
        sold_price: $('#sold_price').val(),
        insurance_amount: $('#vhi_amount').val(),
        insurance_company: $('.insurance_ComboBox').val(),
        valuation_from: $('#vhi_valuation_by').val(),
        docs_submitted: $('#vhi_docs_submitted').val(),
        vhi_submit_date: $('#vhi_submit_date').val(),
        additional_info: $('#vhi_additional_info').val(),
        deposite_acc: $('#deposite_acc').val(),
        cnfrmation: cnfrmation,
        pay_status: pay_status
    }

    $.post("models/model_insurance.php", {action: 'save_insurance_entry', data_array: data_array}, function (reply) {
        alertifyMsgDisplay(reply, 2000, function () {

        });
        setTimeout(function () {
            window.location.href = "view_insurance_list.php";
        }, 3000);
        clear_leasing_form();
    }, 'json');

}

function clear_leasing_form() {
    $('#vh_id').val(),
            $('#vh_code').val(), //refno
            $('.customer_ComboBox').val(),
            $('#coordinator_id').val(),
            $('#sold_price').val(),
            $('#vhi_amount').val(),
            $('.insurance_ComboBox').val(),
            $('#vhi_valuation_by').val(),
            $('#vhi_docs_submitted').val(),
            $('#vhi_submit_date').val(),
            $('#vhi_additional_info').val(),
            $('#deposite_acc').val()
}


function load_insurance_vehicle_info(vhi_id) {
    if (parseInt(vhi_id) !== '') {
        $.post("models/model_insurance.php", {action: 'load_insurance_vehicle_info', vhi_id: vhi_id}, function (e) {
            if (e === undefined || e.length === 0 || e === null) {
                alertify.error("No Data Found", 1000);
            } else {
                $.each(e, function (index, qData) {

                    $('#vh_code').val(qData.vh_code);
                    $('#model').val(qData.mod_name);
                    $('#chassis_no').val(qData.vh_chassis_num);
                    load_customer_cmb(qData.cus_id);
                    load_coordinators(qData.coordinator_id);
                    $('#sold_price').val(qData.sold_price);
                    $('#vhi_amount').val(qData.vhi_amount);
                    in_company_com(qData.in_company_id);
                    $('#vhi_valuation_by').val(qData.vhi_valuation_by);
                    $('#vhi_docs_submitted').val(qData.vhi_docs_submitted);
                    $('#vhi_submit_date').val(qData.vhi_submit_date);
                    $('#deposite_acc').val(qData.vhi_deposit_acc);
                    $('#vhi_additional_info').val(qData.vhi_additional_info);

                    if (parseInt(qData.vhi_confirm) === 1) {
                        $('#con').prop('checked', true);
                        $('#not_con').prop('checked', false);
                    } else {
                        $('#con').prop('checked', false);
                        $('#not_con').prop('checked', true);
                    }

                    if (parseInt(qData.vhi_payment_status) === 1) {
                        $('#ok').prop('checked', true);
                        $('#pending').prop('checked', false);
                        $('#delaying').prop('checked', false);
                    } else if (qData.vhi_payment_status === 2) {
                        $('#ok').prop('checked', false);
                        $('#pending').prop('checked', true);
                        $('#delaying').prop('checked', false);
                    } else {
                        $('#ok').prop('checked', false);
                        $('#pending').prop('checked', false);
                        $('#delaying').prop('checked', true);
                    }
                    chosenRefresh();
                });
            }
        }, "json");
    } else {
        alertify.error("Invalid selection", 1000);
    }
}


function load_ins_vh_info_ss(vh_id) {
    if (parseInt(vh_id) !== '') {
        alert(vh_id);
        $.post("models/model_insurance.php", {action: 'load_ins_vehicle_info', vh_id: vh_id}, function (e) {
            if (e === undefined || e.length === 0 || e === null) {
                alertify.error("No Data Found", 1000);
            } else {
                $.each(e, function (index, qData) {
                    $('#vh_code').val(qData.vh_code);
                    $('#model').val(qData.mod_name);
                    $('#chassis_no').val(qData.vh_chassis_num);
                    $('#sold_price').val(qData.sold_price);
                    load_customer_cmb(qData.cus_id);
                    load_coordinators(qData.coordinator_id);
                    $('#vhi_amount').val(qData.vhi_amount);
                    in_company_com(qData.in_company_id);
                    $('#vhi_valuation_by').val(qData.vhi_valuation_by);
                    $('#vhi_docs_submitted').val(qData.vhi_docs_submitted);
                    $('#vhi_submit_date').val(qData.vhi_submit_date);
                    $('#deposite_acc').val(qData.vhi_deposit_acc);
                    $('#vhi_additional_info').val(qData.vhi_additional_info);

                    if (parseInt(qData.vhi_confirm) === 1) {
                        $('#con').prop('checked', true);
                        $('#not_con').prop('checked', false);
                    } else {
                        $('#con').prop('checked', false);
                        $('#not_con').prop('checked', true);
                    }

                    if (parseInt(qData.vhi_payment_status) === 1) {
                        $('#ok').prop('checked', true);
                        $('#pending').prop('checked', false);
                        $('#delaying').prop('checked', false);
                    } else if (qData.vhi_payment_status === 2) {
                        $('#ok').prop('checked', false);
                        $('#pending').prop('checked', true);
                        $('#delaying').prop('checked', false);
                    } else {
                        $('#ok').prop('checked', false);
                        $('#pending').prop('checked', false);
                        $('#delaying').prop('checked', true);
                    }
                    chosenRefresh();
                });
            }
        }, "json");
    } else {
        alertify.error("Invalid selection", 1000);
    }
}

function update_insurance_info() {
    var cnfrmation = parseInt($("input[type='radio'][name='confirmation']:checked").val());
    var pay_status = parseInt($("input[type='radio'][name='paym_status']:checked").val());
    var vhi_id = $('#vhi_id').val()
    if (vhi_id == '') {
        alertify.error('cannot find Related Vehicle for this');
    } else {
        var data_array = {
            vhi_id: $('#vhi_id').val(),
            vh_code: $('#vh_code').val(), //refno
            customer_ComboBox: $('.customer_ComboBox').val(),
            coordinator: $('#coordinator_id').val(),
            sold_price: $('#sold_price').val(),
            insurance_amount: $('#vhi_amount').val(),
            insurance_company: $('.insurance_ComboBox').val(),
            valuation_from: $('#vhi_valuation_by').val(),
            docs_submitted: $('#vhi_docs_submitted').val(),
            vhi_submit_date: $('#vhi_submit_date').val(),
            additional_info: $('#vhi_additional_info').val(),
            deposite_acc: $('#deposite_acc').val(),
            cnfrmation: cnfrmation,
            pay_status: pay_status
        }

        $.post("models/model_insurance.php", {action: 'update_insurance_entry', data_array: data_array}, function (reply) {
            alertifyMsgDisplay(reply, 2000, function () {

            });
            setTimeout(function () {
                window.location.href = "view_insurance_list.php";
            }, 3000);
            clear_leasing_form();
        }, 'json');

    }
}