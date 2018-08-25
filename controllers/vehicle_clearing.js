
function sendClear_selectedVh(idlist) {
    var tableData = '';

    $.post("models/vehicle_clearing.php", {table: "sendClear_selectedVh", idlist: idlist}, function (e) {
        if (e === undefined || e.length === 0 || e === null) {
            tableData += '<tr><th colspan="9" class="alert alert-warning text-center"> -- No Data Found-- </th></tr>';
            $('#addTo_clear tbody').html('').append(tableData);
        } else {
            $.each(e, function (index, data) {
                index++;
                tableData += '<tr>';
                tableData += '<td>' + data.vh_code + '</td>';
                tableData += '<td >' + data.mod_name + '</td>';
                tableData += '<td>' + data.package + '</td>';
                tableData += '<td>' + data.vh_year + '</td>';
                tableData += '<td>' + data.vh_color + '</td>';
                tableData += '<td><div>' +
                        '<button class="btn btn-custom-save btn_sel" data-vhcode="' + data.vh_code + '" data-model="' + data.mod_id + '" value="' + data.vh_id + '"><i class="fa fa-hand-o-up fa-sm"></i>&nbsp;</button>' +
                        '</div></td>';
                tableData += '</tr>';
            });
            $('#addTo_clear tbody').html('').append(tableData);

            $('.btn_sel').click(function () {
                $('#vh_id').val($(this).val());
                $('#vh_code').val($(this).data('vhcode'));
                //  alert('hi');
                sel_clearing_vh($(this).val());
                //   show_update_btn();
                clearing_add_btn();
            });
        }
    }, "json");
}


function clearing_add_btn(){
    
    if($('#btn_clearing_add').hasClass('hidden')){
        $('#btn_clearing_add').removeClass('hidden')
    }
    if(!$('#btn_update').hasClass('hidden')){
        $('#btn_update').addClass('hidden')
    }
}

function clearing_update_btn(){
    
    if($('#btn_update').hasClass('hidden')){
        $('#btn_update').removeClass('hidden')
    }
      if(!$('#btn_clearing_add').hasClass('hidden')){
        $('#btn_clearing_add').addClass('hidden')
    }
}



function sel_clearing_vh(vh_id) {
//@Ashan
    if (parseInt(vh_id) !== 0) {
        $.post("models/vehicle_clearing.php", {action: 'sel_clr_data', vh_id: vh_id}, function (e) {
            if (e === undefined || e.length === 0 || e === null) {
                //  alertify.error("No Data Found", 1000);
            } else {

                $.each(e, function (index, qData) {

                    $('#shipped_date').val(qData.shipped_date);
                    $('#driver_name').val(qData.driver_name);
                    $('#vessel').val(qData.vessel);
                    $('#refund').val(qData.refund);
                    $('#arrival_date').val(qData.arrival_date);
                    $('#document_status').val(qData.document_status);
                    $('#to_clearing_agent').val(qData.to_clearing_agent);
                    $('#duty').val(qData.duty);
                    $('#clearing_date').val(qData.clearing_date);
                    $('#carrier_by').val(qData.carrier_by);
                });
            }
        }, "json");
    } else {
        alertify.error("Invalid Sub category selection", 1000);
    }
}
