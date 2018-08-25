function load_cb_vehicle_data(vh_id) {
    //@Ashan Rajapaksha
    $.post("models/model_quotation.php", {comboBox: 'load_cb_vehicle_data', vh_id: vh_id}, function (e) {
        $.each(e, function (index, data) {
            $('#vh_id').val(data.vh_id);
            $('#model').val(data.engine_cc);
            $('#cb_chassis_no').val(data.vh_chassis_num);
            $('#cb_color').val(data.vh_color);
            $('#list').val(data.vh_code + 'KR');
            $('#cb_model').val(data.mod_name);
            $('#cb_coordinator').val(data.coordinator_name);
            $('#vehicle_year').val(data.vh_year);
            $('#vehicle_colour').val(data.vh_color);
            $('#display_price').val(data.auc_display_price);
        });
    }, "json");
}


function show_cb_add_btn() {
    if ($('#btn_clearing_balance_add').hasClass('hidden')) {
        $('#btn_clearing_balance_add').removeClass('hidden');
    }
    if (!$('#btn_update_clearing_balance').hasClass('hidden')) {
        $('#btn_update_clearing_balance').addClass('hidden');
    }
}

function show_cb_update_btn() {
    if (!$('#btn_clearing_balance_add').hasClass('hidden')) {
        $('#btn_clearing_balance_add').addClass('hidden');
    }
    if ($('#btn_update_clearing_balance').hasClass('hidden')) {
        $('#btn_update_clearing_balance').removeClass('hidden');
    }
}


function search_clearing_customer(text, callBack) {
    var tableData = '';
    $.post("views/loadTables.php", {table: 'customer_search_res', text: text}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            tableData += '<tr><th colspan="6" class="alert alert-warning text-center"> -- No Data Found -- </th></tr>';
            $('.cus_search_result tbody').html('').append(tableData);
        } else {
            $.each(e, function (index, qData) {
                index++;
                tableData += '<tr>';
                tableData += '<td>' + qData.cus_inv_name + '</td>';
                tableData += '<td>' + qData.cus_address + '</td>';
                tableData += '<td>' + qData.cus_phone1 + '</td>';
                tableData += '<td>' + qData.cus_phone2 + '</td>';
                tableData += '<td>' + qData.cus_email1 + '</td>';
                tableData += '<td><div class="btn-group"><button class="btn btn-custom-save sel_found_cust" value="' + qData.cus_id + '"><i class="fa fa-hand-o-up fa-lg"></i>&nbsp;Select</button></div></td>';
                tableData += '</tr>';
            });
            $('.cus_search_result tbody').html('').append(tableData);
            $('.sel_found_cust').click(function () {
                // $('.modi_custmr').val($(this).val());
                select_customer_clearing_balance($(this).val());
                $('#cus_searchModal').modal('hide');
                chosenRefresh();
            });

        }
        if (callBack !== undefined) {
            if (typeof callBack === 'function') {
                callBack();
            }
        }
    }, 'json');
}


function select_customer_clearing_balance(cus_id) {
    $.post('views/commenSettingView.php', {action: 'kitz_select_costomer', cus_id: cus_id}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            alertify.error('Error in customer selection.', 2000);
        } else {
            load_customer_cmb(e.cus_id);


//            show_customer_btn();
        }
    }, 'json');
}


function select_clering_person(agent_id) {
    $.post('views/commenSettingView.php', {action: 'kitz_select_costomer', cus_id: cus_id}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            alertify.error('Error in customer selection.', 2000);
        } else {
            load_customer_cmb(e.cus_id);


//            show_customer_btn();
        }
    }, 'json');
}


function load_syscode_clr_agent(sys_type, combo, callBack) {
    var comboData = '';
    $.post("views/loadComboBox.php", {comboBox: 'syscode_types', sys_type: sys_type}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            comboData += '<option value="0"> -- No Data Found -- </option>';
        } else {
//            comboData += '<option value="0">' +' All' + '</option>';
            $.each(e, function (index, qData) { 
                comboData += '<option value="' + qData.code + '">' + qData.description + '</option>';
            });
        }
        $(combo).html('').append(comboData);
        chosenRefresh();
        if (callBack !== undefined) {
            if (typeof callBack === 'function') {
                callBack();
            }
        }
    }, "json");
}

function load_agent_balance(agent_id) {
    $.post("models/load_data.php", {action: 'load_clear_balance', agent_id: agent_id}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            alertify.error("No Data Found", 1000);
        } else {

            $.each(e, function (index, qData) {
                if (qData.final_balance == '' || qData.final_balance == null) {
                    $('#cb_balance').val('-');
                    $('#cb_last_balance').val('-');
                } else {
                    $('#cb_balance').val(qData.final_balance);
                    $('#cb_last_balance').val(qData.final_balance);
                }
            });
        }
    }, "json");
}