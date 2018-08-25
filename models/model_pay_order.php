<?php

session_start();
require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$system = new setting();
$database = new database();
MainConfig::connectDB();
///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////          FORM DATA LOADING                   ///////////// 
//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////                 END!                         ///////////// 
//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////          FORM DATA SAVE,UPDATE               ///////////// 
//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////                 END!                         ///////////// 
//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////          COMBO BOX LOADING                   ///////////// 
////////////////////////          FORM DATA LOADING                   ///////////// 
//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////                 END!                         ///////////// 
//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////          FORM DATA SAVE,UPDATE               ///////////// 
//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////                 END!                         ///////////// 
//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////          COMBO BOX LOADING                   ///////////// 
//////////////////////////////////////////////////////////////////////////////////////


if (array_key_exists("comboBox", $_POST)) {
    if ($_POST['comboBox'] == 'load_vehicle_code_combo') {

        $system->prepareSelectQueryForJSON("SELECT
                    vehicle.vh_id,
                    vehicle.vh_code
                    FROM
                    vehicle
                    WHERE
                    vehicle.record_status = '1' AND
                    vehicle.stock_status = '1'");
    }
}


///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////                 END!                         ///////////// 
//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////           PAGE'S TABLE LOADING               ///////////// 
////////////////////////                 END!                         ///////////// 
//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////           PAGE'S TABLE LOADING               ///////////// 
//////////////////////////////////////////////////////////////////////////////////////

if (array_key_exists("table", $_POST)) {
    if ($_POST['table'] == 'pay_order_vh_list') {

        $query = "SELECT
                    ct_items.ct_item_id,
                    ct_items.ct_id,
                    ct_items.ct_item_type,
                    ct_items.vh_id,
                    ct_items.ref_id,
                    ct_items.ct_item_amount,
                    ct_items.ct_item_desc,
                                        vehicle.vh_code
                    FROM
                    ct_items,vehicle
                    WHERE
                    ct_items.ct_id = '{$_POST['ct_id']}' AND
                    ct_items.vh_id = vehicle.vh_id AND ct_items.ct_item_status !='99'";
        $system->prepareSelectQueryForJSON($query);
    }
}

///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////                 END!                         ///////////// 
//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////     
////////////////////        Pay Order ITEMS SAVE,UPDATE,CANCEL        ///////////// 
//////////////////////////////////////////////////////////////////////////////////////

if (array_key_exists("action", $_POST)) {
    if ($_POST['action'] == 'po_item_save') {

        //@Ashan
        $today = date('Y-m-d');
        $data = $_POST['po_item_data'];

        if (empty($data['vh_amount'])) {
            echo json_encode(array(array("msgType" => 2, "msg" => "Add Amount for selected Vehicle")));
            return;
        }

        foreach ($data as $key => $value) {
            $data[$key] = mysql_real_escape_string($data[$key]);
        }
        mysql_query("START TRANSACTION");

//          
//         $in_query = mysql_query("INSERT INTO `credit_transfer` (`ct_id`,`ref_no`,`ct_type`,`user_id`,`ct_date`,`ct_item_desc`,`ct_status`) SELECT * FROM (SELECT '{$data['ct_id']}','{$data['ref_no']}','pay_order','{$_SESSION['user_id']}','{$today}','98')"
//                    . " WHERE NOT EXISTS (SELECT `credit_transfer`.`ref_no`  FROM   `credit_transfer`  WHERE `credit_transfer`.`ct_id` = '{$data['ct_id']}') LIMIT 0");
//           
        //$del_temp_po = mysql_query("DELETE FROM credit_transfer WHERE credit_transfer.ct_status= 98 ");
        
        $ins_po = mysql_query("INSERT INTO `credit_transfer` (`ct_id`,`ref_no`,`ct_type`,`ct_date`,`ct_status`) VALUES('{$data['ct_id']}','{$data['ref_no']}','pay_order','{$today}','98') ON DUPLICATE KEY UPDATE ct_status = '1'");


        $ins = mysql_query("INSERT INTO `ct_items` (`ct_id`,`ct_item_type`,`vh_id`,`ref_id`,`ct_item_amount`,`ct_item_desc`,`ct_item_status`) "
                . "VALUES('{$data['ct_id']}','pay_order','{$data['vh_id']}','{$data['ref_no']}',"
                . "'{$data['vh_amount']}','{$data['ct_item_desc']}','1')  ON DUPLICATE KEY UPDATE `ct_item_amount` = '{$data['vh_amount']}' ,`ct_item_status` = '1'");

        $error = mysql_error();
        if ($ins) {
            mysql_query("COMMIT");
            echo json_encode(array(array("msgType" => 1, "msg" => "Pay Order Item Added")));
        } else {

            mysql_query("ROLLBACK");
            echo json_encode(array(array("msgType" => 2, "msg" => $error)));
        }
        MainConfig::closeDB();
    } elseif ($_POST['action'] == 'po_item_update') {
        $data = $_POST['po_item_data'];
        $po_item_id = $_POST['po_item_id'];
        $today = date('Y-m-d');
//        if (empty($data['vh_amount'])) {
//            echo json_encode(array(array("msgType" => 2, "msg" => "Add Amount for selected Vehicle")));
//            return;
//        }
        mysql_query("START TRANSACTION");
        $ins = mysql_query("UPDATE `ct_items` SET ct_item_amount='{$data['vh_amount']}' WHERE (`ct_item_id`='{$po_item_id}')");
        $error = mysql_error();
        $trn = mysql_query("INSERT INTO `transaction` (`tr_type`, `tr_desc`, `tr_date`, `tr_user_id`) VALUES ('UPDATE', 'PO Vehicle-{$po_item_id}', '{$today}', '{$_SESSION['user_id']}')") or die(mysql_error());
        if ($ins && $trn) {
            mysql_query("COMMIT");
            echo json_encode(array(array("msgType" => 1, "msg" => "Vehicle Amount Updated")));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array(array("msgType" => 2, "msg" => $error)));
        }
        MainConfig::closeDB();
    } else if ($_POST['action'] == 'add_pay_order') {
        $today = date('Y-m-d');
        $data = $_POST['form_data'];
        foreach ($data as $key => $value) {
            $data[$key] = mysql_real_escape_string($data[$key]);
        }
        /* if (empty($data['from_bank'])) {
          echo json_encode(array(array("msgType" => 2, "msg" => "Add from bank")));
          return;
          }
          if (empty($data['from_name'])) {
          echo json_encode(array(array("msgType" => 2, "msg" => "Add from name")));
          return;
          }
         */
        mysql_query("START TRANSACTION");
        $insert_query = "INSERT INTO `credit_transfer` (`ct_id`,`ref_no`,`ct_type`,`from_bank`,`from_bank_branch`,`from_name`,`from_address`,`from_acc_no`,`to_bank`,
	`to_bank_branch`,`to_name`,`to_acc_no`,`ct_amount`,`ct_address`,`ct_header`,`ct_message`,`ho_name`,`ho_nic`,`user_id`,`ct_description`,`ct_date`,`ct_status`)
        VALUES 
	('{$data['ct_id']}','{$data['ref_no']}','pay_order','{$data['from_bank']}',"
                . "'{$data['from_bank_branch']}','{$data['from_name']}','{$data['from_address']}','{$data['from_acc_no']}','{$data['to_bank']}','{$data['to_bank_branch']}','{$data['to_name']}','{$data['to_acc_no']}','{$data['ct_amount']}',"
                . "'{$data['ct_address']}','{$data['ct_header']}','{$data['ct_body']}','{$data['ho_name']}','{$data['ho_nic']}','{$_SESSION['user_id']}','{$data['ct_description']}','{$today}','1')";

        $error = mysql_error();
        $trnsaction_query = "INSERT INTO `transaction` (`tr_type`, `tr_desc`, `tr_date`, `tr_user_id`) VALUES ('INSERT', 'pay_order', '{$today}', '{$_SESSION['user_id']}')";

        mysql_query("START TRANSACTION");
        $insert = mysql_query($insert_query);

        $id = mysql_insert_id();

        if ($insert_query) {
            mysql_query($trnsaction_query)or die(mysql_error());
            mysql_query("COMMIT");
            echo json_encode(array(array("msgType" => 1, "msg" => "Pay Order Added.", "resp" => $id)));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array(array("msgType" => 2, "msg" => "unable to add pay order")));
        }
        MainConfig::closeDB();
    } else if ($_POST['action'] == 'po_update') {
        $today = date('Y-m-d');
        $data = $_POST['form_data'];
        foreach ($data as $key => $value) {
            $data[$key] = mysql_real_escape_string($data[$key]);
        }
        $update_query = "UPDATE `credit_transfer`
                        SET 
                         `ref_no` = '{$data['ref_no']}',
                         `ct_type` = 'pay_order',
                         `from_bank` = '{$data['from_bank']}',
                         `from_bank_branch` = '{$data['from_bank_branch']}',
                         `from_name` = '{$data['from_name']}',
                         `from_address` = '{$data['from_address']}',
                         `from_acc_no` = '{$data['from_acc_no']}',
                         `to_bank` = '{$data['to_bank']}',
                         `to_bank_branch` = '{$data['to_bank_branch']}',
                         `to_name` = '{$data['to_name']}',
                         `to_acc_no` = '{$data['to_acc_no']}',
                         `ct_amount` = '{$data['ct_amount']}',
                         `ct_address` = '{$data['ct_address']}',
                         `ct_header` = '{$data['ct_header']}',
                         `ct_message` = '{$data['ct_body']}',
                         `user_id` = '{$_SESSION['user_id']}',
                         `ct_description` = '{$data['ct_description']}',
                         `ct_date` = '{$data['ct_date']}',
                         `ho_name` = '{$data['ho_name']}',
                         `ho_nic` = '{$data['ho_nic']}',
                         `ct_status` = '1'
                          WHERE
                         (`ct_id` = '{$data['ct_id']}');";
        $error = mysql_error();

        $trnsaction_query = "INSERT INTO `transaction` (`tr_type`, `tr_desc`, `tr_date`, `tr_user_id`) VALUES ('UPDATE', 'credit_transfers', '{$today}', '{$_SESSION['user_id']}')";
        mysql_query("START TRANSACTION");
        $insert = mysql_query($update_query) or die(mysql_error());
        if ($update_query) {
            mysql_query($trnsaction_query)or die(mysql_error());
            mysql_query("COMMIT");

            echo json_encode(array(array("msgType" => 1, "msg" => "Pay Order Updated.")));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array(array("msgType" => 2, "msg" => $error)));
        }
        MainConfig::closeDB();
    } else if ($_POST['action'] == 'get_po_info') {
//  **************** credit transfers *************************************
        $ct_id = $_POST['ct_id'];
        $system->prepareSelectQueryForJSON("SELECT
credit_transfer.ct_id,
credit_transfer.ref_no,
credit_transfer.ct_type,
credit_transfer.from_bank,
credit_transfer.from_bank_branch,
credit_transfer.from_name,
credit_transfer.from_address,
credit_transfer.from_acc_no,
credit_transfer.to_bank,
credit_transfer.to_bank_branch,
credit_transfer.to_name,
credit_transfer.to_acc_no,
credit_transfer.ct_amount,
credit_transfer.ct_address,
credit_transfer.ct_header,
credit_transfer.ct_message,
credit_transfer.ho_name,
credit_transfer.ho_nic,
credit_transfer.user_id,
credit_transfer.ct_description,
credit_transfer.ct_date,
credit_transfer.ct_status
FROM
credit_transfer
WHERE credit_transfer.ct_id = '{$ct_id}'");
    } else if ($_POST['action'] == 'get_po_item_info') {
//  **************** credit transfers *************************************
        $ct_id = $_POST['ct_item_id'];
        $system->prepareSelectQueryForJSON("SELECT
                ct_items.ct_item_id,
                ct_items.ct_id,
                ct_items.ct_item_type,
                ct_items.vh_id,
                ct_items.ref_id,
                ct_items.ct_item_amount,
                ct_items.ct_item_desc,
                ct_items.ct_item_status
                FROM
                ct_items
                WHERE
                ct_items.ct_item_id = '{$ct_id}'");
    } elseif ($_POST['action'] == 'delete_po_item') {
        $po_item_id = $_POST['po_item_id'];
        $today = date('Y-m-d');

        mysql_query("START TRANSACTION");
       // $del = mysql_query("DELETE from `ct_items` WHERE(`ct_item_id`='{$po_item_id}')");
        $del = mysql_query("UPDATE `ct_items` SET `ct_item_status` ='99' WHERE (`ct_item_id`='{$po_item_id}')") or die(mysql_error());
        $trn = mysql_query("INSERT INTO `transaction` (`tr_type`, `tr_desc`, `tr_date`, `tr_user_id`) VALUES ('DELETE', 'PO Vehicle-{$po_item_id}', '{$today}', '{$_SESSION['user_id']}')") or die(mysql_error());
        if ($del && $trn) {
            mysql_query("COMMIT");
            echo json_encode(array(array("msgType" => 1, "msg" => "Vehicle Removed")));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array(array("msgType" => 2, "msg" => "Could not delete")));
        }
        MainConfig::closeDB();
    } else if ($_POST['action'] == 'get_payorder_total') {
//  **************** credit transfers *************************************
        $ct_id = $_POST['ct_id'];
        $system->prepareSelectQueryForJSON("SELECT
                        SUM(ct_items.ct_item_amount) as po_total
                        FROM
                        ct_items
                        WHERE
                        ct_id ='{$ct_id}' AND ct_items.ct_item_status =1");
    }
}

///////////////////////////////////////////////////////////////////////////////////////     
        ////////////////////////                 END!                         ///////////// 
//////////////////////////////////////////////////////////////////////////////////////
   

        