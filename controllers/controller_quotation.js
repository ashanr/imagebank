function load_quotation_vehicle_combo(selected, callBack) {
//@Ashan Rajapaksha
    var comboData = '';
    $.post("models/model_quotation.php", {comboBox: 'load_vehicle_code_combo'}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            comboData += '<option value="0"> -- No Data Found -- </option>';
            $('.vehicle_code_combo').html('').append(comboData);
            chosenRefresh();
        } else {
            $.each(e, function (index, qData) {
                if (selected !== undefined || e !== null || e.length !== 0) {
                    if (parseInt(selected) === parseInt(qData.vh_id)) {
                        comboData += '<option value="' + qData.vh_id + '" selected>' + qData.vh_code + '</option>';
                    } else {
                        comboData += '<option value="' + qData.vh_id + '">' + qData.vh_code + '</option>';
                    }
                } else {
                    comboData += '<option value="' + qData.vh_id + '">' + qData.vh_code + '</option>';
                }
            });
            $('.vehicle_code_combo').html('').append(comboData);
            chosenRefresh();
        }
        if (callBack !== undefined) {
            if (typeof callBack === 'function') {
                callBack();
            }
        }
    }, "json");
}

function load_vehicle_data(vh_id) {
    //@AShan
    select_vh_web_features(vh_id);
    var comboData = '';

    $.post("models/model_quotation.php", {comboBox: 'load_vehicle_data', vh_id: vh_id}, function (e) {
        $.each(e, function (index, data) {
            $('#vh_id').val(data.vh_id);
            $('#maker').val(data.maker_name);
            $('#model').val(data.mod_name);
            $('#invoice_no').val('PI-' + data.vh_code + 'KR');
            $('#vehicle_milage').val(data.vh_milage);
            $('#vehicle_year').val(data.vh_year);
            $('#vehicle_colour').val(data.vh_color);
            //$('#display_price').val(data.auc_display_price);

        });
    }, "json");
}


function save_vehicle_quotation() {
//@Ashan
    var featureIDs = $(".features_table input:checkbox:checked").map(function () {
        return $(this).val();
    }).get(); //
    var vh_id = $('#vh_id').val();
    var invoice_no = $('#invoice_no').val();
    var customer_id = $('#cus_id').val();
    var customer_name = $('#cus_name').val();
    var address = $('#address').val();
    var phone_no = $('#phone_no').val();
    var display_price = $('#display_price').val();
    var vehicle_price = $('#vehicle_price').val();
    var first_advance = $('#first_advance').val();
    var lc_charge = $('#lc_charge').val();
    var second_advance = $('#second_advance').val();
    var balance = $('#balance').val();
    var vehicle_options = $('#vehicle_options').val();

    if (vh_id.length !== 0) {
        var data_array = {
            featureIDs: featureIDs,
            vh_id: vh_id,
            invoice_no: invoice_no,
            customer_id: customer_id,
            customer_name: customer_name,
            address: address,
            display_price: display_price,
            phone_no: phone_no,
            vehicle_price: vehicle_price,
            first_advance: first_advance,
            lc_charge: lc_charge,
            second_advance: second_advance,
            balance: balance,
            vehicle_options: vehicle_options

        }

        $.post("models/model_quotation.php", {action: 'save_quotation', form_data: data_array}, function (reply) {
            alertifyMsgDisplay(reply, 2000, function () {

            });
        }, 'json');
    } else {
        alertify.error("Enter Data To Add", 2500);
    }
}
/*---------------insurance quatation insert quarry------------*/
function save_quotation() {
//@Mr.Wasantha
    var featureIDs = $(".features_table input:checkbox:checked").map(function () {
        return $(this).val();
    }).get(); //
    var vh_id = $('#vh_id').val();
    var invoice_no = $('#invoice_no').val();
    var customer_id = $('#cus_id').val();
    var customer_name = $('#cus_name').val();
    var address = $('#address').val();
    var phone_no = $('#phone_no').val();
    var vehicle_price = $('#vehicle_price').val();
//    var first_advance = $('#first_advance').val();
//    var lc_charge = $('#lc_charge').val();
//    var second_advance = $('#second_advance').val();
//    var balance = $('#balance').val();
    var vehicle_options = $('#vehicle_options').val();

    if (vh_id.length !== 0) {
        var data_array = {
            featureIDs: featureIDs,
            vh_id: vh_id,
            invoice_no: invoice_no,
            customer_id: customer_id,
            customer_name: customer_name,
            address: address,
            phone_no: phone_no,
            vehicle_price: vehicle_price,
//            first_advance: first_advance,
//            lc_charge: lc_charge,
//            second_advance: second_advance,
//            balance: balance,
            vehicle_options: vehicle_options

        }

        $.post("models/model_insurance.php", {action: 'save_insurance_entry', form_data: data_array}, function (reply) {
            alertifyMsgDisplay(reply, 2000, function () {

            });
        }, 'json');
    } else {
        alertify.error("Enter Data To Add", 2500);
    }
}
/*------------------------------------------------------------------------------*/
function update_vehicle_quotation() {
    //@AShan
    var featureIDs = $(".features_table input:checkbox:checked").map(function () {
        return $(this).val();
    }).get(); //
    var vh_id = $('#vh_id').val();
    var invoice_no = $('#invoice_no').val();
    var customer_id = $('#cus_id').val();
    var customer_name = $('#cus_name').val();
    var address = $('#address').val();
    var phone_no = $('#phone_no').val();
    var display_price = $('#display_price').val();
    var vehicle_price = $('#vehicle_price').val();
    var first_advance = $('#first_advance').val();
    var lc_charge = $('#lc_charge').val();
    var second_advance = $('#second_advance').val();
    var balance = $('#balance').val();

    if (vh_id.length !== 0) {
        var data_array = {
            featureIDs: featureIDs,
            vh_id: vh_id,
            invoice_no: invoice_no,
            customer_id: customer_id,
            customer_name: customer_name,
            address: address,
            phone_no: phone_no,
            display_price:display_price,
            vehicle_price: vehicle_price,
            first_advance: first_advance,
            lc_charge: lc_charge,
            second_advance: second_advance,
            balance: balance,
            q_id: $('#q_id').val(),
            vehicle_options: $('#vehicle_options').val()
        }
        $.post("models/model_quotation.php", {action: 'upadte_quotation', form_data: data_array}, function (reply) {
            alertifyMsgDisplay(reply, 2000, function () {
                show_update_btn();
                clear_quotation_form();
                load_quotation($('#q_id').val());
                
            });
        }, 'json');
    } else {
        alertify.error("Enter Data To Update", 2500);
    }
}

function clear_quotation_form(){
    $('#vh_id').val("");
    $('#invoice_no').val("");
    $('#cus_id').val("");
    $('#cus_name').val("");
    $('#address').val("");
    $('#phone_no').val("");
    $('#display_price').val("");
    $('#vehicle_price').val("");
    $('#first_advance').val("");
    $('#lc_charge').val("");
    $('#second_advance').val("");
    $('#balance').val("");
}
function show_add_btn() {
    if ($('#save_btn').hasClass('hidden')) {
        $('#save_btn').removeClass('hidden');
        $('#btn_clearing_reset').removeClass('hidden');
    }
    if (!$('#update_btn').hasClass('hidden')) {
        $('#update_btn').addClass('hidden');
    }
}

function show_update_btn() {
    if ($('#update_btn').hasClass('hidden')) {
        $('#update_btn').removeClass('hidden');
    }

    if (!$('#save_btn').hasClass('hidden')) {
        $('#save_btn').addClass('hidden');
        //  $('#btn_clearing_reset').addClass('hidden');
    }
}


function   clear_vhList() {

    var idList = $('#vh_id_list').val();
    alert(idList);
}

function load_quotation(q_id, callBack) {
    if (parseInt(q_id) !== '') {
        $.post("models/model_quotation.php", {action: 'get_quotation_info', q_id: q_id}, function (e) {
            if (e === undefined || e.length === 0 || e === null) {
                alertify.error("No Data Found", 1000);
            } else {
                $.each(e, function (index, qData) {

                    $('#vehicle_code_combo').val(qData.vh_id);
                    $('#invoice_no').val(qData.invoce_no);
                    $('#cus_id').val(qData.customer_id);
                    $('#vh_id').val(qData.vh_id);
                    $('#cus_name').val(qData.customer_name);
                    $('#address').val(qData.address);
                    $('#display_price').val(qData.display_price);
                    $('#phone_no').val(qData.phone_no);
                    $('#vehicle_price').val(parseFloat(qData.vehicle_price));
                    $('#first_advance').val(qData.first_advance);
                    $('#lc_charge').val(qData.lc_charge);
                    $('#second_advance').val(qData.second_advance);
                    $('#balance').val(qData.balance);

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

