function load_leasing_vehicle_info(vh_id, callBack) {
// Load data with vehicle ID
    if (parseInt(vh_id) !== '') {
        $.post("models/model_leasing.php", {action: 'load_leasing_vehicle_info', vh_id: vh_id}, function (e) {
            if (e === undefined || e.length === 0 || e === null) {
                alertify.error("No Data Found", 1000);
            } else {
                $.each(e, function (index, qData) {

                    $('#vh_code').val(qData.vh_code);
                    $('#model').val(qData.mod_name);
                    $('#chassis_no').val(qData.vh_chassis_num);
                    //  $('#coordinator').val(qData.coordinator_name);  $('#coordinator_id').val(qData.coordinator_id);
                    load_coordinators(qData.coordinator_id);
                   $('#sold_price').val(qData.vh_disp_price);
                    $('#customer_ComboBox').val(qData.cus_id);
                    $('#cus_id').val(qData.cus_id);
                    $('#c_addr').val(qData.cus_address);
                    $('#c_phone1').val(qData.cus_phone1);
                    $('#ls_id').val(qData.ls_id);
                    $('#ls_name').val(qData.ls_name);
                    $('#vhl_amount').val(qData.vhl_amount);
                    $('#ls_address').val(qData.ls_address);
                    $('#ls_contact').val(qData.ls_contact);
                    $('#vhl_valuation_by').val(qData.vhl_valuation_by);
                    $('#vhl_docs_submitted').val(qData.vhl_docs_submitted);
                    $('#vhl_submit_date').val(qData.vhl_submit_date);
                    $('#vhl_payment_status').val(qData.vhl_payment_status);
                    $('#vhl_deposit_acc').val(qData.vhl_deposit_acc);
                    $('#vhl_additional_info').val(qData.vhl_additional_info);
                    $('#payment_type').val(qData.payment_type);
                    $('#payment_status').val(qData.vhl_additional_info);
                    $('#vhl_leasing_status').val(qData.vhl_confirm);
//                    chosenRefresh();
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

function load_leasing_info(vhl_id, callBack) {
    var vh_id = $('#vh_id').val();
    if (parseInt(vhl_id) !== '') {
        $.post("views/commenSettingView.php", {action: 'get_leasing_info', vhl_id: vhl_id, vh_id: vh_id}, function (e) {
            if (e === undefined || e.length === 0 || e === null) {
                alertify.error("No Data Found", 1000);
            } else {
                $.each(e, function (index, qData) {
                    // load_coordinator_jp_cmb(qData.coordinator_id);
                    load_makers_cmb(qData.maker_id);
                    load_coordinators(qData.coordinator_id);
                    $('#maker').attr('disabled', 'disabled');
                    $('#selling_status').val(qData.sell_status);
                    $('#vh_id').val(qData.vh_id);
                    $('#vh_code').val(qData.vh_code);
                    $('#model').val(qData.mod_name);
                    if (parseInt(qData.vh_is_reg) === 1) {
                        $('#rbt_reg').prop('checked', true);
                        $('#rbt_unreg').prop('checked', false);
                    } else {
                        $('#rbt_reg').prop('checked', false);
                        $('#rbt_unreg').prop('checked', true);
                    }
                    $('#chassis_no').val(qData.vh_chassis_num);
                    $('#coordinator').val(qData.selling_price);
                    $('#sold_price').val(qData.sold_price);
                    $('#vhl_submit_date').val(qData.vhl_submit_date);
                    $('#vhl_docs_submitted').val(qData.vhl_docs_submitted);
                    $('#vhl_payment_status').val(qData.vhl_payment_status);
                    $('#vhl_deposit_acc').val(qData.vhl_deposit_acc);
                    $('#vhl_additional_info').val(qData.vhl_additional_info);
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


function save_leasing_info(vh_id) {
//@Ashan

    if (vh_id > 0) {

        var data_array = {
            vh_id: $('#vh_id').val(),
            cus_id: $('.customer_ComboBox').val(),
            coordinator_id: $('#coordinator_id').val(),
            coordinator: $('#coordinator_id').val(),
            sold_price: $('#sold_price').val(),
            vhl_amount: $('#vhl_amount').val(),
            ls_id: $('#ls_id').val(),
            vhl_valuation_by: $('#vhl_valuation_by').val(),
            vhl_docs_submitted: $('#vhl_docs_submitted').val(),
            vhl_submit_date: $('#vhl_submit_date').val(),
            vhl_payment_status: $('#vhl_payment_status').val(),
            vhl_deposit_acc: $('#vhl_deposit_acc').val(),
            vhl_additional_info: $('#vhl_additional_info').val(),
            advance: $('#advance').val(),
            payment_type: $('#payment_type').val(),
            payment_status: $('#payment_status').val(),
            leasing_status: $('#vhl_leasing_status').val(),
        }

        $.post("models/leasing.php", {action: 'save_leasing_entry', form_data: data_array, vh_id: vh_id}, function (reply) {
            alertifyMsgDisplay(reply, 2000, function () {

            });
        }, 'json');
    } else {
        alertify.error("Enter Data Todd Add", 2500);
    }
}

function load_lease_vehicle_info(vh_id, callBack) {
    if (parseInt(vh_id) !== '') {
        $.post("models/leasing.php", {action: 'load_lease_vehicle_info', vh_id: vh_id}, function (e) {
            if (e === undefined || e.length === 0 || e === null) {
                alertify.error("No Data Found", 1000);
            } else {
                $.each(e, function (index, qData) {
                    $('#vh_code').val(qData.vh_code);
                    $('#model').val(qData.mod_name);
                    $('#chassis_no').val(qData.vh_chassis_num);
                    $('#coordinator_id').val(qData.coordinator_id);
                    $('#coordinator').val(qData.coordinator_name);
                    $('#sold_price').val(qData.sold_price);
//                    console.log('advance ' + qData.advance);
                    $('#advance').val(qData.advance);
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
//---------------------------------------
function load_ins_vh_info(vh_id) {
    if (parseInt(vh_id) !== '') {
//        alert(vh_id);
        $.post("models/model_leasing.php", {action: 'load_ins_vehicle_info', vh_id: vh_id}, function (e) {

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

//----------------------------------------



function update_leasing_info(vhl_id) {
//@Ashan

    //alert($('#vhl_status').val());
    if (vhl_id.length !== 0) {
        var data_array = {
            vhl: vhl_id,
            vh_id: $('#vh_id').val(),
            cus_id: $('#cus_id').val(),
            coordinator_id: $('#coordinator_id').val(),
            sold_price: $('#sold_price').val(),
            vhl_amount: $('#vhl_amount').val(),
            ls_id: $('#ls_id').val(),
            vhl_valuation_by: $('#vhl_valuation_by').val(),
            vhl_docs_submitted: $('#vhl_docs_submitted').val(),
            vhl_submit_date: $('#vhl_submit_date').val(),
            vhl_payment_status: $('#vhl_payment_status').val(),
            vhl_deposit_acc: $('#vhl_deposit_acc').val(),
            vhl_additional_info: $('#vhl_additional_info').val(),
            vhl_status: $('#vhl_status').val(),
            vhl_confirm: $('#vhl_leasing_status').val()
        }

        $.post("models/leasing.php", {action: 'update_leasing_entry', form_data: data_array, vhl_id: vhl_id}, function (reply) {
            alertifyMsgDisplay(reply, 2000, function () {

            });
        }, 'json');
    } else {
        alertify.error("Enter Data To Add", 2500);
    }
}

function search_leasing_company(text, callBack) {
    var tableData = '';
    $.post("views/loadTables.php", {table: 'leasing_search_res', text: text}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            tableData += '<tr><th colspan="6" class="alert alert-warning text-center"> -- No Data Found -- </th></tr>';
            $('.lscompany_search_result tbody').html('').append(tableData);
        } else {
            $.each(e, function (index, qData) {
                index++;
                tableData += '<tr>';
                tableData += '<td>' + qData.ls_name + '</td>';
                tableData += '<td>' + qData.ls_address + '</td>';
                tableData += '<td>' + qData.ls_contact + '</td>';
                tableData += '<td>' + qData.ls_optional_contact + '</td>';
                tableData += '<td>' + qData.ls_email + '</td>';
                tableData += '<td><div class="btn-group"><button class="btn btn-custom-save sel_found_ls_company" value="' + qData.ls_id + '"><i class="fa fa-hand-o-up fa-lg"></i>&nbsp;Select</button></div></td>';
                tableData += '</tr>';
            });
            $('.lscompany_search_result tbody').html('').append(tableData);
            $('.sel_found_ls_company').click(function () {
                $('.customer_ComboBox').val($(this).val());
                select_lscompany($(this).val());
                $('#leasing_company_searchModal').modal('hide');
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


function select_lscompany(ls_id) {
    $.post('views/commenSettingView.php', {action: 'select_lscompany', ls_id: ls_id}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            alertify.error('Error in customer selection.', 2000);
        } else {
            $('#ls_id').val(e.ls_id);
            $('#ls_name').val(e.ls_name);
            $('#ls_address').val(e.ls_address);
            $('#ls_contact').val(e.ls_contact);
        }
    }, 'json');
}