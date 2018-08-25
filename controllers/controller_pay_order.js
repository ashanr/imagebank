/////////////////////////////////////////////////////////////////////////////////////////     
////////////////////////        FORM DATA LOADING                        ///////////// 
//////////////////////////////////////////////////////////////////////////////////////


function load_po_info(ct_id, callBack) {
    if (parseInt(ct_id) !== '') {

        $.post("models/model_pay_order.php", {action: 'get_po_info', ct_id: ct_id}, function (e) {

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
                        // $('#transfer_amount').val(qData.ct_amount);
                        $('#ct_address').val(qData.ct_address);
                        $('#ct_header').val(qData.ct_header);
                        $('#ct_body').val(qData.ct_message);
                        $('#ct_date').val(qData.ct_date);
                        $('#ho_name').val(qData.ho_name);
                        $('#ho_nic').val(qData.ho_nic);
                        $('#ct_description').val(qData.ct_description);
                    });
                    chosenRefresh();
                    show_po_update_btn();
                    show_ct_btn();
                    if (callBack !== undefined) {
                        if (typeof callBack === 'function') {
                            callBack();
                        }
                    }
                }
            }, "json");
        });
    } else {
        alertify.error("Invalid selection", 1000);
    }
}
function load_po_total(ct_id, callBack) {
    if (parseInt(ct_id) !== '') {
        $.post("models/model_pay_order.php", {action: 'get_payorder_total', ct_id: ct_id}, function (e) {
            if (e === undefined || e.length === 0 || e === null) {
                alertify.error("No Data Found", 1000);
            } else {
                $.each(e, function (index, qData) {
                    $('#transfer_amount').val(qData.po_total);
                    // $('#po_total_lbl').html(((qData.po_total == null)? '-': "Rs." + qData.po_total));
                    $('#po_total_lbl').html("Rs "+qData.po_total);

//                    if (qData.po_total > 0) {
//                        if ($('#po_save_btn').hasClass('hidden')) {
//                            $('#po_save_btn').removeClass('hidden');
//                        }
//
//
//                    }
                });
            }
        }, "json");
    }
}

function show_po_update_btn() {
//   @Ashan
    if ($('#po_update_btn').hasClass('hidden')) {
        $('#po_update_btn').removeClass('hidden');
    }
    if (!$('#po_save_btn').hasClass('hidden')) {
        $('#po_save_btn').addClass('hidden');
    }
}

//function show_po_comp_btn() {
//    if ($('#po_save_btn').hasClass('hidden')) {
//        $('#po_save_btn').removeClass('hidden');
//    }

/////////////////////////////////////////////////////////////////////////////////////////     
////////////////////////        END                                    ///////////// 
//////////////////////////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////////////////////////////     
////////////////////////        FORM DATA LOADING                   ///////////// 
//////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////////     
////////////////////////         COMBO DATA LOADING                   ///////////// 
//////////////////////////////////////////////////////////////////////////////////////


// developed by Ashan
    function load_pay_order_vehicle_combo(selected, callBack, vh_id) {

//@ Load Vehicles 
        var comboData = '';
        $.post("models/model_pay_order.php", {comboBox: 'load_vehicle_code_combo'}, function (e) {
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




///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////                 END!                         ///////////// 
//////////////////////////////////////////////////////////////////////////////////////




///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////          FORM DATA SAVE,UPDATE,CANCEL        ///////////// 
//////////////////////////////////////////////////////////////////////////////////////

    function po_save(ct_id, vehicles) {
//@Ashan
        var ct_id = $('#ct_id').val();
        var ref_no = $('#ref_no').val();
        var ct_type = 'pay_order';
        var from_bank = $('#from_bank').val();
        var from_bank_branch = $('#from_bank_branch').val();
        var from_name = $('#from_name').val();
        var from_address = $('#from_address').val();
        var from_acc_no = $('#from_acc_no').val();
        var to_bank = $('#to_bank').val();
        var to_bank_branch = $('#to_bank_branch').val();
        var to_name = $('#to_name').val();
        var to_address = $('#to_address').val();
        var to_acc_no = $('#to_acc_no').val();
        var ct_date = $('#ct_date').val();
        var ct_amount = $('#transfer_amount').val();
        var ct_address = $('#ct_address').val();
        var ct_header = $('#ct_header').val();
        var ct_body = $('#ct_body').val();
        var ct_description = $('#ct_description').val();
        var ho_name = $('#ho_name').val();
        var ho_nic = $('#ho_nic').val();
        if (parseInt(ct_id) !== 0) {
        }

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
            to_address: to_address,
            to_acc_no: to_acc_no,
            ct_date: ct_date,
            ct_amount: ct_amount,
            ct_address: ct_address,
            ct_header: ct_header,
            ct_body: ct_body,
            ct_description: ct_description,
            ho_name: ho_name,
            ho_nic: ho_nic,
            ho_name:ho_name,
                    ho_nic:ho_nic
        }
        $.post("models/model_pay_order.php", {action: 'add_pay_order', form_data: form_data}, function (reply) {
            //  reset_credit_transfer();
            //  next_ai_ct();
            alertifyMsgDisplay(reply, 2000);
            /*  if (reply.msgType === 1) {
             
             if (parseInt(reply.resp() > 0)) {
             submitSingleDataByPostSpecial("pay_order.php", "ct_id", reply.resp, "tab", "2");
             }
             } else {
             alertify.error(reply.msg, 2000);
             }
             
             */

            setTimeout(function () {
                window.location = 'view_ctpo_list.php';
            }, 3000);


//                clear_payment_fields();
//                vh_payments(vh_id);
//                get_vehicle_paidamount(vh_id);

        }, 'json');

    }



    function po_update() {
        var ct_id = $('#ct_id').val();
        var ref_no = $('#ref_no').val();
        var ct_type = 'pay_order';
        var from_bank = $('#from_bank').val();
        var from_bank_branch = $('#from_bank_branch').val();
        var from_name = $('#from_name').val();
        var from_address = $('#from_address').val();
        var from_acc_no = $('#from_acc_no').val();
        var to_bank = $('#to_bank').val();
        var to_bank_branch = $('#to_bank_branch').val();
        var to_name = $('#to_name').val();
        var to_address = $('#to_address').val();
        var to_acc_no = $('#to_acc_no').val();
        var ct_date = $('#ct_date').val();
        var transfer_amount = $('#transfer_amount').val();
        var ct_address = $('#ct_address').val();
        var ct_header = $('#ct_header').val();
        var ct_body = $('#ct_body').val();
        var ho_name = $('#ho_name').val();
        var ho_nic = $('#ho_nic').val();
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
                to_address: to_address,
                to_acc_no: to_acc_no,
                ct_date: ct_date,
                ct_amount: transfer_amount,
                ct_address: ct_address,
                ct_header: ct_header,
                ct_body: ct_body,
                ct_description: ct_description,
                ho_name: ho_name,
                ho_nic: ho_nic
            };
            $.post("models/model_pay_order.php", {action: 'po_update', form_data: form_data}, function (e) {
                //  alert(e);
                alertifyMsgDisplay(e, 2000);
                //reset_credit_transfer();
                setTimeout(function () {
                    submitSingleDataByPost("po_letterPrint.php", "ct_id", ct_id);
                }
                , 3000);
                /*     setTimeout(function () {
                 window.location = 'view_ctpo_list.php';
                 }, 3000);
                 
                 */
            }, 'json');
        } else {
            alert("Please Check the fields");
        }
    }


///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////                 END!                         ///////////// 
//////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////           PAGE'S TABLE LOADING               ///////////// 
//////////////////////////////////////////////////////////////////////////////////////


    function load_po_vh_list(ct_id) {
        //@Ashan

        var tableData = '';
        $.post("models/model_pay_order.php", {table: "pay_order_vh_list", ct_id: ct_id}, function (e) {
            if (e === undefined || e.length === 0 || e === null) {
                tableData += '<tr><th colspan="2" class="alert alert-warning text-center"> -- No Data Found -- </th></tr>';
                $('.po_vh_list tbody').html('').append(tableData);
            } else {
                $.each(e, function (index, qData) {
                    index++;
                    tableData += '<tr>';
                    tableData += '<td width="15%">' + qData.vh_id + '</td>';
                    tableData += '<td width="25%">' + qData.vh_code + '</td>';
                    tableData += '<td width="30%" style="text-float:right">' + 'RS.' + qData.ct_item_amount + '</td>';
                    tableData += '<td><div class="btn-group"><button class="btn btn-custom-save ct_item_id" value="' + qData.ct_item_id + '"><i class="fa fa-pencil fa-sm"></i>&nbsp;Edit</button><button class="btn btn-custom-light del_maker" value="' + qData.ct_item_id + '"><i class="fa fa-trash-o fa-lg"></i>&nbsp;Delete</button></div></td>';

                    tableData += '</tr>';
                });
                $('.po_vh_list tbody').html('').append(tableData);
                tableSorter('.po_vh_list');
                // TABLE ACTION BUTTONS
                //UPDATE

                $('.ct_item_id').click(function () {
                    select_po_item_amount($(this).val());
                });

                //DELETE
                $('.del_maker').click(function () {
                    delete_po_item($(this).val());
                });
            }
        }, "json");

    }

///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////                 END!                         ///////////// 
//////////////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////////////     
////////////////////         Pay Order Item SAVE,UPDATE,CANCEL        ///////////// 
//////////////////////////////////////////////////////////////////////////////////////


    function select_po_item_amount(ct_item_id) {
//@Sachith 
        if (parseInt(ct_item_id) !== 0) {
            $.post("models/model_pay_order.php", {action: 'get_po_item_info', ct_item_id: ct_item_id}, function (e) {
                if (e === undefined || e.length === 0 || e === null) {
                    alertify.error("No Data Found", 1000);
                } else {
                    show_maker_btn();
                    $.each(e, function (index, qData) {
                        // $('#vehicle_code_combo').val(qData.vh_id);
                        $('#vh_amount').val(qData.ct_item_amount);
                        $('#po_item_id_tbx').val(qData.ct_item_id);
                        show_item_update();
                        load_pay_order_vehicle_combo(qData.vh_id);
                        chosenRefresh();
                    });
                }
            }, "json");
        } else {
            alertify.error("Invalid Vehicle selection", 1000);
        }
    }



    function po_item_save(po_item_id) {

        var ct_id = $('#ct_id').val();
        var po_item_data = {
            ct_id: $('#ct_id').val(),
            ref_no: $('#ref_no').val(),
            vh_id: $('#vehicle_code_combo').val(),
            ct_amount: $('#transfer_amount').val(),
            ct_item_desc: $('#ct_description').val(),
            vh_amount: $('#vh_amount').val()
        };
        $.post('models/model_pay_order.php', {action: 'po_item_save', po_item_data: po_item_data}, function (e) {
            alertifyMsgDisplay(e, 2000);

            /*   if (e.msgType =='1') {
             alertify.success(e,2000);
             
             }else{
             alertify.error(e,10000);
             }
             */
            load_po_total(ct_id);
            load_po_vh_list(ct_id);
            clear_ct_item();
        }, 'json');
    }

    function po_item_update(po_item_id) {
        var ct_id = $('#ct_id').val();
        var po_item_data = {
            ct_id: $('#ct_id').val(),
            ref_no: $('#ref_no').val(),
            vh_id: $('#vehicle_code_combo').val(),
            ct_amount: $('#transfer_amount').val(),
            ct_item_desc: $('#ct_description').val(),
            vh_amount: $('#vh_amount').val()
        };
        $.post('models/model_pay_order.php', {action: 'po_item_update', po_item_data: po_item_data, po_item_id: po_item_id}, function (e) {
            alertifyMsgDisplay(e, 2000);
            //  load_po_vh_list(ct_id);
            show_item_save();
            load_po_vh_list(ct_id);
            clear_ct_item();
        }, 'json');
    }
    function delete_po_item(po_item_id) {
//@Ashan
        var ct_id = $('#ct_id').val();
        confirm("Delete Vehicle", "Are You Sure Want To Delete This record", "No", "Yes", function () {
            $.post("models/model_pay_order.php", {action: 'delete_po_item', po_item_id: po_item_id}, function (e) {
                alertifyMsgDisplay(e, 2000);
                load_po_vh_list(ct_id);
                load_po_total(ct_id);
                clear_ct_item();
            }, "json");
        });
    }


    function clear_ct_item() {

        $('#vh_amount').val('');
    }

    function show_item_update() {
        if ($('#update_vh_amount').hasClass('hidden')) {
            $('#update_vh_amount').removeClass('hidden');
        }
        if (!$('#add_toRef_btn').hasClass('hidden')) {
            $('#add_toRef_btn').addClass('hidden');
        }
    }

    function show_item_save() {
        if ($('#add_toRef_btn').hasClass('hidden')) {
            $('#add_toRef_btn').removeClass('hidden');
        }
        if (!$('#update_vh_amount').hasClass('hidden')) {
            $('#update_vh_amount').addClass('hidden');
        }
}


///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////                 END!                         ///////////// 
//////////////////////////////////////////////////////////////////////////////////////



