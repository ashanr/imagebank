<?php

session_start();
require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$system = new setting();
$database = new database();
MainConfig::connectDB();

if (array_key_exists("action", $_POST)) {
    if ($_POST['action'] == 'load_lease_vehicle_info') {
        $vh_id = $_POST['vh_id'];
        $qry = "SELECT
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
vh_sales.sold_price,
vh_sales.advance
FROM
vehicle
INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
INNER JOIN coordinator ON vehicle.coordinator_id = coordinator.coordinator_id
INNER JOIN vh_sales ON vh_sales.vh_id = vehicle.vh_id AND vehicle.coordinator_id = coordinator.coordinator_id
WHERE vehicle.vh_id= '{$vh_id}'";
        $system->prepareSelectQueryForJSON($qry);
    } elseif ($_POST['action'] == 'save_leasing_entry') {
        $vh_id = $_POST['vh_id'];
        $data = $_POST['form_data'];
        $today = date('Y-m-d');
        foreach ($data as $key => $value) {
            $data[$key] = mysql_real_escape_string($data[$key]);
        }
        MainConfig::connectDB();
        mysql_query("START TRANSACTION");
        $insert_query = "INSERT INTO `vehicle_leasing` (
                                `vh_id`,
                                `cus_id`,
                                `coordinator_id`,
                                `coordinator`,
                                `vhl_date`,
                                `vhl_amount`,
                                `ls_company_id`,
                                `vhl_valuation_by`,
                                `vhl_docs_submitted`,
                                `vhl_submit_date`,
                                `vhl_payment_status`,
                                `vhl_deposit_acc`,
                                `vhl_additional_info`,
                                `payment_type`,
                                `vhl_confirm`,                                
                                `vhl_status`,
                                `vhl_confirmed_amount`,
                                `advance`,
                                `sold_price`
	                         )VALUES ('{$data['vh_id']}', '{$data['cus_id']}',  '{$data['coordinator_id']}','{$data['coordinator']}',CURDATE(), '{$data['vhl_amount']}','{$data['ls_id']}', '{$data['vhl_valuation_by']}', '{$data['vhl_docs_submitted']}', '{$data['vhl_submit_date']}', '{$data['vhl_payment_status']}','{$data['vhl_deposit_acc']}', '{$data['vhl_additional_info']}','{$data['payment_type']}', '{$data['leasing_status']}',"
                                 . "'1','{$data['vhl_amount']}','{$data['advance']}','{$data['sold_price']}')";
        // $t = "INSERT INTO `transaction` (`tr_type`, `tr_desc`, `tr_time`,`tr_date`, `tr_user_id`) VALUES ('INSESRT', 'vehicle_leasing', CURTIME(), '{$today}', '{$_SESSION['user_id']}')";
        //  echo $insert_query; exit;

        $insert = mysql_query($insert_query);
        $error = mysql_error();

        if ($insert) {
            mysql_query("COMMIT");
            echo json_encode(array("msgType" => 1, "msg" => "Vehicle Leasing Updated."));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array("msgType" => 2, "msg" => $error));
        }
        MainConfig::closeDB();
    } elseif ($_POST['action'] == 'update_leasing_entry') {
        $vhl_id = $_POST['vhl_id'];
        $data = $_POST['form_data'];
        $today = date('Y-m-d');
        foreach ($data as $key => $value) {
            $data[$key] = mysql_real_escape_string($data[$key]);
        }
        $update_query = "UPDATE `vehicle_leasing`  SET
	`cus_id`='{$data['cus_id']}',`coordinator_id`='{$data['coordinator_id']}',`vhl_date`= CURDATE(),
	`vhl_amount`='{$data['vhl_amount']}',`ls_company_id`= '{$data['ls_id']}',`vhl_valuation_by`='{$data['vhl_valuation_by']}',`vhl_docs_submitted`='{$data['vhl_docs_submitted']}',
	`vhl_submit_date`='{$data['vhl_submit_date']}',`vhl_payment_status`='{$data['vhl_payment_status']}',
	`vhl_deposit_acc`='{$data['vhl_deposit_acc']}',`vhl_additional_info`='{$data['vhl_additional_info']}', `vhl_confirm` = '{$data['vhl_confirm']}'
	WHERE vhl_id = {$vhl_id}";
         
       echo $update_query; exit;
        $t = "INSERT INTO `transaction` (`tr_type`, `tr_desc`, `tr_time`,`tr_date`, `tr_user_id`) VALUES ('INSESRT', 'vehicle_leasing', CURTIME(), '{$today}', '{$_SESSION['user_id']}')";

        mysql_query("START TRANSACTION");
        $update = mysql_query($update_query);
        $transaction = mysql_query($t);
        $error = mysql_error();

        if ($update) {
            mysql_query("COMMIT");
            echo json_encode(array("msgType" => 1, "msg" => "Vehicle Leasing Updated."));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array("msgType" => 2, "msg" => $error));
        }
        MainConfig::closeDB();
    }else if ($_POST['action'] == 'load_les_vehicle_info') {
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
vh_sales.sold_price
FROM
vehicle
INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
INNER JOIN coordinator ON vehicle.coordinator_id = coordinator.coordinator_id
INNER JOIN vh_sales ON vehicle.vh_id = vh_sales.vh_id
WHERE vehicle.vh_id= {$_POST['vh_id']}";
        $system->prepareSelectQueryForJSON($query);
    }
}
