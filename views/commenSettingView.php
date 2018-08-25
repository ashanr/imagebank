<?php

session_start();
require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$system = new setting();
$database = new database();
MainConfig::connectDB();
if (array_key_exists("action", $_POST)) {

    if ($_POST['action'] == 'subject_save') {
        $today = date('Y-m-d');
        if (empty($_POST['subject_name'])) {
            echo json_encode(array(array("msgType" => 2, "msg" => "Enter a Subject Name")));
            return;
        }
        mysql_query("START TRANSACTION");
        $ins = mysql_query("INSERT INTO `img_subject` ( `subject_name`, `subject_code` ) VALUES ( '{$_POST['subject_name']}', '{$_POST['subject_code']}');");
        $trn = mysql_query("INSERT INTO `transaction` (`tr_type`, `tr_desc`, `tr_date`, `tr_user_id`) VALUES ('INSERT', 'Subject', '{$today}', '{$_SESSION['user_id']}')");
        if ($ins && $trn) {
            mysql_query("COMMIT");
            echo json_encode(array(array("msgType" => 1, "msg" => "Subject saved")));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array(array("msgType" => 2, "msg" => "Could not save")));
        }
        MainConfig::closeDB();
    } else if ($_POST['action'] == 'subject_update') {
        $today = date('Y-m-d');
        $form = $_POST['form_data'];
        if (empty($form['subject_id'])) {
            echo json_encode(array(array("msgType" => 2, "msg" => "Select a Subject to update")));
            return;
        }
        if (empty($form['subject_name'])) {
            echo json_encode(array(array("msgType" => 2, "msg" => "Enter a Subject Name")));
            return;
        }
        foreach ($form as $key => $value) {
            $form[$key] = mysql_real_escape_string($form[$key]);
        }

        mysql_query("START TRANSACTION");
        $ins = mysql_query("UPDATE `img_subject` SET `subject_name`='{$form['subject_name']}', `subject_code`='{$form['subject_code']}' WHERE (`subject_id`='{$form['subject_id']}')") or die(mysql_error());
        $trn = mysql_query("INSERT INTO `transaction` (`tr_type`, `tr_desc`, `tr_date`, `tr_user_id`) VALUES ('UPDATE', 'Subject-{$form['subject_id']}', '{$today}', '{$_SESSION['user_id']}')") or die(mysql_error());
        if ($ins && $trn) {
            mysql_query("COMMIT");
            echo json_encode(array(array("msgType" => 1, "msg" => "Subject Updated!")));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array(array("msgType" => 2, "msg" => "Could not Update Subject!")));
        }
        MainConfig::closeDB();
    } else if ($_POST['action'] == 'subject_select') {
        $subject_id = $_POST['subject_id'];
        $system->prepareSelectQueryForJSON("SELECT
            img_subject.subject_id,
            img_subject.subject_name,
            img_subject.subject_code
            FROM
            img_subject
            WHERE
            img_subject.subject_id = '{$subject_id}'");
    } elseif ($_POST['action'] == 'delete_subject') {
        $subject_id = $_POST['subject_id'];
        $today = date('Y-m-d');

        mysql_query("START TRANSACTION");
        $ins = mysql_query("UPDATE `img_subject` SET subject_status='99' WHERE (`subject_id`='{$subject_id}')") or die(mysql_error());
        $trn = mysql_query("INSERT INTO `transaction` (`tr_type`, `tr_desc`, `tr_date`, `tr_user_id`) VALUES ('DELETE', 'Maker-{$subject_id}', '{$today}', '{$_SESSION['user_id']}')") or die(mysql_error());
        if ($ins && $trn) {
            mysql_query("COMMIT");
            echo json_encode(array(array("msgType" => 1, "msg" => "Maker Deleted")));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array(array("msgType" => 2, "msg" => "Could not delete")));
        }
        MainConfig::closeDB();
    }
}