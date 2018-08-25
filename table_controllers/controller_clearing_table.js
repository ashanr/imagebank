function load_clearing_table(callback, serch_text) {
    var supp_id = $('#cmb_supp').val();
    var stock_status = $('#cmb_stock_status').val();
    var send_val = {table: "load_view_clearing_tbl", supp_id: supp_id, stock_status: stock_status}
    if (serch_text !== undefined) {
        send_val.serch_text = serch_text.trim();
    }
    //@Ashan
    var tableData = '';

    $.post("table_models/model_clearing_table.php", send_val, function (e) {
      //  alert(e);
        if (e === undefined || e.length === 0 || e === null) {
            tableData += '<tr><th colspan="22" class="alert alert-warning text-center"> -- No Data Found -- </th></tr>';
            $('.view_clering_table tbody').html('').append(tableData);
        } else {
            $.each(e, function (index, qData) {
//                qData.color_group

                index++;
                tableData += '<tr ';
                if (qData.color_group != null && qData.color_group.length > 0) {
                    tableData += ' style="background-color:#' + qData.color_group + ';"';
                }
                tableData += '>';
                tableData += '<td>';
                tableData += '<div class="btn-group"><button class="btn btn-custom-light btn-xs sel_order_id" value="' + qData.vh_id + "~" + qData.clr_id + '" data-toggle="tooltip" data-placement="bottom" title="Edit Vehicle"><i class="fa fa-pencil fa-sm"></i>&nbsp;</button>'
                        + '<button class="btn btn-custom-save btn-xs veiw_details_ex" value="' + qData.vh_id + '" data-toggle="tooltip" data-placement="bottom" title="View Details"><i class="fa fa-external-link"></i>&nbsp;</button></div>';
//                <button class="btn "> <i class="fa fa-external-link"></i></button>
                tableData += '</td>';
                tableData += '<td><input type="checkbox" class="checkBX" value="' + qData.vh_id + '" data-toggle="tooltip" data-placement="top" title="Select Record">&nbsp;</td>';
                tableData += '<td>' + qData.vh_index_num + '</td>';
//                tableData += '<td>' + qData.supp_name + '</td>';
                tableData += '<td>' +   qData.vh_code + '</td>';
                tableData += '<td>' +   qData.supp_name + '</td>';
                tableData += '<td>' +   qData.maker_name + '</td>';
                tableData += '<td>' +   qData.mod_name + '</td>';
                tableData += '<td>' +   qData.vh_chassis_num + '</td>';
                tableData += '<td>' +   qData.engine_cc + '</td>';
                tableData += '<td>' + ((qData.shipped_date == null) ? '-' : qData.shipped_date) + '</td>';
                tableData += '<td>' + ((qData.vessel == null) ? '-' : qData.vessel) + '</td>';
                tableData += '<td>' + ((qData.refunds == null) ? '-' : qData.refunds) + '</td>';
                tableData += '<td>' + ((qData.arrival_date == null) ? '-' : qData.arrival_date) + '</td>';
                tableData += '<td>' + ((qData.document_status == null) ? '-' : qData.document_status) + '</td>';
                tableData += '<td>' + ((qData.to_clr_agent == null) ? '-' : qData.to_clr_agent) + '</td>';
                tableData += '<td>' + ((qData.duty == null) ? '-' : qData.duty) + '</td>';
                tableData += '<td>' + ((qData.clr_date == null) ? '-' : qData.clr_date) + '</td>';
                tableData += '<td>' + ((qData.transporter_name == null) ? '-' : qData.transporter_name) + '</td>';
                tableData += '<td>' + ((qData.lc_no == null) ? '-' : qData.lc_no) + '</td>';
                tableData += '</tr>';
            });
            $('.view_clearing_table tbody').html('').append(tableData);

            // CLEARING TABLE ACTION BUTTONS
            //SELECT
            $('.sel_order_id').click(function () {
                var xx = $(this).val();
                var split_val = xx.split("~");

                load_clearing_edit(split_val[0], split_val[1]);
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

/*
 * REPLACED BY JQuery DATA TABLE FILTERING OPTION
 * 
 * 
 function clearing_keyword_search(callback) {
 //@Ashan
 var search_entered = $('#txt_search_key').val();
 var key_arr = search_entered.split(" ");
 
 var tableData = '';
 if (key_arr.length > 0) {
 
 $.post("views/loadTables.php", {table: "view_vehicle_clearing_keyword_search", key_arr: key_arr}, function (e) {
 if (e === undefined || e.length === 0 || e === null) {
 tableData += '<tr><th colspan="22" class="alert alert-warning text-center"> -- No Data Found -- </th></tr>';
 $('.view_clearing_table tbody').html('').append(tableData);
 } else {
 $.each(e, function (index, qData) {
 
 index++;
 tableData += '<tr ';
 if (qData.color_group != null && qData.color_group.length > 0) {
 tableData += ' style="background-color:#' + qData.color_group + ';"';
 }
 tableData += '>';
 tableData += '<td>';
 tableData += '<div class="btn-group"><button class="btn btn-custom-light btn-xs sel_order_id" value="' + qData.vh_id + "~" + qData.clr_id + '" data-toggle="tooltip" data-placement="bottom" title="Edit Vehicle"><i class="fa fa-pencil fa-sm"></i>&nbsp;</button>'
 + '<button class="btn btn-custom-save btn-xs veiw_details_ex" value="' + qData.vh_id + '" data-toggle="tooltip" data-placement="bottom" title="View Details"><i class="fa fa-external-link"></i>&nbsp;</button></div>';
 //                <button class="btn "> <i class="fa fa-external-link"></i></button>
 tableData += '</td>';
 tableData += '<td><input type="checkbox" class="checkBX" value="' + qData.vh_id + '" data-toggle="tooltip" data-placement="top" title="Select Record">&nbsp;</td>';
 tableData += '<td>' + qData.vh_index_num + '</td>';
 //                tableData += '<td>' + qData.supp_name + '</td>';
 tableData += '<td>' + qData.vh_code + '</td>';
 tableData += '<td>' + qData.supp_name + '</td>';
 tableData += '<td>' + qData.maker_name + '</td>';
 tableData += '<td>' + qData.mod_name + '</td>';
 tableData += '<td>' + qData.vh_chassis_num + '</td>';
 tableData += '<td>' + qData.engine_cc + '</td>';
 tableData += '<td>' + ((qData.shipped_date == null) ? '-' : qData.shipped_date) + '</td>';
 tableData += '<td>' + ((qData.vessel == null) ? '-' : qData.vessel) + '</td>';
 tableData += '<td>' + ((qData.refunds == null) ? '-' : qData.refunds) + '</td>';
 tableData += '<td>' + ((qData.arrival_date == null) ? '-' : qData.arrival_date) + '</td>';
 tableData += '<td>' + ((qData.document_status == null) ? '-' : qData.document_status) + '</td>';
 tableData += '<td>' + ((qData.to_clr_agent == null) ? '-' : qData.to_clr_agent) + '</td>';
 tableData += '<td>' + ((qData.duty == null) ? '-' : qData.duty) + '</td>';
 tableData += '<td>' + ((qData.clr_date == null) ? '-' : qData.clr_date) + '</td>';
 tableData += '<td>' + ((qData.transporter_name == null) ? '-' : qData.transporter_name) + '</td>';
 tableData += '<td>' + ((qData.lc_no == null) ? '-' : qData.lc_no) + '</td>';
 tableData += '</tr>';
 });
 $('.view_clearing_table tbody').html('').append(tableData);
 
 // TABLE ACTION BUTTONS
 //SELECT
 $('.sel_order_id').click(function () {
 var xx = $(this).val();
 var split_val = xx.split("~");
 
 load_clearing_edit(split_val[0], split_val[1]);
 });
 //VIEW DETAILS
 $('.veiw_details_ex').click(function () {
 submitSingleDataByPost('vehicle_single_view.php', 'veh_id', $(this).val());
 });
 //DELETE
 $('.del_maker').click(function () {
 });
 }
 $('.vh_view_pg').html('');
 if ($.type(callback) === 'function') {
 callback();
 }
 }, "json");
 
 } else {
 alertify.error("Enter keywords", 2000);
 }
 }
 
 */