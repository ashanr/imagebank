function load_view_driver_balance_table(page, pay_status, driver_id, serch_text, callBack) {
    if (isNaN(driver_id)) {
        alert('no driver found !');
        return;
    }
    var send_val = {table: "load_view_driver_balance_tbl", page: page, pay_status: pay_status, driver_id: driver_id}
    if (serch_text !== undefined) {
        send_val.serch_text = serch_text.trim();
    }

    //@Ashan 
    var tableData = '';
    var balance = 0;
    var lst_ba = 0;
    if (page === undefined || isNaN(parseInt(page)) || parseInt(page) <= 0) {
        page = 1;
    }
    $.post("views/loadTables.php", send_val, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            tableData += '<tr><th colspan="18" class="alert alert-warning text-center"> -- No Data Found -- </th></tr>';
            $('.view_drch_table tbody').html('').append(tableData);
        } else {
            $.each(e, function (index, qData) {
                index++;
                balance += (parseFloat(qData.drch_salary) + parseFloat(qData.drch_petrol) + parseFloat(qData.drch_expenses)) - parseFloat(qData.drch_advance);
                lst_ba = balance - parseFloat(qData.drch_payment);
                if (qData.drch_payment > 0) {
                    tableData += '<tr   >';
                    tableData += '<td   >' + qData.driver_name + '</td>';
                    tableData += '<td  style="background-color:#ffb3b3" >' + qData.drch_date + '</td>';
                    tableData += '<td  style="background-color:#ffb3b3"  colspan="9"> Advance Paid </td>';
                    tableData += '<td  style="background-color:#ffb3b3"  class="text-right" >' + qData.drch_payment + '</td>';
                    //                tableData += '<td  style="background-color"#ffb3b3"  class="text-right">' + balance.toFixed(2) + '</td>';
                    tableData += '<td  style="background-color:#ffb3b3"  class="text-right" style="font-weight:bold;" >' + lst_ba.toFixed(2) + '</td>';

                }
                else {
                    tableData += '<tr>';
                    tableData += '<td>' + qData.driver_name + '</td>';
                    tableData += '<td>' + qData.drch_date + '</td>';
                    tableData += '<td>' + qData.vh_code + '</td>';
                    tableData += '<td>' + qData.drch_desc + '</td>';
                    tableData += '<td>' + qData.drch_type + '</td>';
                    tableData += '<td>' + qData.from + '</td>';
                    tableData += '<td>' + qData.destination + '</td>';
                    tableData += '<td class="text-right">' + parseFloat(qData.drch_salary).toFixed(2) + '</td>';
                    tableData += '<td class="text-right">' + qData.drch_petrol + '</td>';
                    tableData += '<td class="text-right">' + qData.drch_expenses + '</td>';
                    tableData += '<td class="text-right">' + qData.drch_advance + '</td>';
                    tableData += '<td class="text-right" >' + qData.drch_payment + '</td>';
//                tableData += '<td class="text-right">' + balance.toFixed(2) + '</td>';
                    tableData += '<td class="text-right" >' + lst_ba.toFixed(2) + '</td>';

                }

                if (parseInt(qData.record_status) < 2) {
                    tableData += '<td><div class="btn-group">';
                    if (parseInt(qData.pay_status) == 1) {
                        tableData += '<button class="btn btn-custom-light del_order" value="' + qData.drch_id + '"><i class="fa fa-trash-o fa-lg"></i>&nbsp;Cancel</button>';
                    } else {
                        tableData += '<button class="btn btn-custom-save sel_order_id" value="' + qData.drch_id + '"><i class="fa fa-pencil fa-sm"></i>&nbsp;</button>' +
                                '<button class="btn btn-custom-light remove_drch" value="' + qData.drch_id + '"><i class="fa fa-trash-o fa-lg"></i>&nbsp;Remove</button>';
                    }
                    tableData += '</div></td>';
                } else {
                    tableData += '<td>&nbsp;</td>';
                }
                tableData += '</tr>';
            });
            $('.view_drch_table tbody').html('').append(tableData);
//            tableSorter('.view_order_table');

            // TABLE ACTION BUTTONS
            //SELECT
            $('.sel_order_id').click(function () {
                load_drch_details($(this).val());
            });
            //DELETE
            $('.remove_drch').click(function () {
                drch_remove($(this).val());
            });
            if (callBack !== undefined) {
                if (typeof callBack === 'function') {
                    callBack();
                }
            }
        }
        load_drch_paging(page, pay_status, driver_id, serch_text, callBack);
    }, "json");


}


function load_drch_paging(page, pay_status, driver_id, serch_text, callBack) {
    //@Sachith 
    var tableData = '';
    $.post("views/loadTables.php", {table: "view_drch_tbl_paging", page: page, pay_status: pay_status, driver_id: driver_id,serch_text:serch_text,callBack:callBack}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            tableData = '';
            $('.view_drch_table').html('').append(tableData);
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
            $('.view_drch_table').html('').append(tableData);

            //UPDATE
            $('.go_to_pg').click(function () {
                load_vehicle_table($(this).val());
            });
        }
    }, "json");
}
