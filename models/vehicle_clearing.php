<?php

require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$dbClass = new database();
$system = new setting();

if (array_key_exists("action", $_POST)) {
    if ($_POST['action'] == 'load_clearing_info') {
        //@Ashan
        $system->prepareSelectQueryForJSON("SELECT
                        vh_clearing.clr_id,
                        vehicle.vh_id,
                        vehicle.vh_index_num,
                        vehicle.vh_code,
                        vehicle.vh_chassis_code,
                        vehicle.vh_chassis_num,
                        vehicle.engine_code,
                        vehicle.engine_num,
                        vehicle.engine_cc,
                        vehicle.auc_display_price,
                        vehicle.stock_location,
                        vehicle.stock_status,
                        maker_model.mod_name,
                        maker.maker_name,
                        coordinator.short_name,
                        vehicle.color_group,
                        vh_clearing.shipped_date,
                        vh_clearing.vessel,
                        vh_clearing.refunds,
                        vh_clearing.arrival_date,
                        vh_clearing.document_status,
                        vh_clearing.clr_status,
                        supplier.supp_id,
                        supplier.supp_name,
                        vh_clearing.duty,
                        vh_clearing.clr_date,
                        vh_clearing.lc_no,
                        vh_clearing.transporter_name,
                        vh_clearing.to_clr_agent,
                        vh_clearing.driver_name
                        FROM
                        vehicle
                        INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
                        INNER JOIN maker ON maker_model.maker_id = maker.maker_id
                        LEFT JOIN coordinator ON vehicle.coordinator_id = coordinator.coordinator_id
                        INNER JOIN supplier ON vehicle.supp_id = supplier.supp_id
                        LEFT JOIN vh_clearing ON vh_clearing.vh_id = vehicle.vh_id
                        WHERE
                        vehicle.record_status = '1'
AND vh_clearing.vh_id ='{$_POST['vh_id']}'");
    } else if ($_POST['action'] == 'sel_clr_data') {
        $query = "SELECT
                vehicle.vh_id,
                vehicle.vh_code,
                maker_model.mod_name,
                vehicle.package,
                vehicle.vh_year,
                vehicle.vh_color,
                maker_model.mod_id,
                vh_clearing.shipped_date,
                vh_clearing.vh_marks_invoice,
                vh_clearing.driver_name,
                vh_clearing.vessel,
                vh_clearing.refunds,
                vh_clearing.clr_st,
                vh_clearing.clr_status,
                vh_clearing.arrival_date,
                vh_clearing.clr_id,
                vh_clearing.vh_id,
                vh_clearing.clr_group,
                vh_clearing.coordinator,
                vh_clearing.document_status,
                vh_clearing.to_clr_agent,
                vh_clearing.duty,
                vh_clearing.payorder_by,
                vh_clearing.insurance,
                vh_clearing.clr_date,
                vh_clearing.transport_method,
                vh_clearing.transporter_name,
                vh_clearing.cust_id,
                vh_clearing.lc_no,
                vh_clearing.lc_currency,
                vh_clearing.lc_amount,
                vh_clearing.lc_bank
                FROM
                vehicle
                INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
                INNER JOIN vh_clearing ON vh_clearing.vh_id = vehicle.vh_id
                WHERE vehicle.vh_id =('{$_POST['vh_id']}')";
        $system->prepareSelectQueryForJSON($query);
    } else if ($_POST['action'] == 'save_clr_entry') {
        //@Ashan
        $today = date('Y-m-d');
        $data = $_POST['form_data'];
        mysql_query("START TRANSACTION");
        $data = $_POST['form_data'];
        $today = date('Y-m-d');

        if (empty($data['vh_id'])) {
            echo json_encode(array(array("msgType" => 2, "msg" => "Select a vehicle")));
            return;
        }
        if (empty($data['shipped_date'])) {
            echo json_encode(array(array("msgType" => 2, "msg" => "Select the Shipped Date")));
            return;
        }

        if (empty($data['driver_name'])) {
            echo json_encode(array(array("msgType" => 2, "msg" => "Enter driver name")));
            return;
        }

        foreach ($data as $key => $value) {
            $data[$key] = mysql_real_escape_string($data[$key]);
        }
        MainConfig::connectDB();
        mysql_query("START TRANSACTION");
        $ins = "INSERT INTO `vh_clearing` (`vh_id`, `shipped_date`, `driver_name`,
        `vessel`, `refunds`, `clr_status`, `arrival_date`, `document_status`, `to_clr_agent`, `duty`, `clr_date`, `transporter_name`, `lc_no`)
         VALUES('{$data['vh_id']}', '{$data['shipped_date']}', '{$data['driver_name']}', '{$data['vessel']}', '{$data['refund']}', "
                . "'{$data['clearing_status']}', '{$data['arrival_date']}', '{$data['document_status']}', "
                . "'{$data['to_clearing_agent']}', '{$data['duty']}', '{$data['clearing_date']}', '{$data['carrier_by']}', '{$data['lc_no']}')"
                . "ON DUPLICATE KEY UPDATE `shipped_date` = '{$data['shipped_date']}', `driver_name` = '{$data['driver_name']}', `vessel` = '{$data['vessel']}', "
                . " `refunds` = '{$data['refund']}', `clr_status` = '{$data['clearing_status']}', `arrival_date` = '{$data['arrival_date']}', `document_status` = '{$data['document_status']}'"
                . ", `to_clr_agent` = '{$data['to_clearing_agent']}', `duty` = '{$data['duty']}', `clr_date` = '{$data['clearing_date']}', `transporter_name` = '{$data['carrier_by']}', `lc_no` = '{$data['lc_no']}'";
//echo $ins; exit;
        $insert = mysql_query($ins);

        $update = mysql_query("UPDATE vehicle SET stock_status = '{$data['clearing_status']}' WHERE vehicle.vh_id = '{$data['vh_id']}'");
        if ($insert && $update) {
            mysql_query("COMMIT");
            echo json_encode(array(array("msgType" => 1, "msg" => "Clearing Successfully saved")));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array(array("msgType" => 2, "msg" => "Could not save")));
        }

        MainConfig::closeDB();
    }
}


// Table for add vehicles in the vehicle_clearing 

if (array_key_exists("table", $_POST)) {

    if ($_POST['table'] == 'maker_info') {
        //@Sachith : load sub category table by main category id
        $system->prepareSelectQueryForJSON("SELECT maker_id, maker_name, `desc`, maker_status 
        FROM maker WHERE maker.maker_status = 1");
    } else if ($_POST['table'] == 'sendClear_selectedVh') {
        $query = "SELECT
        vehicle.vh_code,
        maker_model.mod_name,
        vehicle.package,
        vehicle.vh_year,
        vehicle.vh_color,
        vehicle.vh_id,
        maker_model.mod_id
        FROM
        vehicle
        INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
        WHERE
        vehicle.vh_id IN({$_POST['idlist']}) AND vehicle.stock_status NOT IN(3,4)";

        $system->prepareSelectQueryForJSON($query);
    } else if ($_POST['table'] == 'view_vehicle_tbl_paging') {
        $rec_per_page = 15;
        if (filter_var($_REQUEST["records"], FILTER_VALIDATE_INT)) {
            $rec_per_page = $_REQUEST["records"];
        }
        MainConfig::connectDB();
//        $result_1;
        $query_p1 = "SELECT count(vehicle.vh_id)  AS num_rec
    FROM
    vehicle
    INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
    INNER JOIN maker ON maker_model.maker_id = maker.maker_id
    LEFT JOIN coordinator ON vehicle.coordinator_id = coordinator.coordinator_id
    INNER JOIN supplier ON vehicle.supp_id = supplier.supp_id
    WHERE
    vehicle.record_status = '1'";

        if ($_POST['stock_status'] != 0) {
            $query_p1 = $query_p1 . " AND vehicle.stock_status = '{$_POST['stock_status']}'";
        }
        if ($_POST['supp_id'] > 0) {
            $query_p2 = " AND supplier.supp_id = '{$_POST['supp_id']}'";
            $result_1 = mysql_query($query_p1 . $query_p2);
        } else {
            $result_1 = mysql_query($query_p1);
        }
        $total_pages = 0;
        if (!empty($result_1)) {
            $data_arr = mysql_fetch_array($result_1);
            $total_pages = ceil($data_arr[0] / $rec_per_page);
        }
        echo json_encode(array("tot_pg" => $total_pages));
        //
    }
}