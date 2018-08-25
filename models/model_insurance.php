<?php

session_start();
require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$dbClass = new database();
$system = new setting();
MainConfig::connectDB();
if (array_key_exists("action", $_POST)) {
    if ($_POST['action'] == 'save_insurance_entry') {
        $data = $_POST['data_array'];
        $ins_insert = "INSERT INTO `vehicle_insurance`(`vh_id`,"
                . " `cus_id`,"
                . " `coordinator_id`, "
                . "`sold_price`, "
                . "`vhi_date`,"
                . " `vhi_amount`, "
                . "`in_company_id`,"
                . "`vhi_valuation_by`, "
                . "`vhi_docs_submitted`,"
                . " `vhi_submit_date`,"
                . " `vhi_payment_status`,"
                . " `vhi_deposit_acc`,"
                . " `vhi_additional_info`,"
                . " `vhi_status`,"
                . " `vhi_confirm`"
                . ") VALUES ("
                . " '{$data['vh_id']}',"
                . " '{$data['customer_ComboBox']}',"
                . " '{$data['coordinator']}', "
                . "'{$data['sold_price']}',"
                . " CURDATE(), "
                . "'{$data['insurance_amount']}',"
                . " '{$data['insurance_company']}', "
                . "'{$data['valuation_from']}', "
                . "'{$data['docs_submitted']}',"
                . " '{$data['vhi_submit_date']}',"
                . " '{$data['pay_status']}', "
                . " '{$data['deposite_acc']}', " //sub amount
                . " '{$data['additional_info']}',"
                . " '1',"
                . " '{$data['cnfrmation']}')"; //check box
//echo $ins_insert;
        $save = mysql_query($ins_insert)or die(mysql_error());
        if (isset($save) && $save) {
            echo json_encode(array(array("msgType" => 1, "msg" => 'successfully Saved')));
        } else {
            echo json_encode(array(array("msgType" => 2, "msg" => 'Save Failed')));
        }
    } else if ($_POST['action'] == 'load_insurance_vehicle_info') {
        $query = "SELECT
vehicle.vh_index_num,
vehicle.vh_code,
vehicle.supp_id,
vehicle.vh_chassis_num,
vehicle.coordinator_id,
vehicle.record_status,
vehicle.vh_disp_price,
vehicle.auc_real_price,
vehicle.auc_display_price,
vehicle.engine_cc,
maker_model.mod_name,
coordinator.coordinator_name,
vehicle_insurance.cus_id,
vehicle_insurance.coordinator_id,
vehicle_insurance.sold_price,
vehicle_insurance.vhi_date,
vehicle_insurance.vhi_amount,
vehicle_insurance.in_company_id,
vehicle_insurance.vhi_valuation_by,
vehicle_insurance.vhi_docs_submitted,
vehicle_insurance.vhi_submit_date,
vehicle_insurance.vhi_payment_status,
vehicle_insurance.vhi_deposit_acc,
vehicle_insurance.vhi_additional_info,
vehicle_insurance.vhi_status,
vehicle_insurance.vhi_confirm,
vehicle_insurance.vhi_id
FROM
vehicle
INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
INNER JOIN coordinator ON vehicle.coordinator_id = coordinator.coordinator_id
INNER JOIN vehicle_insurance ON vehicle_insurance.vh_id = vehicle.vh_id
WHERE
vehicle_insurance.vhi_id = {$_POST['vhi_id']}";
        $system->prepareSelectQueryForJSON($query);
    }else if ($_POST['action'] == 'load_ins_vehicle_info') {
        $query = "SELECT
                                            vehicle.vh_index_num,
                                            vehicle.vh_code,
                                            vehicle.supp_id,
                                            vehicle.vh_chassis_num,
                                            vehicle.coordinator_id,
                                            vehicle.record_status,
                                            vehicle.vh_disp_price,
                                            vehicle.auc_real_price,
                                            vehicle.auc_display_price,
                                            vehicle.engine_cc,
                                            maker_model.mod_name,
                                            vh_sales.sold_price,
                                            coordinator.coordinator_name
                                            FROM
                                            vehicle
                                            INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
                                            INNER JOIN coordinator ON vehicle.coordinator_id = coordinator.coordinator_id
                                            INNER JOIN vh_sales ON vehicle.vh_id = vh_sales.vh_id
                                            WHERE vehicle.vh_id= {$_POST['vh_id']}";
        $system->prepareSelectQueryForJSON($query);
    }

    else if ($_POST['action'] == 'update_insurance_entry') {
        $data = $_POST['data_array'];
        $ins_update = "UPDATE `vehicle_insurance` SET `cus_id` = '{$data['customer_ComboBox']}', `coordinator_id` = '{$data['coordinator']}', `sold_price` = '{$data['sold_price']}', `vhi_date` = CURDATE(), `vhi_amount` = '{$data['insurance_amount']}', `in_company_id` = '{$data['insurance_company']}', `vhi_valuation_by` = '{$data['valuation_from']}', `vhi_docs_submitted` = '{$data['docs_submitted']}', `vhi_submit_date` = '{$data['vhi_submit_date']}', `vhi_payment_status` = '{$data['pay_status']}', `vhi_deposit_acc` = '{$data['deposite_acc']}', `vhi_additional_info` = '{$data['additional_info']}', `vhi_status` = '1', `vhi_confirm` = '{$data['cnfrmation']}' WHERE (`vhi_id` = '{$data['vhi_id']}');"; //check box
//echo $ins_insert;
        $save = mysql_query($ins_update)or die(mysql_error());
        if (isset($save) && $save) {
            echo json_encode(array(array("msgType" => 1, "msg" => 'successfully Saved')));
        } else {
            echo json_encode(array(array("msgType" => 2, "msg" => 'Save Failed')));
        }
    }
}