function driver_balance_save() {
    if (isNaN(parseInt($('#driver_id').val()))) {
        alert('select driver !');
        return;
    }
    var drch_data = {
//model_ComboBox: $('.model_ComboBox').val(),
        drch_id: $('#drch_id').val(),
        driver_name: $('#driver_id :selected').text(),
        driver_id: $('#driver_id').val(),
        drch_date: $('#drch_date').val(),
        vh_id: $('#clearing_vehicle').val(),
        drch_desc: $('#drch_desc').val(),
        drch_type: $('input:radio[name=rbt_itemType]:checked').val(),
        from: $('#from').val(),
        destination: $('#destination').val(),
        drch_salary: $('#drch_salary').val(),
        drch_petrol: $('#drch_petrol').val(),
        drch_expenses: $('#drch_expenses').val(),
        drch_advance: $('#drch_advance').val(),
        drch_payment: $('#drch_payment').val(),
        pay_status: $('input:radio[name=rbt_confirm]:checked').val()
    };
    $.post('models/model_driver_balance.php', {action: 'add_driver_balance', drch_data: drch_data}, function (e) { 
        alertifyMsgDisplay(e, 2000);
        load_drch_lastBalance();
        reset_drch();
    }, 'json');
}

function driver_balance_update() {
    var drch_data = {
//model_ComboBox: $('.model_ComboBox').val(),
        drch_id: $('#drch_id').val(),
        driver_name: $('#driver_name').val(),
        drch_date: $('#drch_date').val(),
        vh_id: $('#clearing_vehicle').val(),
        drch_desc: $('#drch_desc').val(),
        drch_type: $('input:radio[name=rbt_itemType]:checked').val(),
        from: $('#from').val(),
        destination: $('#destination').val(),
        drch_salary: $('#drch_salary').val(),
        drch_petrol: $('#drch_petrol').val(),
        drch_expenses: $('#drch_expenses').val(),
        drch_advance: $('#drch_advance').val(),
        drch_payment: $('#drch_payment').val(),
        pay_status: $('input:radio[name=rbt_confirm]:checked').val()
    };
    $.post('models/model_driver_balance.php', {action: 'add_driver_balance', drch_data: drch_data}, function (e) {
        alertifyMsgDisplay(e, 2000);
        load_drch_lastBalance();
        reset_drch();
    }, 'json');
}

function driver_payment_save() {
//    if (isNaN(parseInt($('#clearing_vehicle').val()))) {
////        alertify.error('Select to Vehicle From the List !', 3000);
//        return;
//    }

    if ($('#rbt_paid').is(':checked')) {
        if (parseFloat($('#drch_payment').val()) > parseFloat($('#last_balance').html())) {
            alertify.error('Payment Exceeded !', 3000);
            return;
        }
    }
    var drch_payment = isNaN(parseFloat($('#drch_payment').val())) ? 0 : (parseFloat($('#drch_payment').val()));
    if (drch_payment === 0) {
        alertify.error('Payment must be real value !', 3000);
        return;
    }
    var drch_data = {
//model_ComboBox: $('.model_ComboBox').val(),
        drch_id: $('#drch_id').val(),
        driver_id: $('#driver_id').val(),
        driver_name: $('#driver_id :selected').text(),
        drch_date: $('#drch_date').val(),
//        vh_id: $('#clearing_vehicle').val(),
        drch_desc: $('#drch_desc').val(),
        drch_type: $('input:radio[name=rbt_itemType]:checked').val(),
        from: $('#from').val(),
        destination: $('#destination').val(),
        drch_salary: $('#drch_salary').val(),
        drch_petrol: $('#drch_petrol').val(),
        drch_expenses: $('#drch_expenses').val(),
        drch_advance: $('#drch_advance').val(),
        drch_payment: $('#drch_payment').val(),
        pay_status: $('input:radio[name=rbt_confirm]:checked').val()
    };
    $.post('models/model_driver_balance.php', {action: 'driver_payment_save', drch_data: drch_data}, function (e) {
        alertifyMsgDisplay(e, 2000);
        load_drch_lastBalance();
        load_drch_payment_table();
        reset_drch();
    }, 'json');
}

function reset_drch() {
    $('#drch_id').val("");
    $('#driver_name').val("");
    $('#clearing_vehicle').val("");
    $('#drch_salary').val("");
    $('#drch_petrol').val("");
    $('#drch_expenses').val("");
    $('#drch_payment').val("");
    $('#drch_advance').val("");
}

function load_drch_lastBalance() {

    var driver_details = {
        driver_id: $('#driver_id').val()

    };
    $.post("models/load_data.php", {action: 'load_drch_balance', driver_name_array: driver_details}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            alertify.error("No Data Found", 1000);
        } else {
            $('#last_balance_lbl').html('Rs. <span id="last_balance">' + (e.driver_balance == null ? '-' : e.driver_balance) + '</span>');
            $('.over_payment').addClass('hidden');
        }
    }, "json");
}

function load_payments() {

    var driver_details = {
        driver_name: $('#driver_name').val()
    };
    $.post("models/load_data.php", {action: 'load_drch_payments', driver_name_array: driver_details}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            alertify.error("No Data Found", 1000);
        } else {

            $.each(e, function (index, qData) {
                alert(qData.drch_payment);
                // $('#last_balance').html("Rs." + (qData.driver_balance == null ? '-' : qData.driver_balance));
                //  $('.over_payment').addClass('hidden');
//                if (qData.driver_balance < 0) {
//                    $('#over_payment').html("Rs." + Math.abs(qData.driver_balance));
//                    $('.last_balance').addClass('hidden');
//                } else {
//                    $('#last_balance').html("Rs." + qData.driver_balance);
//                    $('.over_payment').addClass('hidden');
//                }

//(qData.driver_balance.length>0?qData.driver_balance:0)
            });
        }
    }, "json");
}


function load_driver_balance() {
    var drch_salary = ($('#drch_salary').val().length > 0 ? parseFloat($('#drch_salary').val()) : 0);
    var drch_petrol = $('#drch_petrol').val().length > 0 ? parseFloat($('#drch_petrol').val()) : 0;
    var drch_expenses = $('#drch_expenses').val().length > 0 ? parseFloat($('#drch_expenses').val()) : 0;
    var drch_advance = $('#drch_advance').val().length > 0 ? parseFloat($('#drch_advance').val()) : 0;
    var balance = ((drch_salary + drch_petrol + drch_expenses) - (drch_advance));
    $('#driver_balance').html(balance.toFixed(2));
}

function load_drch_info(drch_id, callBack) {
    if (parseInt(drch_id) !== '') {
        $.post("views/commenSettingView.php", {action: 'get_drch_info', drch_id: drch_id}, function (e) {
            if (e === undefined || e.length === 0 || e === null) {
                // alertify.error("No Data Found", 1000);
            } else {

                $.each(e, function (index, qData) {
                    $(':radio[value="' + qData.drch_type + '"]').attr('checked', 'checked');
                    $('#driver_name').val(qData.driver_name);
                    $('#drch_date').val(qData.drch_date);
                    $('#driver_name').prop('disabled', true);

                    if (qData.drch_type == '0') {
                        $("input[type=radio][value=" + 2 + "]").prop("disabled", true);
                        $('#vh_id').val(qData.vh_id);
                        $('#from').val(qData.from);
                        $('#drch_salary').val(qData.drch_salary);
                        $('#drch_petrol').val(qData.drch_petrol);
                        $('#drch_expenses').val(qData.drch_expenses);
                        $('#drch_advance').val(qData.drch_advance);

                        $('#vh_id').val(qData.vh_id);
                        $('#from').val(qData.from);
                        $('#destination').val(qData.destination);
                        $('#drch_salary').val(qData.drch_salary);
                        $('#drch_petrol').val(qData.drch_petrol);
                        $('#drch_expenses').val(qData.drch_expenses);
                        $('#drch_advance').val(qData.drch_advance);

                    } else if (qData.drch_type == '1') {
                        $("input[type=radio][value=" + 2 + "]").prop("disabled", true);
                        $("#advance_only").removeClass('hidden');
                        $("#charges").addClass('hidden');
                        $('#vh_id').val(qData.vh_id);
                        $("#make_payment").addClass('hidden');
                        $("#payment_include").addClass('hidden');
                        $("#payment_obs").addClass('hidden');
                        load_driver_balance();

                        $('#vh_id').val(qData.vh_id);
                        $('#from').val(qData.from);
                        $('#destination').val(qData.destination);
                        $('#drch_salary').val(qData.drch_salary);
                        $('#drch_petrol').val(qData.drch_petrol);
                        $('#drch_expenses').val(qData.drch_expenses);
                        $('#drch_advance').val(qData.drch_advance);
                    } else {
                        $('input:radio[name=rbt_confirm]:checked').val(qData.drch_type);
                        $("input[type=radio][value=" + 0 + "]").prop("disabled", true);
                        $("input[type=radio][value=" + 1 + "]").prop("disabled", true);
                        $('#drch_payment').val(qData.drch_payment);
                        load_driver_balance();

                    }
                    chosenRefresh();

                });

                show_drch_update();
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



function load_driver_name(dname) {

    var driver_details = {
        driver_name: $('#driver_name').val()
    };
    $.post("models/load_data.php", {action: 'load_driver_name', driver_name_array: driver_details}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            alertify.error("No Data Found", 1000);
        } else {

            $.each(e, function (index, qData) {
                alert(qData.driver_name);
                // $('#dname').html(+ (qData.driver_name == null ? '-' : qData.driver_name));

//                if (qData.driver_balance < 0) {
//                    $('#over_payment').html("Rs." + Math.abs(qData.driver_balance));
//                    $('.last_balance').addClass('hidden');
//                } else {
//                    $('#last_balance').html("Rs." + qData.driver_balance);
//                    $('.over_payment').addClass('hidden');
//                }

//(qData.driver_balance.length>0?qData.driver_balance:0)
            });
        }
    }, "json");
}


function show_drch_update() {
//   @Ashan
    if ($('#order_update').hasClass('hidden')) {
        $('#order_update').removeClass('hidden');
    }
    if (!$('#save_driver_balance_btn').hasClass('hidden')) {
        $('#save_driver_balance_btn').addClass('hidden');
    }
}

function show_drch_add() {
    if ($('#save_driver_balance_btn').hasClass('hidden')) {
        $('#save_driver_balance_btn').removeClass('hidden');
    }
    if (!$('#order_update').hasClass('hidden')) {
        $('#order_update').addClass('hidden');
    }
}