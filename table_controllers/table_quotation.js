function load_quotation_table(serch_text, callBack) {
    var customer_id = $('.customer_ComboBox').val();
    var send_val = {table: "load_quotation_tbl", customer_id: customer_id}
    //@Ashan 
    if (serch_text !== undefined) {
        send_val.serch_text = serch_text.trim();
    }
    var tableData = '';
    $.post("table_models/table_quotation.php", send_val, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            tableData += '<tr><th colspan="18" class="alert alert-warning text-center"> -- No Data Found -- </th></tr>';
            $('.quotation_table tbody').html('').append(tableData);
        } else {
            $.each(e, function (index, qData) {
                index++;
                tableData += '<tr>';
                tableData += '<td>' + ((qData.invoce_no == null) ? '-' : qData.q_id) + '</td>';
                tableData += '<td>' + ((qData.invoce_no == null) ? '-' : qData.invoce_no) + '</td>';
                tableData += '<td>' + ((qData.customer_name == null) ? '-' : qData.customer_name) + '</td>';
                tableData += '<td>' + ((qData.phone_no == null) ? '-' : qData.phone_no) + '</td>';
                tableData += '<td class="text-right">' + ((qData.vehicle_price == null) ? '-' : qData.vehicle_price) + '</td>';
                tableData += '<td class="text-right">' + ((qData.balance == null) ? '-' : qData.balance) + '</td>';


                tableData += '<td> <button class="btn btn-custom-light btn-xs sel_quotation_id" value="' + qData.q_id + '" data-toggle="tooltip" data-placement="bottom" title="Edit CT/PO"><i class="fa fa-pencil fa-sm"></i>Go to This Quotation&nbsp;</button></td>';
                tableData += '<div class="btn-group">';

//                tableData += '<td> <button class="btn btn-custom-save sel_ct_id" value="' + qData.ct_id + '"><i class="fa fa-pencil fa-sm"></i>&nbsp;</button>';
//                tableData += '<button class="btn btn-custom-light btn-sm del_transfer" value="' + qData.ct_id + '"><i class="fa fa-trash-o"></i></button>';
//                tableData += '<button class="btn btn-custom-light btn-sm print_ct_letter" data-invtype="' + qData.ct_id + '" value="' + qData.ct_id + '"><i class="fa fa-print"></i></button></td>';
//                tableData += '<div class="btn-group">';


                tableData += '</div>';
                tableData += '</td>';
                tableData += '</tr>';
            });
            $('.quotation_table tbody').html('').append(tableData);
            // TABLE ACTION BUTTONS
            //SELECT
            $('.sel_quotation_id').click(function () {
                load_quotation_edit($(this).val());
            });
            //DETAILS
            $('.veiw_details_ex').click(function () {
                submitSingleDataByPost('vehicle_single_view.php', 'veh_id', $(this).val());
            });
            //DELETE
            $('.del_transfer').click(function () {
                delete_transfer($(this).val());

            });


        }
        if (callBack !== undefined) {
            if (typeof callBack === 'function') {
                callBack();
            }
        }

    }, "json");
}

function load_vehcle_list_table(callBack) {
    //@Cholitha 
    var status_id = $('.status_ComboBox').val();
    var tableData = '';
    $.post("views/loadTables.php", {table: "load_vehcle_list_table", status_id: status_id}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            tableData += '<tr><th colspan="18" class="alert alert-warning text-center"> -- No Data Found -- </th></tr>';
            $('.veh_registration_list tbody').html('').append(tableData);
        } else {
            $.each(e, function (index, qData) {
                index++;
                tableData += '<tr>';
                tableData += '<td>' + index + '</td>';
                tableData += '<td>' + ((qData.ref_no == null) ? '-' : qData.ref_no) + '</td>';
                tableData += '<td>' + ((qData.vh_code == null) ? '-' : qData.vh_code) + '</td>';
                tableData += '<td>' + ((qData.co_odintr_id == null) ? '-' : qData.co_odintr_id) + '</td>';
                tableData += '<td>' + ((qData.cus_name == null) ? '-' : qData.cus_name) + '</td>';
                tableData += '<td>' + ((qData.number == null) ? '-' : qData.number) + '</td>';
                tableData += '<td>' + ((qData.status == null) ? '-' : qData.status) + '</td>';
                tableData += '<td>' + ((qData.to_rmb_officer == null) ? '-' : qData.to_rmb_officer) + '</td>';
                tableData += '<td>' + ((qData.cr_received_date == null) ? '-' : qData.cr_received_date) + '</td>';
                tableData += '<td>' + ((qData.cr_to_customer == null) ? '-' : qData.cr_to_customer) + '</td>';
                tableData += '<td>' + ((qData.plates_to_customer == null) ? '-' : qData.plates_to_customer) + '</td>';
                tableData += '<td>' + ((qData.submit_status == null) ? '-' : qData.submit_status) + '</td>';
                tableData += '<td> <button class="btn btn-custom-light btn-xs sel_quotation_id" value="' + qData.reg_id + '" data-toggle="tooltip" data-placement="bottom" title="Edit CT/PO"><i class="fa fa-pencil fa-sm"></i>Go to This Quotation&nbsp;</button></td>';
                tableData += '</td>';
                tableData += '</tr>';
            });
            $('.veh_registration_list tbody').html('').append(tableData);
            // TABLE ACTION BUTTONS
            //SELECT
            //DETAILS
            //DELETE
        }
        if (callBack !== undefined) {
            if (typeof callBack === 'function') {
                callBack();
            }
        }

    }, "json");
}

function load_quotation_edit(q_id) {
    var win = window.open('form_quotation.php?q_id=' + q_id, '_blank');
    win.focus();
}


function load_quotation_customer(text, callBack) {
    var tableData = '';
    $.post("table_models/table_quotation.php", {table: 'customer_search_result', text: text}, function (e) {
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
                tableData += '<td><div class="btn-group"><button class="btn btn-custom-save sel_customer" value="' + qData.cus_id + '"><i class="fa fa-hand-o-up fa-lg"></i>&nbsp;Select</button></div></td>';
                tableData += '</tr>';
            });
            $('.cus_search_result tbody').html('').append(tableData);

            $('.sel_customer').click(function () {
                var cus_id = $(this).val();
                $('#cus_id').val($(this).val());
                quotation_select_customer(cus_id);
                // chosenRefresh();
            });

        }
        if (callBack !== undefined) {
            if (typeof callBack === 'function') {
                callBack();
            }
        }
    }, 'json');
}



function show_customer_btn() {

    if ($('#c_update_btn').hasClass('hidden')) {
        $('#c_update_btn').removeClass('hidden');
    }
    if (!$('#c_add_btn').hasClass('hidden')) {
        $('#c_add_btn').addClass('hidden');
    }
}


function search_customer(text, callBack) {
    var tableData = '';
    $.post("table_models/table_quotation.php", {table: 'customer_search_res', text: text}, function (e) {
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
                $('.customer_ComboBox').val($(this).val());

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

function quotation_select_customer(cus_id) {
    $.post('models/model_quotation.php', {action: 'select_customer_for_quotation', cus_id: cus_id}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            alertify.error('Error in customer selection.', 2000);
        } else {
            $.each(e, function (index, data) {
                $('#save_btn').removeClass('hidden');
                $('#update_btn').addClass('hidden');
                $('#cus_name').val(data.cus_name);
                $('#address').val(data.cus_address);
                $('#phone_no').val(data.cus_phone1);
//                $('#vehicle_year').val(data.cus_phone1);

            });
            $('#cus_searchModal').modal('hide');
        }
    }, 'json');
}