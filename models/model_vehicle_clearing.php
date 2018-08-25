<?php

require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$dbClass = new database();
$system = new setting();

if (array_key_exists("action", $_POST)) {
    if ($_POST['action'] == 'update_clearing_entry') {
        //@Ashan
        $today = date('Y-m-d');
        $data = $_POST['form_data'];
        MainConfig::connectDB();
        mysql_query("START TRANSACTION");

//        if (empty($data['vh_id'])) {
//            echo json_encode(array(array("msgType" => 2, "msg" => "Select a vehicle")));
//            return;
//        }

        foreach ($data as $key => $value) {
            $data[$key] = mysql_real_escape_string($data[$key]);
        }
        $update = mysql_query("UPDATE  `vh_clearing`
                            SET  `vh_id` = '{$data['vh_id']}',
                             `shipped_date` = '{$data['shipped_date']}',
                              `driver_name` = '{$data['driver_name']}',
                             `vessel` = '{$data['vessel']}',
                             `refunds` = '{$data['refund']}',
                             `clr_status` = '{$data['clearing_status']}',
                             `arrival_date` ='{$data['arrival_date']}',
                             `document_status` = '{$data['document_status']}',
                             `to_clr_agent` ='{$data['to_clearing_agent']}',
                             `duty` = '{$data['duty']}',
                              `clr_date` =  '{$data['clearing_date']}',
                              `transporter_name` =  '{$data['carrier_by']}',
                              `lc_no` = '{$data['lc_no']}'
                             WHERE
                            (`vh_id` = '{$data['vh_id']}')        ");

//        $upt = "UPDATE vehicle SET stock_status = '{$data['clearing_status']}' WHERE vehicle.vh_id = '{$data['vh_id']}'";
//        echo $upt;
//        exit;
        $update_stock = mysql_query("UPDATE vehicle SET stock_status = '{$data['clearing_status']}' WHERE vh_id = '{$data['vh_id']}'");

        if ($update) {
            mysql_query("COMMIT");
            echo json_encode(array(array("msgType" => 1, "msg" => "Clearing Details  Updated")));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array(array("msgType" => 2, "msg" => "Could not be Updated")));
        }

        MainConfig::closeDB();
    } elseif ($_POST['action'] == 'save_clearing_entry') {
        $insert = "INSERT INTO `vh_clearing` (
	`vh_id`,`shipped_date`,	`vh_marks_invoice`,`coordinator`,`driver_name`,`vessel`,`refunds`,`clr_st`,`clr_status`,`arrival_date`,`document_status`,
	`to_clr_agent`,`duty`,`payorder_by`,	insurance`,`clr_date`,`transport_method`,`transporter_name`,`cust_id`,`lc_no`,`lc_currency`,`lc_amount`,`lc_bank`
)
	VALUES('{$data['vh_id']}', '{$data['shipped_date']}','{$data['vh_code']}')";
    }
}
    