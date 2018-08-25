function ct_save(ct_id, vehicles) {
//@Ashan
    var ct_id = $('#ct_id').val();
    var ref_no = $('#ref_no').val();
    var ct_type = 'ct_type';
    var from_bank = $('#from_bank').val();
    var from_bank_branch = $('#from_bank_branch').val();
    var from_name = $('#from_name').val();
    var from_address = $('#from_address').val();
    var from_acc_no = $('#from_acc_no').val();
    var to_bank = $('#to_bank').val();
    var to_bank_branch = $('#to_bank_branch').val();
    var to_name = $('#to_name').val();
    var to_acc_no = $('#to_acc_no').val();
    var ct_date = $('#ct_date').val();
    var transfer_amount = $('#transfer_amount').val();
    var ct_address = $('#ct_address').val();
    var ct_header = $('#ct_header').val();
    var ct_body = $('#ct_body').val();
    var ct_description = $('#ct_description').val();
    if (parseInt(ct_id) !== 0) {

//        if (ct_description.length() == 0) {
//            alertify.error('Enter credit transfer description', 3000);
//            return;
//        }
        var form_data = {
            ct_id: ct_id,
            ref_no: ref_no,
            ct_type: ct_type,
            from_bank: from_bank,
            from_bank_branch: from_bank_branch,
            from_name: from_name,
            from_address: from_address,
            from_acc_no: from_acc_no,
            to_bank: to_bank,
            to_bank_branch: to_bank_branch,
            to_name: to_name,
            to_acc_no: to_acc_no,
            ct_date: ct_date,
            ct_amount: transfer_amount,
            ct_address: ct_address,
            ct_header: ct_header,
            ct_body: ct_body,
            ct_description: ct_description
        };
        $.post("views/commenSettingView.php", {action: 'add_credit_transfer', form_data: form_data}, function (reply) {

            alertifyMsgDisplay(reply, 2000);
            //  reset_credit_transfer();
            //  next_ai_ct();

            setTimeout(function () {
                submitSingleDataByPost("ct_print.php", "ct_id", ct_id);
            }
            , 3000);

//            setTimeout(function () {
//                window.location = 'view_ctpo_list.php';
//            }, 3000);

//                clear_payment_fields();
//                vh_payments(vh_id);
//                get_vehicle_paidamount(vh_id);
        }, 'json');
    } else {
        alertify.error('One or more required field are empty', 2500);
    }
}


function ct_update() {
    var ct_id = $('#ct_id').val();
    var ref_no = $('#ref_no').val();
    var ct_type = 'ct_type';
    var from_bank = $('#from_bank').val();
    var from_bank_branch = $('#from_bank_branch').val();
    var from_name = $('#from_name').val();
    var from_address = $('#from_address').val();
    var from_acc_no = $('#from_acc_no').val();
    var to_bank = $('#to_bank').val();
    var to_bank_branch = $('#to_bank_branch').val();
    var to_name = $('#to_name').val();
    var to_acc_no = $('#to_acc_no').val();
    var ct_date = $('#ct_date').val();
    var transfer_amount = $('#transfer_amount').val();
    var ct_address = $('#ct_address').val();
    var ct_header = $('#ct_header').val();
    var ct_body = $('#ct_body').val();
    var ct_description = $('#ct_description').val();
    if (ct_id.length !== 0) {
        var form_data = {
            ct_id: ct_id,
            ref_no: ref_no,
            ct_type: ct_type,
            from_bank: from_bank,
            from_bank_branch: from_bank_branch,
            from_name: from_name,
            from_address: from_address,
            from_acc_no: from_acc_no,
            to_bank: to_bank,
            to_bank_branch: to_bank_branch,
            to_name: to_name,
            to_acc_no: to_acc_no,
            ct_date: ct_date,
            ct_amount: transfer_amount,
            ct_address: ct_address,
            ct_header: ct_header,
            ct_body: ct_body,
            ct_description: ct_description
        };
        $.post("views/commenSettingView.php", {action: 'ct_update', form_data: form_data}, function (e) {
            //  alert(e);
            alertifyMsgDisplay(e, 2000);
            //reset_credit_transfer();

            setTimeout(function () {
                submitSingleDataByPost("ct_print.php", "ct_id", ct_id);
            }
            , 3000);

        }, 'json');
    } else {
        alert("Please Check the fields");
    }
}


function reset_credit_transfer() {
    $('#ct_id').val("");
    $('#ref_no').val("");
    $('#from_bank').val("");
    $('#from_bank_branch').val("");
    $('#from_name').val("");
    $('#from_address').val("");
    $('#from_acc_no').val("");
    $('#to_bank').val("");
    $('#to_bank_branch').val("");
    $('#to_name').val("");
    $('#to_address').val("");
    $('#to_acc_no').val("");
    $('#ct_date').val("");
    $('#transfer_amount').val("");
    $('#ct_address').val("");
    $('#ct_header').val("");
    $('#ct_body').val("");
    $('#ct_description').val("");
}

function load_letter_fields() {
    $('#ct_header').val("Regarding a credit Transferring");
    $('#ct_address').val("To Manager , HNB Kurunegala");
    $('#ct_body').val("I kindly request to proceed below transaction and please insert the reference number of this requesting to my account information.");
}

function show_ct_btn() {
//   @Ashan
    if ($('#ct_update_btn').hasClass('hidden')) {
        $('#ct_update_btn').removeClass('hidden');
    }
    if (!$('#ct_save_btn').hasClass('hidden')) {
        $('#ct_save_btn').addClass('hidden');
    }
}

function load_ct_info(ct_id, callBack) {
    if (parseInt(ct_id) !== '') {
        $.post("views/commenSettingView.php", {action: 'get_ct_info', ct_id: ct_id}, function (e) {
            if (e === undefined || e.length === 0 || e === null) {
                alertify.error("No Data Found", 1000);
            } else {
                $.each(e, function (index, qData) {
//                    load_suppliers_cmb(qData.supp_id);
//                    load_coordinator_jp_cmb(qData.coordinator_id);
//                    load_makers_cmb(qData.maker_id, function () {
//                        load_model_cmb($('.maker_ComboBox').val(), qData.vh_maker_model);
//                    });
//                    if (parseInt(qData.vh_is_reg) === 1) {
//                        $('#rbt_reg').prop('checked', true);
//                        $('#rbt_unreg').prop('checked', false);
//                    } else {
//                        $('#rbt_reg').prop('checked', false);
//                        $('#rbt_unreg').prop('checked', true);
//                    }
                    $('#ct_id').val(qData.ct_id);
                    $('#ref_no').val(qData.ref_no);
                    $('#ct_type').val(qData.ct_type);
                    $('#from_bank').val(qData.from_bank);
                    $('#from_bank_branch').val(qData.from_bank_branch);
                    $('#from_name').val(qData.from_name);
                    $('#from_address').val(qData.from_address);
                    $('#from_acc_no').val(qData.from_acc_no);
                    $('#to_bank').val(qData.to_bank);
                    $('#to_bank_branch').val(qData.to_bank_branch);
                    $('#to_name').val(qData.to_name);
                    $('#to_address').val(qData.to_address);
                    $('#to_acc_no').val(qData.to_acc_no);
                    $('#ct_date').val(qData.ct_date);
                    $('#transfer_amount').val(qData.ct_amount);
                    $('#ct_address').val(qData.ct_address);
                    $('#ct_header').val(qData.ct_header);
                    $('#ct_body').val(qData.ct_message);
                    $('#ct_date').val(qData.ct_date);
                    $('#ct_description').val(qData.ct_description);
                });
                chosenRefresh();
                show_ct_btn();
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


////////////////     BANK MODAL FUNCTIONS /////////////////////////////

function customer_bank_save() {
    var bank_name = $('#bank_name').val();
    var bank_address = $('#bank_address').val();
    if (bank_name.length !== 0) {
        var form_data = {
            bank_name: bank_name,
            bank_address: bank_address
        };
        $.post("models/model_credit_transfer.php", {action: 'add_bank', form_data: form_data}, function (e) {
            alertifyMsgDisplay(e, 2000);
            customer_bank_form_reset();
            show_save_btn();
            customer_bank_table();
        }, 'json');
    } else {
        alert("Enter Bank Name");
    }
}

function customer_bank_form_reset() {
    $('#bank_name').val('');
    $('#bank_address').val('');
    reset_lease_btn();
}

function show_save_btn() {
//   @Sachith
    if (!$('#bank_updtBtn').hasClass('hidden')) {
        $('#bank_updtBtn').addClass('hidden');
    }
    if ($('#bank_saveBtn').hasClass('hidden')) {
        $('#bank_saveBtn').removeClass('hidden');
    }
}

function show_cusbank_upate_btn() {
//   @Sachith
    if ($('#bank_updtBtn').hasClass('hidden')) {
        $('#bank_updtBtn').removeClass('hidden');
    }
    if (!$('#bank_saveBtn').hasClass('hidden')) {
        $('#bank_saveBtn').addClass('hidden');
    }
}

function get_selected_frombank(bank_id) {
    $.post("models/model_credit_transfer.php", {action: 'cus_bank_select', bank_id: bank_id}, function (reply) {
        if (reply === undefined || reply.length === 0 || reply === null) {
            alertify.error("No Data Found", 1000);
        } else {
            $.each(reply, function (index, data) {
                show_cusbank_upate_btn();
                $('#bank_id').val(data.bank_id);
                $('#bank_name').val(data.bank_name);
                $('#bank_address').val(data.bank_address);
                $('#from_bank').val(data.bank_name);
                $('#from_bank_branch').val(data.bank_address);
                customer_bank_form_reset();
            });
            $('#bank_searchModal').modal('hide');
        }
    }, 'json');
}

function get_selected_cusbank(bank_id) {
    $.post("models/model_credit_transfer.php", {action: 'cus_bank_select', bank_id: bank_id}, function (reply) {
        if (reply === undefined || reply.length === 0 || reply === null) {
            alertify.error("No Data Found", 1000);
        } else {
            $.each(reply, function (index, data) {
                show_cusbank_upate_btn();
                $('#bank_id').val(data.bank_id);
                $('#bank_name').val(data.bank_name);
                $('#bank_address').val(data.bank_address);
                $('#to_bank').val(data.bank_name);
                $('#to_bank_branch').val(data.bank_address);
                customer_bank_form_reset();
            });
            $('#bank_searchModal').modal('hide');
        }
    }, 'json');
}



function select_cusbank_update(bank_id) {
    $.post("models/model_credit_transfer.php", {action: 'cus_bank_select', bank_id: bank_id}, function (reply) {
        if (reply === undefined || reply.length === 0 || reply === null) {
            alertify.error("No Data Found", 1000);
        } else {
            $.each(reply, function (index, data) {

                $('#bank_id').val(data.bank_id);
                $('#bank_name').val(data.bank_name);
                $('#bank_address').val(data.bank_address);
                show_cusbank_upate_btn();
            });
        }
    }, 'json');
}

function cusbank_update() {
    var bank_name = $('#bank_name').val();
    var bank_address = $('#bank_address').val();
    var bank_id = $('#bank_id').val();
    if (bank_name.length !== 0) {
        var form_data = {
            bank_name: bank_name,
            bank_address: bank_address,
            bank_id: bank_id
        };
        $.post("models/model_credit_transfer.php", {action: 'cusbank_update', form_data: form_data}, function (e) {
            alertifyMsgDisplay(e, 2000);
            show_save_btn();
            customer_bank_form_reset();
            customer_bank_table();
        }, 'json');
    } else {
        alert("Enter Name");
    }
}

function delete_cusbank(bank_id) {
    confirm("Delete Customer Bank", "Are You Sure Want To Delete This record", "No", "Yes", function () {
        $.post("models/model_credit_transfer.php", {action: 'delete_cus_bank', bank_id: bank_id}, function (e) {
            alertifyMsgDisplay(e, 2000);
            customer_bank_table();
        }, "json");
    });
}


function customer_bank_table() {
    var tableData = '';
    $.post("models/model_credit_transfer.php", {table: "load_cus_bank_tbl"}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            tableData += '<tr><th colspan="5" class="alert alert-warning text-center"> -- No Data Found -- </th></tr>';
            $('.cus_bank_tbl tbody').html('').append(tableData);
        } else {
            $.each(e, function (index, data) {
                index++;
                tableData += '<tr>';
                tableData += '<td style="text-align: center">' + data.bank_name + '</td>';
                tableData += '<td style="text-align: center">' + data.bank_address + '</td>';
                tableData += '<td style="text-align: center"><div>' +
                        '<button class="btn btn-custom-save cus_bank_sel" value="' + data.bank_id + '"><i class="fa fa-hand-o-up fa-sm"></i>&nbsp;</button>' +
                        '<button class="btn btn-custom-light cus_bank_upd" value="' + data.bank_id + '"><i class="fa fa-pencil fa-sm"></i>&nbsp;</button>' +
                        '<button class="btn btn-custom-light cus_bank_del" value="' + data.bank_id + '"><i class="fa fa-trash-o fa-lg"></i>&nbsp;</button>' +
                        '</div></td>';
                tableData += '</tr>';
            });
            $('.cus_bank_tbl tbody').html('').append(tableData);

            $('.cus_bank_sel').click(function () {
                var bank_id = $(this).val();
                get_selected_cusbank(bank_id);
            });
            $('.cus_bank_upd').click(function () {
                var bank_id = $(this).val();
                show_cusbank_upate_btn();
                select_cusbank_update(bank_id);
            });

            $('.cus_bank_del').click(function () {
                delete_cusbank($(this).val());
            });
        }

    }, "json");
}



/////////////////////////////////////////////////////////////////////////////////////////     
//////////////////       SYSTEM BANK FUNCTIONS     (MODAL)        ///////////// 
//////////////////////////////////////////////////////////////////////////////////////

function sys_bank_save() {
    var sysbank_name = $('#sysbank_name').val();
    var sysbank_address = $('#sysbank_address').val();
    var account_name = $('#account_name').val();
    var account_no = $('#account_no').val();
    var address = $('#address').val();
    if (sysbank_name.length !== 0) {
        var form_data = {
            sysbank_name: sysbank_name,
            sysbank_address: sysbank_address,
            account_name: account_name,
            account_no: account_no,
            address: address

        };
        $.post("models/model_credit_transfer.php", {action: 'add_sysbank', form_data: form_data}, function (e) {
            alertifyMsgDisplay(e, 2000);
            sys_bank_form_reset();
            show_sysbsnk_save_btn();
            sys_bank_table();
        }, 'json');
    } else {
        alert("Enter Bank Name");
    }
}

function sys_bank_form_reset() {
    $('#sysbank_name').val('');
    $('#sysbank_address').val('');
    $('#sys_bank_id').val('');
    $('#account_name').val('');
    $('#account_no').val('');
    $('#address').val('');
    reset_lease_btn();
}

function show_sysbsnk_save_btn() {
//   @Ashan
    if (!$('#sys_bank_updtBtn').hasClass('hidden')) {
        $('#sys_bank_updtBtn').addClass('hidden');
    }
    if ($('#sys_bank_saveBtn').hasClass('hidden')) {
        $('#sys_bank_saveBtn').removeClass('hidden');
    }
}

function show_sysbank_update_btn() {
//   @Ashan
    if ($('#sysbank_updtBtn').hasClass('hidden')) {
        $('#sysbank_updtBtn').removeClass('hidden');
    }
    if (!$('#sysbank_saveBtn').hasClass('hidden')) {
        $('#sysbank_saveBtn').addClass('hidden');
    }
}

function get_selected_sysbank(sysbank_id) {
    $.post("models/model_credit_transfer.php", {action: 'sys_bank_select', sysbank_id: sysbank_id}, function (reply) {
        if (reply === undefined || reply.length === 0 || reply === null) {
            alertify.error("No Data Found", 1000);
        } else {
            $.each(reply, function (index, data) {
                show_sysbank_update_btn();
                $('#sys_bank_id').val(data.bank_id);
                $('#sys_bank_name').val(data.bank_name);
                $('#sys_bank_address').val(data.bank_address);
                $('#from_bank').val(data.bank_name);
                $('#from_bank_branch').val(data.bank_address);
                $('#from_name').val(data.account_name);
                $('#from_acc_no').val(data.account_no);
                $('#from_address').val(data.bank_address);
                sys_bank_form_reset();
            });
            $('#sys_bank_searchModal').modal('hide');
        }
    }, 'json');
}


function select_sysbank_update(sysbank_id) {
    $.post("models/model_credit_transfer.php", {action: 'sys_bank_select', sysbank_id: sysbank_id}, function (reply) {
        if (reply === undefined || reply.length === 0 || reply === null) {
            alertify.error("No Data Found", 1000);
        } else {
            $.each(reply, function (index, data) {
                var acc_no = parseInt(data.account_no);
                $('#sys_bank_id').val(data.bank_id);
                $('#sysbank_name').val(data.bank_name);
                $('#sysbank_address').val(data.bank_address);
                $('#account_name').val(data.account_name);
                $('#account_no').val(acc_no);
                $('#address').val(data.address);
                show_sysbank_update_btn();
            });
        }
    }, 'json');
}

function sysbank_update() {
    var sysbank_name = $('#sysbank_name').val();
    var sysbank_address = $('#sysbank_address').val();
    var sysbank_id = $('#sys_bank_id').val();
    var account_name = $('#account_name').val();
    var account_no = $('#account_no').val();
    var address = $('#address').val();

    if (sysbank_name.length !== 0) {
        var form_data = {
            sysbank_name: sysbank_name,
            sysbank_address: sysbank_address,
            sysbank_id: sysbank_id,
            account_name: account_name,
            account_no:account_no,
            address:address
        };
      
        $.post("models/model_credit_transfer.php", {action: 'sysbank_update', form_data: form_data}, function (e) {
            alertifyMsgDisplay(e, 2000);
            show_sysbsnk_save_btn();
            sys_bank_form_reset();
            sys_bank_table();
        }, 'json');
    } else {
        alert("Enter Name");
    }
}


function delete_sysbank(bank_id) {
    confirm("Delete System Bank", "Are You Sure Want To Delete This record", "No", "Yes", function () {
        $.post("models/model_credit_transfer.php", {action: 'delete_sys_bank', sys_bank_id: bank_id}, function (e) {
            alertifyMsgDisplay(e, 2000);
            sys_bank_table();
        }, "json");
    });
}


function sys_bank_table() {
    var tableData = '';
    $.post("models/model_credit_transfer.php", {table: "load_sys_bank_tbl"}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            tableData += '<tr><th colspan="5" class="alert alert-warning text-center"> -- No Data Found -- </th></tr>';
            $('.sys_bank_tbl tbody').html('').append(tableData);
        } else {
            $.each(e, function (index, data) {
                index++;
                tableData += '<tr>';
                tableData += '<td style="text-align: center">' + data.bank_name + '</td>';
                tableData += '<td style="text-align: center">' + data.bank_address + '</td>';
                tableData += '<td style="text-align: center">' + data.account_name + '</td>';
                tableData += '<td style="text-align: center">' + data.account_no + '</td>';
                tableData += '<td style="text-align: center"><div>' +
                        '<button class="btn btn-custom-save sys_bank_sel" value="' + data.bank_id + '"><i class="fa fa-hand-o-up fa-sm"></i>&nbsp;</button>' +
                        '<button class="btn btn-custom-light sys_bank_upd" value="' + data.bank_id + '"><i class="fa fa-pencil fa-sm"></i>&nbsp;</button>' +
                        '<button class="btn btn-custom-light sys_bank_del" value="' + data.bank_id + '"><i class="fa fa-trash-o fa-lg"></i>&nbsp;</button>' +
                        '</div></td>';
                tableData += '</tr>';
            });
            $('.sys_bank_tbl tbody').html('').append(tableData);

            $('.sys_bank_sel').click(function () {
                var bank_id = $(this).val();
                get_selected_sysbank(bank_id);
            });
            $('.sys_bank_upd').click(function () {
                var bank_id = $(this).val();
                show_sysbank_update_btn();
                select_sysbank_update(bank_id);
            });

            $('.sys_bank_del').click(function () {
                delete_sysbank($(this).val());
            });
        }

    }, "json");
}

