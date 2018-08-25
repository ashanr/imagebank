<?php

session_start();
require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$system = new setting();
$database = new database();
MainConfig::connectDB();
if (array_key_exists("action", $_POST)) {
    if ($_POST['action'] == 'driver_payment_save') {
        $today = date('Y-m-d');
        $data = $_POST['drch_data'];
        foreach ($data as $key => $value) {
            $data[$key] = mysql_real_escape_string($data[$key]);
        }
        if (empty($data['driver_id'])) {
            echo json_encode(array(array("msgType" => 2, "msg" => "Select Name of the Driver")));
            return;
        }
        if (empty($data['drch_date'])) {
            echo json_encode(array(array("msgType" => 2, "msg" => "Please select a valid date!")));
            return;
        }

//        if (empty($data['vh_id'])) {
//            echo json_encode(array(array("msgType" => 2, "msg" => "Please select a Vehicle From the List!")));
//            return;
//        }

        $insert_query = "INSERT INTO `driver_charges` (`drch_id`,`driver_id`,`driver_name`,`drch_date`,`drch_desc`,
            `drch_type`,`from`,`destination`,`drch_salary`,`drch_petrol`,`drch_expenses`,`drch_advance`,`drch_payment`,`pay_status`,`record_status`)
        VALUES ('{$data['drch_id']}','{$data['driver_id']}','{$data['driver_name']}','{$data['drch_date']}','{$data['drch_desc']}','{$data['drch_type']}','{$data['from']}','{$data['destination']}','{$data['drch_salary']}','{$data['drch_petrol']}','{$data['drch_expenses']}','{$data['drch_advance']}','{$data['drch_payment']}','{$data['pay_status']}','1');";

        mysql_query("START TRANSACTION");
        $trnsaction_query = mysql_query("INSERT INTO `transaction` (`tr_type`, `tr_desc`, `tr_date`, `tr_user_id`) VALUES ('ADD', 'driver payment', '{$today}', '{$_SESSION['user_id']}')");
        $insert = mysql_query($insert_query);
        $error = mysql_error();
        if ($insert && $trnsaction_query) {
            mysql_query("COMMIT");
            echo json_encode(array(array("msgType" => 1, "msg" => "Driver Payment Added.")));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array(array("msgType" => 2, "msg" => "Couldn't Add Payment.")));
        }
        MainConfig::closeDB();
    } else if ($_POST['action'] == 'add_driver_balance') {
//        echo $data['vh_id'];
        $today = date('Y-m-d');
        $data = $_POST['drch_data'];
        foreach ($data as $key => $value) {
            $data[$key] = mysql_real_escape_string($data[$key]);
        }
        if (empty($data['driver_id'])) {
            echo json_encode(array(array("msgType" => 2, "msg" => "Select A driver form the List!")));
            return;
        }
        if ($data['drch_type'] == "0") {
            if (empty($data['vh_id'])) {
                echo json_encode(array(array("msgType" => 2, "msg" => "Please select a Vehicle From the List!")));
                return;
            }
        }
        if (empty($data['driver_name'])) {
            echo json_encode(array(array("msgType" => 2, "msg" => "Enter Name of the Driver")));
            return;
        }
        if (empty($data['drch_date'])) {
            echo json_encode(array(array("msgType" => 2, "msg" => "Please select a valid date!")));
            return;
        }
        $insert_query = "INSERT INTO `driver_charges` (`drch_id`, `driver_id`,`driver_name`,`drch_date`,`vh_id`,`drch_desc`,
            `drch_type`,`from`,`destination`,`drch_salary`,`drch_petrol`,`drch_expenses`,`drch_advance`,`drch_payment`,`pay_status`,`record_status`)
        VALUES 
	('{$data['drch_id']}','{$data['driver_id']}','{$data['driver_name']}','{$data['drch_date']}','{$data['vh_id']}','{$data['drch_desc']}','{$data['drch_type']}','{$data['from']}','{$data['destination']}','{$data['drch_salary']}','{$data['drch_petrol']}','{$data['drch_expenses']}','{$data['drch_advance']}','{$data['drch_payment']}','{$data['pay_status']}','1');";

        $trnsaction_query = mysql_query("INSERT INTO `transaction` (`tr_type`, `tr_desc`, `tr_date`, `tr_user_id`) VALUES ('INSERT', 'driver charges', '{$today}', '{$_SESSION['user_id']}')");
        mysql_query("START TRANSACTION");
        $insert = mysql_query($insert_query) or die(mysql_error());

        if ($insert) {
            mysql_query("COMMIT");
            echo json_encode(array("msgType" => 1, "msg" => "Driver Balance Added."));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array("msgType" => 2, "msg" => "Couldn't Add."));
        }
        MainConfig::closeDB();
    } else if ($_POST['action'] == 'update_driver_balance') {
        $today = date('Y-m-d');
        $data = $_POST['drch_data'];
        foreach ($data as $key => $value) {
            $data[$key] = mysql_real_escape_string($data[$key]);
        }

        if (empty($data['driver_name'])) {
            echo json_encode(array(array("msgType" => 2, "msg" => "Enter Name of the Driver")));
            return;
        }
        if (empty($data['drch_date'])) {
            echo json_encode(array(array("msgType" => 2, "msg" => "Please select a valid date!")));
            return;
        }

//
        $insert_query = "UPDATE `driver_charges` SET `drch_date` ='{$data['drch_date']}',`vh_id`=,`drch_desc`='{$data['drch_desc']}',
            `drch_type`='{$data['drch_type']}',`from`='{$data['from']}',`destination`='{$data['destination']}',`drch_salary`='{$data['drch_salary']}',`drch_petrol`='{$data['drch_petrol']}',`drch_expenses`='{$data['drch_expenses']}',`drch_advance`='{$data['drch_advance']}',`pay_status`='{$data['pay_status']}',`record_status`=1 ";

        $trnsaction_query = mysql_query("INSERT INTO `transaction` (`tr_type`, `tr_desc`, `tr_date`, `tr_user_id`) VALUES ('UPDATE', 'driver charges-', '{$today}', '{$_SESSION['user_id']}')");
        mysql_query("START TRANSACTION");
        $insert = mysql_query($insert_query) or die(mysql_error());

        if ($insert) {
            mysql_query("COMMIT");
            echo json_encode(array("msgType" => 1, "msg" => "Driver Balance Update."));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array("msgType" => 2, "msg" => "Couldn't Update."));
        }
        MainConfig::closeDB();
    }
}
