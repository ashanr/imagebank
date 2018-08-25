
function load_vehicle_table(page, callback) {
    //@Sampath 
    var supp_id = $('#cmb_supp').val();
    var stock_status = $('#cmb_stock_status').val();
    var records = $('#page_records').val();
    var tableData = '';
    if (page === undefined || isNaN(parseInt(page)) || parseInt(page) <= 0) {
        page = 1;
    }
    $.post("views/loadTables.php", {table: "load_view_vehicle_tbl", supp_id: supp_id, stock_status: stock_status, page: page, records: records}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            tableData += '<tr><th colspan="22" class="alert alert-warning text-center"> -- No Data Found -- </th></tr>';
            $('.view_vh_table tbody').html('').append(tableData);
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
                tableData += '<div class="btn-group"><button class="btn btn-custom-light btn-xs sel_order_id" value="' + qData.vh_id + '" data-toggle="tooltip" data-placement="bottom" title="Edit Vehicle"><i class="fa fa-pencil fa-sm"></i>&nbsp;</button>'
                        + '<button class="btn btn-custom-save btn-xs veiw_details_ex" value="' + qData.vh_id + '" data-toggle="tooltip" data-placement="bottom" title="View Details"><i class="fa fa-external-link"></i>&nbsp;</button></div>';
//                <button class="btn "> <i class="fa fa-external-link"></i></button>
                tableData += '</td>';
                tableData += '<td><input type="checkbox" class="checkBX" value="' + qData.vh_id + '" data-toggle="tooltip" data-placement="top" title="Select Record">&nbsp;</td>';
                tableData += '<td>' + qData.vh_index_num + '</td>';
//                tableData += '<td>' + qData.supp_name + '</td>';
                tableData += '<td>' + ((qData.vh_code)==null?'-':qData.vh_code) + '</td>';
                tableData += '<td>' + qData.supp_name + '</td>';
                tableData += '<td>' + qData.maker_name + '</td>';
                tableData += '<td>' + qData.mod_name + '</td>';
                tableData += '<td>' + qData.vh_chassis_code + '</td>';
                tableData += '<td>' + qData.vh_chassis_num + '</td>';
                tableData += '<td>' + qData.engine_code + '</td>';
                tableData += '<td>' + qData.engine_num + '</td>';
                tableData += '<td>' + qData.engine_cc + '</td>';
                tableData += '<td>' + qData.package + '</td>';
                tableData += '<td>' + qData.vh_year + '</td>';
                tableData += '<td>' + qData.vh_color + '</td>';
                tableData += '<td>' + qData.vh_milage + '</td>';
                tableData += '<td>' + qData.vh_options + '</td>';
                tableData += '<td>' + qData.additional_options + '</td>';
                tableData += '<td>' + qData.bid_date + '</td>';
                tableData += '<td>' + qData.auction_name + '</td>';
                tableData += '<td>' + qData.auction_grade + '</td>';
//                tableData += '<td>' + qData.lot_no + '</td>';
//                tableData += '<td>' + qData.auc_display_price + '</td>';
//                tableData += '<td>' + qData.stock_location + '</td>';
//                tableData += '<td>' + qData.short_name + '</td>';
                tableData += '</tr>';
            });
            $('.view_vh_table tbody').html('').append(tableData);

            // TABLE ACTION BUTTONS
            //SELECT
            $('.sel_order_id').click(function () {
                load_vh_edit($(this).val());
            });
            //DETAILS
            $('.veiw_details_ex').click(function () {
                submitSingleDataByPost('vehicle_single_view.php', 'veh_id', $(this).val());
            });
            //DELETE
            $('.del_maker').click(function () {
            });
        }
        load_vhview_paging(page, supp_id, stock_status, records);
        if ($.type(callback) === 'function') {
            callback();
        }
    }, "json");
}

/*
function load_vehicle_table(page, callback) {
    //@Ashan
    var supp_id = $('#cmb_supp').val();
    var stock_status = $('#cmb_stock_status').val();
    var records = $('#page_records').val();
    if (page === undefined || isNaN(parseInt(page)) || parseInt(page) <= 0) {
        page = 1;
    }

    var tableData = '';

    $.post("table_models/modle_vehicle_list.php", {table: "load_vehicle_tbl", supp_id: supp_id, stock_status: stock_status, records: records, page: page}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            tableData += '<tr><th colspan="22" class="alert alert-warning text-center"> -- No Data Found -- </th></tr>';
            $('.view_vh_table tbody').html('').append(tableData);
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
                tableData += '<td>' + ((qData.vh_code) == null ? '-' : qData.vh_code) + '</td>';
                tableData += '<td>' + qData.supp_name + '</td>';
                tableData += '<td>' + qData.maker_name + '</td>';
                tableData += '<td>' + qData.mod_name + '</td>';
                tableData += '<td>' + qData.vh_chassis_code + '</td>';
                tableData += '<td>' + qData.vh_chassis_num + '</td>';
                tableData += '<td>' + qData.engine_code + '</td>';
                tableData += '<td>' + qData.engine_num + '</td>';
                tableData += '<td>' + qData.engine_cc + '</td>';
                tableData += '<td>' + qData.package + '</td>';
                tableData += '<td>' + qData.vh_year + '</td>';
                tableData += '<td>' + qData.vh_color + '</td>';
                tableData += '<td>' + qData.vh_milage + '</td>';
                tableData += '<td>' + qData.vh_options + '</td>';
                tableData += '<td>' + qData.additional_options + '</td>';
                tableData += '<td>' + qData.bid_date + '</td>';
                tableData += '<td>' + qData.auction_name + '</td>';
                tableData += '<td>' + qData.auction_grade + '</td>';
//                tableData += '<td>' + qData.lot_no + '</td>';
//                tableData += '<td>' + qData.auc_display_price + '</td>';
//                tableData += '<td>' + qData.stock_location + '</td>';
//                tableData += '<td>' + qData.short_name + '</td>';
                tableData += '</tr>';
            });
            $('.view_vh_table tbody').html('').append(tableData);

            //TABLE ACTION BUTTONS
            //SELECT
            $('.sel_order_id').click(function () {
                load_vh_edit($(this).val());
            });
            //DETAILS
            $('.veiw_details_ex').click(function () {
                submitSingleDataByPost('vehicle_single_view.php', 'veh_id', $(this).val());
            });
            //DELETE
            $('.del_maker').click(function () {
            });
        }
        load_vhview_paging(page, supp_id, stock_status, records);
        
        if ($.type(callback) === 'function') {
            callback();
        }
    }, "json");
}


*/


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


function load_vhview_paging(page, supp_id, stock_status, records) {
    //@Sachith 
    var tableData = '';
    $.post("table_models/modle_vehicle_list.php", {table: "view_vehicle_tbl_paging", stock_status: stock_status, supp_id: supp_id, records: records}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            tableData = '';
            $('.vh_view_pg').html('').append(tableData);
        } else {
            var totpg = parseInt(e.tot_pg);
            if (totpg < 11) {
                for (i = 1; i <= totpg; i++) {
                    if (!isNaN(page) && parseInt(page) === i) {
                        tableData += '<button type="button" class="btn btn-custom-light disabled go_to_pg" value="' + i + '">' + i + '</button>';
                    } else {
                        tableData += '<button type="button" class="btn btn-custom-light go_to_pg" value="' + i + '">' + i + '</button>';
                    }
                }
            } else {
                var sel_page = parseInt(page);
                var prev_page = 1;
                var next_page = totpg;
                if ((sel_page - 3) > 1) {
                    prev_page = sel_page - 3;
                }
                if ((sel_page + 3) < totpg) {
                    next_page = sel_page + 3;
                }

                tableData += '<button type="button" class="btn btn-custom-light go_to_pg" value="' + 1 + '">First</button>';
                for (var i = prev_page; i <= next_page; i++) {
                    if (!isNaN(page) && parseInt(page) === i) {
                        tableData += '<button type="button" class="btn btn-custom-light disabled go_to_pg" style="width:36px;" value="' + i + '">' + i + '</button>';
                    } else {
                        tableData += '<button type="button" class="btn btn-custom-light go_to_pg" style="width:36px;" value="' + i + '">' + i + '</button>';
                    }
                }
                tableData += '<button type="button" class="btn btn-custom-light go_to_pg" value="' + totpg + '">Last</button>';

            }
            $('.vh_view_pg').html('').append(tableData);

            //UPDATE
            $('.go_to_pg').click(function () {
                load_vehicle_table($(this).val());
            });
        }
    }, "json");
}

function vehicle_keyword_search(callback) {
    //@Sampath 
    var search_entered = $('#txt_search_key').val();
    var key_arr = search_entered.split(" ");
    var supp_id = $('#cmb_supp').val();
    var stock_status = $('#cmb_stock_status').val();
    var tableData = '';
    if (key_arr.length > 0) {
//        if (page === undefined || isNaN(parseInt(page)) || parseInt(page) <= 0) {
//            page = 1;
//        }

        $.post("views/loadTables.php", {table: "view_vehicle_keyword_search", key_arr: key_arr}, function (e) {
            if (e === undefined || e.length === 0 || e === null) {
                tableData += '<tr><th colspan="22" class="alert alert-warning text-center"> -- No Data Found -- </th></tr>';
                $('.view_vh_table tbody').html('').append(tableData);
            } else {
                $.each(e, function (index, qData) {
                    index++;
                    tableData += '<tr>';
                    tableData += '<td><div class="btn-group"><button class="btn btn-custom-light btn-xs sel_order_id" value="' + qData.vh_id + '"><i class="fa fa-pencil fa-sm"></i>&nbsp;</button>'
                            + '<button class="btn btn-custom-save btn-xs veiw_details_ex" value="' + qData.vh_id + '"><i class="fa fa-external-link"></i>&nbsp;</button></div></td>';
                    tableData += '<td><input type="checkbox" value="' + qData.vh_id + '">&nbsp;</td>';
                    tableData += '<td>' + qData.vh_index_num + '</td>';
//                tableData += '<td>' + qData.supp_name + '</td>';
                    tableData += '<td>' + qData.vh_code + '</td>';
                    tableData += '<td>' + qData.supp_name + '</td>';
                    tableData += '<td>' + qData.maker_name + '</td>';
                    tableData += '<td>' + qData.mod_name + '</td>';
                    tableData += '<td>' + qData.vh_chassis_code + '</td>';
                    tableData += '<td>' + qData.vh_chassis_num + '</td>';
                    tableData += '<td>' + qData.engine_code + '</td>';
                    tableData += '<td>' + qData.engine_num + '</td>';
                    tableData += '<td>' + qData.engine_cc + '</td>';
                    tableData += '<td>' + qData.package + '</td>';
                    tableData += '<td>' + qData.vh_year + '</td>';
                    tableData += '<td>' + qData.vh_color + '</td>';
                    tableData += '<td>' + qData.vh_milage + '</td>';
                    tableData += '<td>' + qData.vh_options + '</td>';
                    tableData += '<td>' + qData.additional_options + '</td>';
                    tableData += '<td>' + qData.bid_date + '</td>';
                    tableData += '<td>' + qData.auction_name + '</td>';
                    tableData += '<td>' + qData.auction_grade + '</td>';
//                tableData += '<td>' + qData.lot_no + '</td>';
//                tableData += '<td>' + qData.auc_display_price + '</td>';
//                tableData += '<td>' + qData.stock_location + '</td>';
//                    tableData += '<td>' + qData.short_name + '</td>';
                    tableData += '</tr>';
                });
                $('.view_vh_table tbody').html('').append(tableData);

                // TABLE ACTION BUTTONS
                //SELECT
                $('.sel_order_id').click(function () {
                    load_vh_edit($(this).val());
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