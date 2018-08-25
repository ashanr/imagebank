//@Created By Ashan Rajapaksha

function save_vh_sales() {
//@Ashan

    var vh_id = $('#vh_id').val();
    var vh_code = $('#vh_code').val();
    var selling_price = $('#selling_price').val();
    var sold_price = $('#sold_price').val();
    var marks_invoice = $('#marks_invoice').val();
    var marked_price = $('#marked_price').val();
    var shipped_date = $('#shipped_date').val();
    var sold_price = $('#sold_price').val();
    var cus_id = $('#customer_id').val();
    var clearing_id = $('#clearing_id').val();
    var selling_status = $('#selling_status').val();
    var sales_status = $('#sales_status').val();
    var current_mileage = $('#current_mileage').val();
    var coordinator_id = $('#co_id').val();
    var sold_date = $('#sold_date').val();
    var importer = $('#importer').val();
    if (vh_id.length !== 0) {
        var data_array = {
            vh_id: vh_id,
            vh_code: vh_code,
            marked_price: marked_price,
            marks_invoice: marks_invoice,
            shipped_date: shipped_date,
            selling_price: selling_price,
            sold_price: sold_price,
            cus_id: cus_id,
            clearing_id: clearing_id,
            selling_status: selling_status,
            current_mileage: current_mileage,
            sales_status: sales_status,
            coordinator_id: coordinator_id,
            importer: importer,
            lease: $('#vhl_amount').val(),
            registration: $('#registration').val(),
            modification: $('#modification').val(),
            advance: $('#advance').val(),
            cash: $('#cash').val(),
            other: $('#other').val(),
            sold_date: sold_date
        }

        $.post("models/model_vehicle_sales.php", {action: 'save_sales_entry', form_data: data_array}, function (reply) {
            alertifyMsgDisplay(reply, 2000, function () {



                //load_cleareing_info(vh_id);
                // load_clearing_table();
            });
        }, 'json');
    } else {
        alertify.error("Enter Data To Add", 2500);
    }
}
function save_inv_payments(callback) {

//@Viraj
    var vh_id = parseInt($('#vh_id').val());
    if (isNaN(vh_id)) {
        alertify.error("Invalid Vehicle Selection !", 4000);
        return;
    }
    var customer_id = parseInt($('#customer_id').val());
    if (isNaN(customer_id)) {
        alertify.error("Invalid Customer Selection !", 4000);
        return;
    }
    var payed_amt = parseFloat($('#payed_amt').val());
    if (isNaN(payed_amt) || !(payed_amt > 0)) {
        alertify.error("Invalid Payment Value !", 4000);
        return;
    }
    if (parseFloat($('#mod_avlble').text()) < 0) {
        alertify.error("Invalid Payment Value !", 4000);
        return;
    }
    var sales_id = parseInt($('#sales_id').val());
    if (isNaN(sales_id)) {
        alertify.error("Invalid Payment reference !", 4000);
        return;
    }
    var data_array = {
        vh_id: vh_id,
        customer_id: customer_id,
        payed_amt: payed_amt,
        sales_id: sales_id,
    };
    $.post("models/model_vehicle_sales.php", {action: 'save_inv_payments', form_data: data_array}, function (reply) {
        alertifyMsgDisplay(reply, 2000);
        $('#payed_amt').val('');
        load_vh_sales_info(vh_id, function () {
            cal_total_salesEntry(1);
        });

        load_all_form_data(sales_id, vh_id);
        $('#make_payment_modal').modal('hide');
        if ($.type(callback) === 'function') {
            callback();
        }
    }, 'json');
}
function calculate_payment_model_data() {
    $('#payed_amt').val('');
    var tot_payble = (isNaN(parseFloat($('#totot').text())) ? 0 : parseFloat($('#totot').text()));
    if (tot_payble <= 0) {
        $('#payed_amt').prop("disabled", true);
    }
    $('#weh_marcLbl').html($('#marks_invoice').val());
    $('#cusName_lebal').html($('#customer_id  option:selected').html());
    $('#mod_tot_payble').html(tot_payble.toFixed(2));
    $('#mod_avlble').html(tot_payble.toFixed(2));
}
function delete_payment(user_level, pay_id, callback) {
    //@Viraj
    if (isNaN(pay_id)) {
        alertify.error("Invalid Selection !", 4000);
        return;
    }
    if (isNaN(parseInt($('#sales_id').val()))) {
        alertify.error("Invalid Payment reference !", 4000);
        return;
    }
    $.post("models/model_vehicle_sales.php", {action: 'delete_payment', paymnt_id: pay_id, sales_id: $('#sales_id').val(), user_level: user_level}, function (reply) {
        alertifyMsgDisplay(reply, 5000);
        if ($.type(callback) === 'function') {
            callback();
        }
    }, 'json');
}



function vhSell_update(sales_id, vehicles) {
//@Ashan
    var sales_id = $('#sales_id').val();
    var vh_id = $('#vh_id').val();
    var vh_code = $('#vh_code').val();
    var marks_invoice = $('#marks_invoice').val();
    var selling_price = $('#selling_price').val();
    var sold_price = $('#sold_price').val();
    var selling_status = $('#selling_status').val();
    var sales_status = $('#sales_status').val();
    var current_mileage = $('#current_mileage').val();
    var coordinater = $('#coordinater').val();
    var marked_price = $('#marked_price').val();
    var importer = $('#importer').val();
    var sold_date = $('#sold_date').val();
    var vhl_amount = $('#vhl_amount').val();
    var registration = $('#registration').val();
    var modification = $('#modification').val();
    var advance = $('#advance').val();
    var cash = $('#cash').val();
    var other = $('#other').val();


    if (parseInt(sales_id) !== 0) {
//        if (ct_description.length() == 0) {
//            alertify.error('Enter credit transfer description', 3000);
//            return;
//        }
        var form_data = {
            sales_id: sales_id,
            vh_id: vh_id,
            vh_code: vh_code,
            marked_price: marked_price,
            selling_price: selling_price,
            sold_price: sold_price,
            marks_invoice: marks_invoice,
            selling_status: selling_status,
            current_mileage: current_mileage,
            sales_status: sales_status,
            coordinater: coordinater,
            customer_id: $('#customer_id').val(),
            importer: importer,
            sold_date: sold_date,
            vhl_amount: vhl_amount,
            registration: registration,
            modification: modification,
            advance: advance,
            cash: cash,
            lease: $('#vhl_amount').val(),
            other: $('#other').val(),
            sold_date: sold_date


        };
        $.post("models/model_vehicle_sales.php", {action: 'update_vehicle_sales', form_data: form_data}, function (reply) {
            alertifyMsgDisplay(reply, 2000);

            setTimeout(function () {
                window.close();
                window.location = 'view_vehicle_sales_list.php';
            }, 3000);




            // reset_credit_transfer();
            // next_ai_ct();
//                clear_payment_fields();
//                vh_payments(vh_id);
//                get_vehicle_paidamount(vh_id);


        }, 'json');
    } else {
        alertify.error('One or more required field are empty', 2500);
    }
}


function cancel_vehicle_sales(sales_id) {
//@Ashan
    confirm("Cancel Vehicle Sales", "Are You Sure Want To cancel this vehicle sale", "No", "Yes", function () {
        $.post("views/commenSettingView.php", {action: 'cancel_sales', sales_id: sales_id}, function (e) {
            alertifyMsgDisplay(e, 2000);
            submitSingleDataByPost("view_vehicle_sales_list.php", "a", "a");
        }, "json");
    });
}

function load_vh_sales_info(vh_id, callBack) {
    var vh_id = $('#vh_id').val();
    if (parseInt(vh_id) !== '') {
        $.post("models/model_vehicle_sales.php", {action: 'get_vh_sales_info', vh_id: vh_id}, function (e) {
            if (e === undefined || e.length === 0 || e === null) {
                //alertify.error("No Data Found1", 1000);
            } else {

                $.each(e, function (index, qData) {
                    load_customer_cmb(qData.customer_id);
                    load_coordinator_jp_cmb(qData.coordinator_id);
                    load_makers_cmb(qData.maker_id);
                    $('#auction_price').attr('disabled', 'disabled');
                    $('#eng_cc').attr('disabled', 'disabled');
                    $('#vh_code').attr('disabled', 'disabled');
                    $('#maker').attr('disabled', 'disabled');
                    $('#auction_price').val(qData.auc_real_price);
                    $('#sales_status').val(qData.stock_status);
                    $('#vh_code').val(qData.vh_code);
                    $('#vh_code').val(qData.vh_code);
                    $('#vh_id').val(qData.vh_id);
                    $('#co_id').val(qData.coordinator_id);
                    $('#marks_invoice').val(qData.vh_code + 'KR');
                    $('#marked_price').val(qData.marked_price);
                    $('#selling_price').val(qData.selling_price);
                    $('#sold_price').val(qData.sold_price);
                    $('#current_mileage').val(qData.current_milage);
                    $('#eng_cc').val(qData.engine_cc);
                    $('#sold_date').val(qData.sold_date);
                    $('#coordinator').val(qData.coordinator_id);
                    $('#maker_id').val(qData.maker_id);
                    $('#clearing_id').val(qData.clr_id);
                    $('#cus_id').val(qData.customer_id);
                    $('#current_mileage').val(qData.vh_milage);
                    $('#importer').val(qData.coordinator_name);
                    $('#shipped_date').val(qData.shipped_date);
                    $('#vhl_amount').val(qData.lease);
                    $('#registration').val(qData.registration);
                    $('#modification').val(qData.modification);
                    $('#advance').val(qData.advance);
                    $('#cash').val(qData.cash);
                    $('#other').val(qData.other);
                    $('#shipped_date').attr('disabled', 'disabled');
                    chosenRefresh();
                });

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

function show_add_sales_btn() {
    if ($('#sale_save').hasClass('hidden')) {
        $('#sale_save').removeClass('hidden');
    }

    if ($('#advance').prop("disabled", true)) {
        $('#advance').prop("disabled", false);
    }
    if (!$('#update_vehicleSell_btn').hasClass('hidden')) {
        $('#update_vehicleSell_btn').addClass('hidden');
    }

    if (!$('#sales_payment_btn').hasClass('hidden')) {
        $('#sales_payment_btn').addClass('hidden');
    }

    if (!$('#print_bill_btn').hasClass('hidden')) {
        $('#print_bill_btn').addClass('hidden');
    }
}

function show_update_sales_btn() {
    if ($('#update_vehicleSell_btn').hasClass('hidden')) {
        $('#update_vehicleSell_btn').removeClass('hidden');
        $('#print_last_bill').removeClass('hidden');
        $('#sales_payment_btn').removeClass('hidden');
    }

    if (!$('#sale_save').hasClass('hidden')) {
        $('#sale_save').addClass('hidden');
        //  $('#btn_clearing_reset').addClass('hidden');
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


function load_vehicle_sales_info(sales_id, callBack) {

    if (parseInt(sales_id) !== '') {
        $.post("models/model_vehicle_sales.php", {action: 'get_vehicle_sales_info', sales_id: sales_id}, function (e) {
            if (e === undefined || e.length === 0 || e === null) {
                alertify.error("No Data Found1", 1000);
            } else {

                $.each(e, function (index, qData) {
                    load_customer_cmb(qData.customer_id);
                    load_coordinator_jp_cmb(qData.coordinator_id);
                    load_makers_cmb(qData.maker_id);
                    $('#auction_price').attr('disabled', 'disabled');
                    $('#eng_cc').attr('disabled', 'disabled');
                    $('#vh_code').attr('disabled', 'disabled');
                    $('#maker').attr('disabled', 'disabled');
                    $('#auction_price').val(qData.auc_real_price);
                    $('#sales_status').val(qData.stock_status);
                    $('#vh_code').val(qData.vh_code);
                    $('#vh_id').val(qData.vh_id);
                    $('#marks_invoice').val(qData.vh_code + 'KR');
                    $('#marked_price').val(qData.marked_price);
                    $('#selling_price').val(qData.selling_price);
                    $('#sold_price').val(qData.sold_price);
                    $('#current_mileage').val(qData.current_milage);
                    $('#eng_cc').val(qData.engine_cc);
                    $('#sold_date').val(qData.sold_date);
                    $('#cus_id').val(qData.customer_id);
                    $('#vh_mileage').val(qData.vh_milage);
                    $('#importer').val(qData.coordinator_name);
                    $('#shipped_date').val(qData.shipped_date);
                    $('#shipped_date').attr('disabled', 'disabled');
                    $('#vhl_amount').val(qData.lease);
                    $('#registration').val(qData.registration);
                    $('#modification').val(qData.modification);
                    $('#advance').val(qData.advance);
                    $('#cash').val(qData.cash);
                    $('#other').val(qData.other);

                    chosenRefresh();
                });

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
function cal_total_salesEntry(type) {
    if (type === '0') {
        return;
    }
    var total_balance = 0;
    var total_amount = 0;
    var sold_price = (isNaN(parseFloat($('#sold_price').val())) ? 0 : parseFloat($('#sold_price').val()));
    var vhl_amount = (isNaN(parseFloat($('#vhl_amount').val())) ? 0 : parseFloat($('#vhl_amount').val()));
    var registration = (isNaN(parseFloat($('#registration').val())) ? 0 : parseFloat($('#registration').val()));
    var modification = (isNaN(parseFloat($('#modification').val())) ? 0 : parseFloat($('#modification').val()));
    var advance = (isNaN(parseFloat($('#advance').val())) ? 0 : parseFloat($('#advance').val()));
    var cash = (isNaN(parseFloat($('#cash').val())) ? 0 : parseFloat($('#cash').val()));
    var other = (isNaN(parseFloat($('#other').val())) ? 0 : parseFloat($('#other').val()));
    total_balance = (sold_price + vhl_amount + registration + modification + other) - (advance + cash);
    total_amount = (sold_price + vhl_amount + registration + modification + other);
    $('#totot').html(total_balance.toFixed(2));
    $('#total_amnt').html(total_amount.toFixed(2));
}
//function load_all_form_data(sales_id, vh_id) {
//    var type = '0';
//
//    if (sales_id > 0) {
//        type = '1';
//        load_vehicle_sales_info(sales_id, function () {
//            cal_total_salesEntry(type);
//        });
//        chosenRefresh();
//        show_update_sales_btn();
//    } else if (vh_id > 0) {
//        type = '2';
//        load_vh_sales_info(vh_id, function () {
//            cal_total_salesEntry(type);
//        });
//        show_add_sales_btn();
//    } else {
//        show_add_sales_btn(sales_id, vh_id);
//        load_customer_cmb();
//    }
//}