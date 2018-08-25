<?php

require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$dbClass = new database();
$system = new setting();

if (array_key_exists("table", $_POST)) {
    if ($_POST['table'] == 'view_vehicle_tbl_paging') {
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
    }else if ($_POST['table'] == 'view_drch_tbl_paging') {
        $rec_per_page = 15;
        if (filter_var($_REQUEST["records"], FILTER_VALIDATE_INT)) {
            $rec_per_page = $_REQUEST["records"];
        }
        MainConfig::connectDB();
//        $result_1;
        $query_p1 = "SELECT
                        COUNT(driver_charges.drch_id)
                        FROM
                        driver_charges
                        ";

        if ($_POST['driver_id'] != 0) {
            $query_p1 = $query_p1 . " WHERE driver_id = '{$_POST['driver_id']}'";
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