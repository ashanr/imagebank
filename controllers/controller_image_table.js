function save_document_details() {
    if (($('#file_name').val() === undefined) || ($('#file_name').length === 0) || ($('#file_name').val() === null)) {
        alertify.error("Please check File Name");
        return;
    }
    if ($('#category_ComboBox').val() == undefined) {
        alertify.error("Please check category");
        return;
    }
    var form_data = {
        v_code_num: $('#v_code_num').val(),
        rack_no: $('#rack_no').val(),
        row_no: $('#row_no').val(),
        box_no: $('#box_no').val(),
        category: $('#category_ComboBox').val(),
        file_name: $('#file_name').val(),
        description: $('#description').val(),
        file_number: $('#file_number').val()
    };

    $('#vh_confirm').modal('hide'); // hide confirm modal
    $.post('models/model_image_file.php', {action: 'add_file', form_data: form_data}, function (e) {
        if (e.msgType === 1) {
            alertify.success(e.msg, 1000);
            reset_file_data();
            window.location.href = 'img_view_file_list.php';

        } else {
            alertify.error(e.msg, 2000);

        }

        file_code_combo();
    }, 'json');
} //IMAGE FILE SAVE


function update_document_details(image_ai_id) {
    if ($('#category_ComboBox').val() == undefined) {
        alertify.error("Please check category");
        return;
    }
    var form_data = {
        image_ai_id: image_ai_id,
        v_code_num: $('#v_code_num').val(),
        file_no: $('#file_number').val(),
        rack_no: $('#rack_no').val(),
        row_no: $('#row_no').val(),
        box_no: $('#box_no').val(),
        category: $('#category_ComboBox').val(),
        file_name: $('#file_name').val(),
        description: $('#description').val(),
        file_number: $('#file_number').val()
    };

    $('#vh_confirm').modal('hide'); // hide confirm modal
    $.post('models/model_image_file.php', {action: 'update_file', form_data: form_data}, function (e) {
        if (e.msgType === 1) {
            alertify.success(e.msg, 1000);
            reset_file_data();
            window.location.href = 'img_view_file_list.php';

        } else {
            alertify.error(e.msg, 2000);
        }
        file_code_combo();
    }, 'json');
} //IMAGE FILE SAVE



function pdf_file_uplaod() {
    var upldp = document.getElementById('pdf_file');



    if (upldp.files.length > 0) {
        var formdata;
        if (window.FormData) {
            formdata = new FormData();
            formdata.append('pdf_upload', 'pdf_upload');
            formdata.append('file_id', $('#file_number').val());
            formdata.append('file_category', $('#category_ComboBox ').val());
            formdata.append('file', upldp.files[0]);
            $.ajax({
                url: "views/pdf_upload.php",
                type: "POST",
                data: formdata,
                processData: false,
                contentType: false,
                success: function (res) {
                    //                                    var pp = JSON.parse(res);
                    var stat = parseInt(res);
                    if (stat === 100) {
                        alertify.success('PDF file uploaded', 5000);
                    } else if (stat === 1) {
                        alertify.error('File too large', 5000);
                    } else if (stat === 600) {
                        alertify.error('Error in Subject', 5000);
                    } else if (stat === 800) {
                        alertify.error('Invalid file type', 5000);
                    } else if (stat === 900) {
                        alertify.error('File Save Error', 5000);
                    } else {
                        alertify.error('File upload error', 5000);
                        return;
                    }
                    $('#pdf_file').val('');

                }
            });
        }
    } else {
        alertify.error('Please select a file.', 5000);
        return;
    }
}

function load_file_list_table(page, callback) {
    //@Ashan
    var records = $('#page_records').val();
    var tableData = '';
    if (page === undefined || isNaN(parseInt(page)) || parseInt(page) <= 0) {
        page = 1;
    }
    $.post("table_models/model_file_list.php", {table: "load_image_file_list_table", records: records}, function (e) {
        var index = 0;
        
//        alert(e); 
        
        if (e === undefined || e.length === 0 || e === null) {
            tableData += '<tr><th colspan="22" class="alert alert-warning text-center"> -- No Data Found -- </th></tr>';
            $('.view_vh_table tbody').html('').append(tableData);
        } else {
            $.each(e, function (index, qData) {
//                qData.color_group

                index++;
                tableData += '<tr> ';

                tableData += '<td>';
                tableData += '<div class="btn-group"><button class="btn btn-custom-light btn-xs sel_order_id" value="' + qData.image_ai_id + '" data-cat="' + qData.file_category + '" data-toggle="tooltip" data-placement="bottom" title="Edit Vehicle"><i class="fa fa-pencil fa-sm"></i>&nbsp;</button>'
                        + '<button class="btn btn-custom-save btn-xs veiw_details_ex" value="' + qData.image_ai_id + '" data-toggle="tooltip" data-placement="bottom" title="View Details"><i class="fa fa-external-link"></i>&nbsp;</button></div>'
                        + '<button class="btn btn-custom-print-view btn-xs view_files" value="' + qData.image_ai_id + '" data-category ="' + qData.file_category + '"  data-toggle="tooltip" data-placement="bottom" title="View Files"><i class="fa fa-edit"></i>&nbsp;</button></div>';
//                <button class="btn "> <i class="fa fa-external-link"></i></button>
                tableData += '</td>';

                tableData += '<td>' + ((qData.file_id == null) ? '-' : qData.file_id) + '</td>';
                tableData += '<td>' + ((qData.file_category == null) ? '-' : qData.file_category) + '</td>';
                tableData += '<td>' + ((qData.file_name == null) ? '-' : qData.file_name) + '</td>';
                tableData += '<td>' + ((qData.file_description == null) ? '-' : qData.file_description) + '</td>';
                tableData += '<td>' + ((qData.rack_no == null) ? '-' : qData.rack_no) + '</td>';
                tableData += '<td>' + ((qData.row_no == null) ? '-' : qData.row_no) + '</td>';
                tableData += '<td>' + ((qData.box_no == null) ? '-' : qData.box_no) + '</td>';
                tableData += '<td>' + qData.file_added_date + '</td>';
                tableData += '<td>' + qData.file_last_update_date + '</td>';
                tableData += '<td>' + ((qData.pdf_file == null) ? '-' : qData.pdf_file) + '</td>';
                tableData += '<td>' + ((qData.image_file == null) ? '-' : qData.image_file) + '</td>';


                tableData += '</tr>';
            });
            $('.view_vh_table tbody').html('').append(tableData);

            // TABLE ACTION BUTTONS
            //SELECT
            $('.sel_order_id').click(function () {
                var cat = $(this).data('cat');
                load_img_file_edit($(this).val(), cat);
            });
            //DETAILS
            $('.veiw_details_ex').click(function () {
                submitSingleDataByPost('vehicle_single_view.php', 'veh_id', $(this).val());
            });
            //view_files
            $('.view_files').click(function () {
                submitSingleDataByPostSpecial('img_pdf_file_single_view.php', 'image_ai_id', $(this).val(), 'file_category', $(this).data('category'));
            });
            //DELETE
            $('.del_maker').click(function () {
            });
        }
        load_file_view_paging(page, records);
        if ($.type(callback) === 'function') {
            callback();
        }
    }, "json");
}

function load_file_view_paging(page, records) {
    //@Ashan 
    var tableData = '';
    $.post("table_models/model_file_list.php", {table: "view_filelist_tbl_paging", page: page, records: records}, function (e) {
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
                load_file_paging_table($(this).val());
            });
        }
    }, "json");
}

function image_keyword_search_table(callback) {
    //@Ashan 
    var search_entered = $('#txt_search_key').val();
    var key_arr = search_entered.split(" ");
    var tableData = '';
    if (key_arr.length > 0) {

        $.post("table_models/model_file_list.php", {table: "search_image_table", key_arr: key_arr}, function (e) {
            if (e === undefined || e.length === 0 || e === null) {
                tableData += '<tr><th colspan="22" class="alert alert-warning text-center"> -- No Data Found -- </th></tr>';
                $('.view_vh_table tbody').html('').append(tableData);
            } else {
                $.each(e, function (index, qData) {
                    index++;
                    tableData += '<tr>';
                    tableData += '<td><div class="btn-group"><button class="btn btn-custom-light btn-xs sel_order_id" value="' + qData.file_id + '" data-cat="' + qData.file_category + '"><i class="fa fa-pencil fa-sm"></i>&nbsp;</button>'
                            + '<button class="btn btn-custom-save btn-xs veiw_details_ex" value="' + qData.file_id + '"><i class="fa fa-external-link"></i>&nbsp;</button></div></td>';
                    tableData += '<td><input type="checkbox" value="' + qData.file_id + '">&nbsp;</td>';
                    tableData += '<td>' + qData.file_name + '</td>';
                    tableData += '<td>' + qData.file_description + '</td>';
                    tableData += '<td>' + qData.file_added_date + '</td>';
                    tableData += '<td>' + qData.pdf_file + '</td>';
                    tableData += '<td>' + qData.image_file + '</td>';
                    tableData += '</tr>';
                });
                $('.view_vh_table tbody').html('').append(tableData);

                // TABLE ACTION BUTTONS
                //SELECT
                $('.sel_order_id').click(function () {
                    var cat = $(this).data('cat');
                    load_img_file_edit($(this).val(), cat);
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

function load_file_paging_table(page, callback) {
    //@Ashan

    var records = $('#page_records').val();
    var tableData = '';
    if (page === undefined || isNaN(parseInt(page)) || parseInt(page) <= 0) {
        page = 1;
    }
    $.post("table_models/model_file_list.php", {table: "load_file_paging_tbl", page: page, records: records}, function (e) {
        var index = 0;
        if (e === undefined || e.length === 0 || e === null) {
            tableData += '<tr><th colspan="22" class="alert alert-warning text-center"> -- No Data Found -- </th></tr>';
            $('.view_vh_table tbody').html('').append(tableData);
        } else {
            $.each(e, function (index, qData) {
//                qData.color_group

                index++;
                tableData += '<tr> ';

                tableData += '<td>';
                tableData += '<div class="btn-group"><button class="btn btn-custom-light btn-xs sel_order_id" value="' + qData.image_ai_id + '" data-cat="' + qData.file_category + '" data-toggle="tooltip" data-placement="bottom" title="Edit Vehicle"><i class="fa fa-pencil fa-sm"></i>&nbsp;</button>'
                        + '<button class="btn btn-custom-save btn-xs veiw_details_ex" value="' + qData.image_ai_id + '" data-toggle="tooltip" data-placement="bottom" title="View Details"><i class="fa fa-external-link"></i>&nbsp;</button></div>';
//                <button class="btn "> <i class="fa fa-external-link"></i></button>
                tableData += '</td>';
                tableData += '<td>' + qData.file_id + '</td>';
                tableData += '<td>' + qData.file_category + '</td>';
                tableData += '<td>' + qData.file_name + '</td>';
                tableData += '<td>' + qData.file_description + '</td>';
                tableData += '<td>' + qData.file_added_date + '</td>';
                tableData += '<td>' + qData.file_last_update_date + '</td>';
                tableData += '<td>' + qData.pdf_file + '</td>';
                tableData += '<td>' + qData.pdf_file + '</td>';
                tableData += '</tr>';
            });
            $('.view_vh_table tbody').html('').append(tableData);

            // TABLE ACTION BUTTONS
            //SELECT
            $('.sel_order_id').click(function () {
                var cat = $(this).data('cat');

                load_img_file_edit($(this).val(), cat);
            });
            //DETAILS
            $('.veiw_details_ex').click(function () {
                submitSingleDataByPost('vehicle_single_view.php', 'veh_id', $(this).val());
            });
            //DELETE
            $('.del_maker').click(function () {
            });
        }
        load_file_view_paging(page, records);
        if ($.type(callback) === 'function') {
            callback();
        }
    }, "json");
}

function load_img_file_edit(vh_id, cat) {
    var win = window.open('img_reg.php?img_ai_id=' + vh_id + '&cat=' + cat, '_blank');
    win.focus();
}//edit image file


function image_file_upload() {
    var upldp = document.getElementById('fileInputBox');

    if (upldp.files.length > 0) {

        var formdata;
        if (window.FormData) {
            formdata = new FormData();
            formdata.append('image_upload', 'image_upload');
            formdata.append('file_ai_id', $('#vh_reg_id').val());
            formdata.append('file_category', $('#category_ComboBox').val());
            formdata.append('file', upldp.files[0]);

            $.ajax({
                url: "views/image_upload.php",
                type: "POST",
                data: formdata,
                processData: false,
                contentType: false,
                success: function (res) {
                    var stat = parseInt(res);
//                    alert(stat);
//                    return;
                    if (stat === 100) {
                        alertify.success('Image Successfully Uploaded!', 5000);
                    } else if (stat === 200) {
                        alertify.error('IMAGE too large', 5000);
                    } else if (stat === 600) {
                        alertify.error('IMAGE PROCESS ERROR', 5000);
                    } else if (stat === 700) {
                        alertify.error('NO FILE ID FOUND', 5000);
                    } else if (stat === 800) {
                        alertify.error('Invalid file type', 5000);
                    } else if (stat === 900) {
                        alertify.error('IMAGE Save Error', 5000);
                    } else {
                        alertify.error('File upload error', 5000);
                        return;
                    }
                    $('#fileInputBox').val('');

                }
            });
        }
    } else {
        alertify.error('Please select a file.', 5000);
        return;
    }
}









///////////////////////////////////////
//////////// REPORTS TABLE //////////////
//////////////////////////////////////////

function genarate_stock_Report() {
    var tableData = "";
    var tableDataFoot = "";
    var totalAmount = 0;

    $.post("views/loadTables.php", {table: "report_vh_stock"}, function (e) {
        if (e === undefined || e.lenght === 0 || e === null) {
            tableData += '<tr>';
            tableData += '<th colspan="12"> No Data Found ...</th>';
            tableData += '</tr>';
        } else {
            $.each(e, function (index, qData) {
                tableData += '<tr>';
                tableData += '<td>' + qData.stock_location + '</td>';
                tableData += '<td>' + qData.maker_name + '</td>';
                tableData += '<td>' + qData.mod_name + '</td>';
                tableData += '<td>' + qData.vh_code + '</td>';
                tableData += '<td>' + qData.import_date + '</td>';
                tableData += '<td>' + qData.vh_chassis_code + '-' + qData.vh_chassis_num + '</td>';
                if (qData.vh_purchase_type == '0') {
                    tableData += '<td>Purchased</td>';
                } else {
                    tableData += '<td>Exchange</td>';
                }
            });
        }
        $("#rep_date").html("As at: " + new Date().toString().slice(0, 24));
        $("#tlReport tbody").html("").append(tableData);
        $("#tlReport tfoot").html("").append(tableDataFoot);
    }, "json");
}