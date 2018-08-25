function load_vehicle_sales_table(user_level, serch_text, callback) {
    //@AShan
    var sell_status = $('#cmb_sales_status').val();
    var send_val = {table: "load_view_vehicle_sales_tbl", sell_status: sell_status}
    if (serch_text !== undefined) {
        send_val.serch_text = serch_text.trim();
    }

    var tableData = '';
    $.post("table_models/model_sales_list.php", send_val, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            tableData += '<tr><th colspan="22" class="alert alert-warning text-center"> -- No Data Found -- </th></tr>';
            $('.view_sales_table tbody').html('').append(tableData);
        } else {
            $.each(e, function (index, qData) {
                index++;
                tableData += '<tr ';
                if (qData.color_group != null && qData.color_group.length > 0) {
                    tableData += ' style="background-color:#' + qData.color_group + ';"';
                }


                tableData += '>';
                tableData += '<td>';
                tableData += '<div class="btn-group"><button class="btn btn-custom-light btn-xs sel_order_id " value="' + qData.sales_id + '" data-toggle="tooltip" data-placement="bottom" title="Edit Vehicle"><i class="fa fa-pencil fa-sm"></i>&nbsp;</button>'
                        + '<button class="btn btn-custom-save btn-xs veiw_details "  value="' + qData.sales_id + '" data-toggle="tooltip" data-placement="bottom" title="View Details"><i class="fa fa-external-link"></i>&nbsp;</button></div>'
                        + '<button class="btn btn-warning btn-xs btn-custom-print-view print_last_bill" value="' + qData.vh_id + '" data-toggle="tooltip" data-placement="bottom" title="View Printable Version" ><i class="fa fa-print" ></i>&nbsp;</button></td>';

                //                <button class="btn "> <i class="fa fa-external-link"></i></button>
                tableData += '</td>';
                tableData += '<td><input type="checkbox" class="checkBX" value="' + qData.vh_id + '" data-toggle="tooltip" data-placement="top" title="Select Record">&nbsp;</td>';
                tableData += '<td>' + qData.vh_index_num + '</td>';
                tableData += '<td>' + qData.vh_code + '</td>';
                tableData += '<td class="text-right">' + qData.selling_price + '</td>';
                tableData += '<td>' + qData.sold_date + '</td>';
                tableData += '<td class="text-right">' + qData.current_milage + '</td>';
                tableData += '<td class="text-right">' + qData.vh_milage + '</td>';
                tableData += '<td>' + qData.maker_name + '</td>';
                tableData += '<td class="text-right">' + qData.engine_cc + '</td>';
                tableData += '<td>' + qData.coordinator_name + '</td>';
                tableData += '<td style="font-size:16px;background-color:#f2f0f0" align="right">' + qData.sold_price + '</td>';

                tableData += '</tr>';

            });
            $('.view_sales_table tbody').html('').append(tableData);

            // TABLE ACTION BUTTONS
            //SELECT
            $('.sel_order_id').click(function () {
                load_vhsale_edit($(this).val());
            });
            //PRINT
            $('.print_last_bill').click(function () {
                load_vhsale_print($(this).val());
            });
            //DELETE
            $('.view_details').click(function () {
            });
        }
        if ($.type(callback) === 'function') {
            callback();
        }

    }, "json");
}

function load_vhsale_edit(sales_id) {
    var win = window.open('vehicle_sales_entry.php?sales_id=' + sales_id, '_blank');
    win.focus();
}

function load_vhsale_print(vh_id) {
    var win = window.open('last_bill_print.php?vh_id=' + vh_id, '_blank');
    win.focus();
}

function sales_keyword_table(callback) {
    //@AShan
    var search_entered = $('#txt_search_key').val();
    var key_arr = search_entered.split(" ");
    var sell_status = $('#cmb_sales_status').val();
    var tableData = '';

    $.post("table_models/model_sales_list.php", {table: "sales_keyword_tbl", sell_status: sell_status, key_arr: key_arr}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            tableData += '<tr><th colspan="22" class="alert alert-warning text-center"> -- No Data Found -- </th></tr>';
            $('.view_sales_table tbody').html('').append(tableData);
        } else {
            $.each(e, function (index, qData) {
                index++;
                tableData += '<tr ';
                if (qData.color_group != null && qData.color_group.length > 0) {
                    tableData += ' style="background-color:#' + qData.color_group + ';"';
                }
                tableData += '>';
                tableData += '<td>';
                tableData += '<div class="btn-group"><button class="btn btn-custom-light btn-xs sel_order_id" value="' + qData.sales_id + '" data-toggle="tooltip" data-placement="bottom" title="Edit Vehicle"><i class="fa fa-pencil fa-sm"></i>&nbsp;</button>'
                        + '<button class="btn btn-custom-save btn-xs veiw_details_ex" value="' + qData.sales_id + '" data-toggle="tooltip" data-placement="bottom" title="View Details"><i class="fa fa-external-link"></i>&nbsp;</button></div>';
//                <button class="btn "> <i class="fa fa-external-link"></i></button>
                tableData += '</td>';
                tableData += '<td><input type="checkbox" class="checkBX" value="' + qData.sales_id + '" data-toggle="tooltip" data-placement="top" title="Select Record">&nbsp;</td>';
                tableData += '<td>' + qData.vh_index_num + '</td>';
//                tableData += '<td>' + qData.supp_name + '</td>';
                tableData += '<td>' + qData.vh_code + '</td>';
                tableData += '<td>' + qData.selling_price + '</td>';
                tableData += '<td>' + qData.sold_price + '</td>';
                tableData += '<td>' + qData.shipped_date + '</td>';
                tableData += '<td>' + qData.current_milage + '</td>';
                tableData += '<td>' + qData.vh_milage + '</td>';
                tableData += '<td>' + qData.maker_name + '</td>';
                tableData += '<td>' + qData.engine_cc + '</td>';
                tableData += '<td>' + qData.auc_real_price + '</td>';
                tableData += '<td>' + qData.coordinator_name + '</td>';
                tableData += '</tr>';
            });
            $('.view_sales_table tbody').html('').append(tableData);

            // TABLE ACTION BUTTONS
            //SELECT
            $('.sel_order_id').click(function () {
                load_vhsale_edit($(this).val());
            });
            //DETAILS
            $('.veiw_details_ex').click(function () {
                submitSingleDataByPost('vehicle_single_view.php', 'veh_id', $(this).val());
            });
            //DELETE
            $('.del_maker').click(function () {
            });
        }
        if ($.type(callback) === 'function') {
            callback();
        }

    }, "json");
}

function vhcle_payment_model_table(callback) {
    if (isNaN(parseInt($('#vh_id').val()))) {
        alertify.error('Invalid', 2500);
        return;
    }
    var tableData = '';
    $.post("table_models/model_sales_list.php", {table: "vhcle_payment_model_table", veh_id: parseInt($('#vh_id').val())}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            tableData += '<tr><th colspan="3" class="alert alert-warning text-center"> -- No Data Found -- </th></tr>';
        } else {
            $.each(e, function (index, qData) {
                index++;
                tableData += '<tr>';
                tableData += '<td>' + qData.payment_date + ' :: ' + qData.time + '</td>';
                tableData += '<td class="text-right">' + parseFloat(qData.amount).toFixed(2) + '</td>';
                tableData += '<td class=""><button class="btn btn-custom-light btn-xs rem_paymnt" value="' + qData.payment_id + '" data-toggle="tooltip" title="Cancel Payment"><i class="fa fa-times fa-sm"></i>&nbsp;</button></td>';
                tableData += '</tr>';
            });
        }
        $('#paymnt_detail_model_table tbody').html(tableData);

        if ($.type(callback) === 'function') {
            callback();
        }
    }, "json");
}

