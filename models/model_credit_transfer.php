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
////////////////////////         CT CRUD OPERATIONS                    ///////////// 
//////////////////////////////////////////////////////////////////////////////////////

if (array_key_exists("action", $_POST)) {

    if ($_POST['action'] == 'add_bank') {
        // Customer Bank Save
        $data = $_POST['form_data'];
        if (strlen($data['bank_name']) > 0) {
            foreach ($data as $key => $value) {
                $data[$key] = mysql_real_escape_string($data[$key]);
            }

            $ins = mysql_query("INSERT INTO `bank` (`bank_name`,`bank_address`,`bank_status`) VALUES('{$data['bank_name']}', '{$data['bank_address']}', '1')");
            echo $ins;
            exit;
            $error = mysql_error();
            if ($ins) {
                echo json_encode(array(array("msgType" => 1, "msg" => "Customer Bank Added")));
            } else {
                echo json_encode(array(array("msgType" => 2, "msg" => $error)));
            }
            MainConfig::closeDB();
        }
    } else if ($_POST['action'] == 'lease_co_select') {
        $co_id = $_POST['co_id'];
        $system->prepareSelectQueryForJSON("SELECT
leasing.ls_id,
 leasing.ls_name,
 leasing.ls_address,
 leasing.ls_contact,
 leasing.ls_status
FROM
leasing
WHERE
leasing.ls_id = '{$co_id}'");
//
    } else if ($_POST['action'] == 'lease_co_update') {
        $today = date('Y-m-d');
        $form = $_POST['form_data'];
        if (empty($form['co_id'])) {
            echo json_encode(array(array("msgType" => 2, "msg" => "Select an entry update")));
            return;
        }
        if (empty($form['co_name'])) {
            echo json_encode(array(array("msgType" => 2, "msg" => "Enter a Name")));
            return;
        }
        foreach ($form as $key => $value) {
            $form[$key] = mysql_real_escape_string($form[$key]);
        }

        mysql_query("START TRANSACTION");
        $ins = mysql_query("UPDATE leasing
SET ls_name = '{$form['co_name']}',
 ls_address = '{$form['co_address']}'
WHERE
(`ls_id` = '{$form['co_id']}');
") or die(mysql_error());
        $trn = mysql_query("INSERT INTO `transaction` (`tr_type`, `tr_desc`, `tr_date`, `tr_user_id`) VALUES ('UPDATE', 'Leasing Company', '{$today}', '{$_SESSION['user_id']}')") or die(mysql_error());
        if ($ins && $trn) {
            mysql_query("COMMIT");
            echo json_encode(array(array("msgType" => 1, "msg" => "Bank saved")));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array(array("msgType" => 2, "msg" => "Could not save")));
        }
        MainConfig::closeDB();
//
    } else if ($_POST['action'] == 'delete_lease_co') {
//Sam_Rulz
        $today = date('Y-m-d');
        $lease_id = $_POST['lease_id'];
        $delete_query = "DELETE FROM leasing WHERE leasing.ls_id = '$lease_id'";
        $transaction_query = "INSERT INTO `transaction` (`tr_type`, `tr_desc`, `tr_date`, `tr_user_id`) VALUES ('DELETE', 'Leasing Co-{$lease_id}', '{$today}', '{$_SESSION['user_id']}')";

        mysql_query("START TRANSACTION");
        $delete = mysql_query($delete_query);
        $transaction = mysql_query($transaction_query);
        if ($delete && $transaction) {
            mysql_query('COMMIT');
            echo json_encode(array(array("msgType" => 1, "msg" => "Successfully Deleted.")));
        } else {
            mysql_query('ROLLBACK');
            echo json_encode(array(array("msgType" => 2, "msg" => "Cannot Be Deleted.")));
        }
        MainConfig::closeDB();
//
    } else if ($_POST['action'] == 'cus_bank_select') {
        $bank_id = $_POST['bank_id'];
        $system->prepareSelectQueryForJSON("SELECT
                                            bank.bank_id,
                                            bank.bank_name,
                                            bank.bank_address,
                                            bank.bank_contact,
                                            bank.bank_status
                                            FROM
                                            bank
                                            WHERE
                                            bank.bank_id = '{$bank_id}'");
    } else if ($_POST['action'] == 'cusbank_update') {
        $today = date('Y-m-d');
        $form = $_POST['form_data'];
        if (empty($form['bank_id'])) {
            echo json_encode(array(array("msgType" => 2, "msg" => "Select an entry update")));
            return;
        }
        if (empty($form['bank_name'])) {
            echo json_encode(array(array("msgType" => 2, "msg" => "Enter a Name")));
            return;
        }
        foreach ($form as $key => $value) {
            $form[$key] = mysql_real_escape_string($form[$key]);
        }

        mysql_query("START TRANSACTION");
        $ins = mysql_query("UPDATE bank
SET bank_name = '{$form['bank_name']}',
 bank_address = '{$form['bank_address']}'
WHERE
(`bank_id` = '{$form['bank_id']}');
") or die(mysql_error());
        $trn = mysql_query("INSERT INTO `transaction` (`tr_type`, `tr_desc`, `tr_date`, `tr_user_id`) VALUES ('UPDATE', 'Customer Bank', '{$today}', '{$_SESSION['user_id']}')") or die(mysql_error());
        if ($ins && $trn) {
            mysql_query("COMMIT");
            echo json_encode(array(array("msgType" => 1, "msg" => "Bank saved")));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array(array("msgType" => 2, "msg" => "Could not save")));
        }
        MainConfig::closeDB();
//
    } else if ($_POST['action'] == 'delete_cus_bank') {
//Ashan
        $today = date('Y-m-d');
        $bank_id = $_POST['bank_id'];
        $delete_query = "DELETE FROM bank WHERE bank.bank_id = '$bank_id'";
        $transaction_query = "INSERT INTO `transaction` (`tr_type`, `tr_desc`, `tr_date`, `tr_user_id`) VALUES ('DELETE', 'Customer Bank-{$bank_id}', '{$today}', '{$_SESSION['user_id']}')";

        mysql_query("START TRANSACTION");
        $delete = mysql_query($delete_query);
        $transaction = mysql_query($transaction_query);
        if ($delete && $transaction) {
            mysql_query('COMMIT');
            echo json_encode(array(array("msgType" => 1, "msg" => "Bank Successfully Deleted.")));
        } else {
            mysql_query('ROLLBACK');
            echo json_encode(array(array("msgType" => 2, "msg" => "Cannot Be Deleted.")));
        }
        MainConfig::closeDB();
//
    } elseif ($_POST['action'] == 'add_sysbank') {
        // ///////////////////////////////////
        // //System Bank Save//////////////////////
        /////////////////////////////////////////
        $data = $_POST['form_data'];
        if (strlen($data['sysbank_name']) > 0) {
            foreach ($data as $key => $value) {
                $data[$key] = mysql_real_escape_string($data[$key]);
            }
           $ins = mysql_query("INSERT INTO `sys_bank` (`bank_name`,`bank_address`,`account_name`,`account_no`,`bank_status`) VALUES('{$data['sysbank_name']}', '{$data['sysbank_address']}', '{$data['account_name']}', '{$data['account_no']}', '1')");

            $error = mysql_error();
            if ($ins) {
                echo json_encode(array(array("msgType" => 1, "msg" => "System Bank Added")));
            } else {
                echo json_encode(array(array("msgType" => 2, "msg" => $error)));
            }
            MainConfig::closeDB();
        }
    } else if ($_POST['action'] == 'sys_bank_select') {
        $bank_id = $_POST['sysbank_id'];
        $system->prepareSelectQueryForJSON("SELECT
                                            sys_bank.bank_id,
                                            sys_bank.bank_name,
                                            sys_bank.bank_address,
                                            sys_bank.account_name,
                                            sys_bank.account_no,
                                            sys_bank.bank_contact,
                                            sys_bank.bank_status,
                                            sys_bank.address
                                            FROM
                                            sys_bank
                                            WHERE
                                            sys_bank.bank_id = '{$bank_id}'");
    
                                            
                                            } else if ($_POST['action'] == 'sysbank_update') {
        $today = date('Y-m-d');
        $form = $_POST['form_data'];

        if (empty($form['sysbank_name'])) {
            echo json_encode(array(array("msgType" => 2, "msg" => "Enter a Name")));
            return;
        }
        foreach ($form as $key => $value) {
            $form[$key] = mysql_real_escape_string($form[$key]);
        }
       
        mysql_query("START TRANSACTION");
        $ins = mysql_query("UPDATE sys_bank
         SET bank_name = '{$form['sysbank_name']}',
         bank_address = '{$form['sysbank_address']}',
         account_name = '{$form['account_name']}',
         account_no = '{$form['account_no']}',
         address = '{$form['address']}'
            WHERE
            (`bank_id` = '{$form['sysbank_id']}')") or die(mysql_error());
        $trn = mysql_query("INSERT INTO `transaction` (`tr_type`, `tr_desc`, `tr_date`, `tr_user_id`) VALUES ('UPDATE', 'System Bank', '{$today}', '{$_SESSION['user_id']}')") or die(mysql_error());
        if ($ins && $trn) {
            mysql_query("COMMIT");
            echo json_encode(array(array("msgType" => 1, "msg" => "Bank saved")));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array(array("msgType" => 2, "msg" => "Could not save")));
        }
        MainConfig::closeDB();
//
    } else if ($_POST['action'] == 'delete_sys_bank') {
//Ashan
        $today = date('Y-m-d');
        $bank_id = $_POST['sys_bank_id'];
        $delete_query = "DELETE FROM sys_bank WHERE sys_bank.bank_id = '$bank_id'";
        $transaction_query = "INSERT INTO `transaction` (`tr_type`, `tr_desc`, `tr_date`, `tr_user_id`) VALUES ('DELETE', 'Customer Bank-{$bank_id}', '{$today}', '{$_SESSION['user_id']}')";

        mysql_query("START TRANSACTION");
        $delete = mysql_query($delete_query);
        $transaction = mysql_query($transaction_query);
        if ($delete && $transaction) {
            mysql_query('COMMIT');
            echo json_encode(array(array("msgType" => 1, "msg" => "Bank Successfully Deleted.")));
        } else {
            mysql_query('ROLLBACK');
            echo json_encode(array(array("msgType" => 2, "msg" => "Cannot Be Deleted.")));
        }
        MainConfig::closeDB();
//
    }
}

///////////////////////////////////////////////////////////////////////////////////////     
/////////////////////         END OF CRUD OPERATIONS                ///////////// 
//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////     
/////////////////////         CREDIT TRANSFER RELATED TABLES       ///////////// 
//////////////////////////////////////////////////////////////////////////////////////



if (array_key_exists("table", $_POST)) {
    if ($_POST['table'] == 'load_cus_bank_tbl') {
        $system->prepareSelectQueryForJSON("SELECT
                                            bank.bank_id,
                                            bank.bank_name,
                                            bank.bank_address,
                                            bank.bank_contact,
                                            bank.bank_status
                                            FROM
                                            bank
                                            ");
    } elseif ($_POST['table'] == 'load_sys_bank_tbl') {

        $query = "SELECT                        sys_bank.bank_id,
                                            sys_bank.bank_name,
                                            sys_bank.bank_address,
                                            sys_bank.account_name,
                                            sys_bank.account_no,
                                            sys_bank.bank_contact,
                                            sys_bank.bank_status,
                                            sys_bank.address
                                            FROM
                                            sys_bank ";
        $system->prepareSelectQueryForJSON($query);
    }
}



///////////////////////////////////////////////////////////////////////////////////////     
   /////////////////////         DELETE TRANSFER RELATED TABLES       ///////////// 
//////////////////////////////////////////////////////////////////////////////////////

