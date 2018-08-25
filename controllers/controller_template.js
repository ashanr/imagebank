//////    LOAD DATA TO A FORM   /////

function load_xxxx_info(xxx_id, callBack) {

    if (parseInt(xxx_id) !== '') {
        $.post("models/xxxx.php", {action: 'get_xxxx_info', xxx_id: xxx_id}, function (e) {
            if (e === undefined || e.length === 0 || e === null) {
                alertify.error("No Data Found", 1000);
            } else {
                $.each(e, function (index, qData) {
                    load_makers_cmb(qData.maker_id);  // load combo box

                    $('#xxxxx').attr('disabled', 'disabled');  //disable the edit 
                    
                    $('#xxxxx').val(qData.xxxxxx);//select textbox value
                    
                    if (parseInt(qData.vh_is_reg) === 1) {  //SELECT THE RADIO BUTTON VALUES 
                        $('#rbt_xxx').prop('checked', true);
                        $('#rbt_yyyy').prop('checked', false);
                    } else {
                        $('#rbt_xxx').prop('checked', false);
                        $('#rbt_yyyy').prop('checked', true);
                    }


                    load_makers_cmb(qData.maker_id, function () {
                        load_model_cmb($('.maker_ComboBox').val(), qData.vh_maker_model);
                    });
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