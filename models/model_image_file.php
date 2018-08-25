<?php

session_start();
require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$system = new setting();
$database = new database();
MainConfig::connectDB();
if (array_key_exists("action", $_POST)) {
    if ($_POST['action'] == 'load_image_file_data') {
        $today = date('Y-m-d');
        $ai_id = $_POST['image_ai_id'];

        $system->prepareSelectQueryForJSON("SELECT
                                        img_file.file_category,
                                        img_file.file_id,
                                        img_file.file_name,
                                        img_file.file_description,
                                        img_file.file_added_date,
                                        img_file.file_last_update_date,
                                        img_file.pdf_file,
                                        img_file.image_file,
                                        img_file.rack_no,
                                        img_file.row_no,
                                        img_file.box_no,
                                        img_file.`status`,
                                        img_file.image_ai_id
                                        FROM `img_file`
                                        WHERE
                                        img_file.image_ai_id ='{$ai_id}'");


        //
        //                                        SELECT FILE DATE FOR LOAD
    //
                                        
    } else if ($_POST['action'] == 'add_file') { //SAVING A IMAGE FILE
        $today = date('Y-m-d');
        $data = $_POST['form_data'];
        foreach ($data as $key => $value) {
            $data[$key] = mysql_real_escape_string($data[$key]);
        }
        if (!isset($data['file_number']) || empty($data['file_number'])) {
            echo json_encode(array("msgType" => 2, "msg" => "Please enter Document Number."));
            exit;
        }
        if (!isset($data['file_name']) || empty($data['file_name'])) {
            echo json_encode(array("msgType" => 2, "msg" => "Please enter file name."));
            exit;
        }

        //get next index number for vehicle
        $query = "SELECT IFNULL(MAX(img_file.file_id)+1, 1) AS next_file_id FROM img_file";
        $result = mysql_query($query);
        $arr_nxtid = mysql_fetch_assoc($result);
        $nextnum = $arr_nxtid['next_file_id'];

        $insert_query = "INSERT INTO `img_file` ( `file_category`,"
                . " `file_id`,"
                . " `file_name`,"
                . " `file_description`,"
                . " `file_added_date`,"
                . " `file_last_update_date`,"
                . " `rack_no`, "
                . " `row_no`,"
                . " `box_no` )"
                . " VALUES ('{$data['category']}',"
                . " '{$data['file_number']}',"
                . " '{$data['file_name']}',"
                . " '{$data['description']}',"
                . " DATE_FORMAT(CURDATE(),'%Y-%m-%d'),"
                . " DATE_FORMAT(CURDATE(),'%Y-%m-%d'), "
                . " '{$data['rack_no']}',"
                . " '{$data['row_no']}',"
                . " '{$data['box_no']}')";

//                echo $insert_query;exit;
        mysql_query("START TRANSACTION");
        $insert = mysql_query($insert_query) or die(mysql_error());
        $id = mysql_insert_id();
//        $insert_modification = mysql_query("INSERT INTO `vehicle_modification`(`request_date`, `desc`, `vh_id`, `cus_id`, `sort_order`, `mod_status`, `options`, `other_opt`)VALUES ( '{$today}', 'initial status of vehicle', '{$id}', '0', '0', 'Default', '{$data['v_opt']}', '{$data['v_other']}');
//") or die(mysql_error());
//        $transaction = mysql_query($trnsaction_query);
        if ($insert) {
//            echo $id;
            mysql_query("COMMIT");
            echo json_encode(array("msgType" => 1, "msg" => "File Added.", "resp" => $id));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array("msgType" => 2, "msg" => "Couldn't Add Vehicle."));
        }
        MainConfig::closeDB();
    } else if ($_POST['action'] == 'update_file') { //UPDATING A IMAGE FILE
        $today = date('Y-m-d');
        $data = $_POST['form_data'];
        foreach ($data as $key => $value) {
            $data[$key] = mysql_real_escape_string($data[$key]);
        }

        if (!isset($data['file_name']) || empty($data['file_name'])) {
            echo json_encode(array("msgType" => 2, "msg" => "Please enter file name."));
        }

        //get next index number for vehicle
        $query = "SELECT IFNULL(MAX(img_file.file_id)+1, 1) AS next_file_id FROM img_file";
        $result = mysql_query($query);
        $arr_nxtid = mysql_fetch_assoc($result);
        $nextnum = $arr_nxtid['next_file_id'];

        $insert_query = "UPDATE `img_file` SET `file_category` ='{$data['category']}',"
                . " `file_id` = '{$data['file_no']}',"
                . " `file_name` ='{$data['file_name']}' ,"
                . " `file_description` = '{$data['description']}',"
                . " `file_last_update_date` = DATE_FORMAT(CURDATE(),'%Y-%m-%d'),"
                . " `rack_no` = '{$data['rack_no']}', "
                . " `row_no` ='{$data['row_no']}',"
                . " `box_no` ='{$data['box_no']}' WHERE `image_ai_id` = '{$data['image_ai_id']}'";

        // echo $insert_query;exit;
        mysql_query("START TRANSACTION");
        $insert = mysql_query($insert_query) or die(mysql_error());
        $id = mysql_insert_id();
//        $insert_modification = mysql_query("INSERT INTO `vehicle_modification`(`request_date`, `desc`, `vh_id`, `cus_id`, `sort_order`, `mod_status`, `options`, `other_opt`)VALUES ( '{$today}', 'initial status of vehicle', '{$id}', '0', '0', 'Default', '{$data['v_opt']}', '{$data['v_other']}');
//") or die(mysql_error());
//        $transaction = mysql_query($trnsaction_query);
        if ($insert) {
//            echo $id;
            mysql_query("COMMIT");
            echo json_encode(array("msgType" => 1, "msg" => "File Added.", "resp" => $id));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array("msgType" => 2, "msg" => "Couldn't Add Vehicle."));
        }
        MainConfig::closeDB();
    }
}