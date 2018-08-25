<?php

require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$dbClass = new database();
$system = new setting();

if (array_key_exists("table", $_POST)) {
    if ($_POST['table'] == 'load_vehicle_tbl') {

        $rec_per_page = 15; // enter the same value in 'view_vehicle_tbl_paging'
        if (filter_var($_REQUEST["records"], FILTER_VALIDATE_INT)) {
            $rec_per_page = $_REQUEST["records"];
        }
        if (isset($_REQUEST["page"])) {
            $page = $_REQUEST["page"];
        } else {
            $page = 1;
        }
        $start_from = ($page - 1) * $rec_per_page;
        $query_p1 = "SELECT
    vehicle.vh_id,
    vehicle.vh_index_num,
    vehicle.vh_code,
    vehicle.vh_chassis_code,
    vehicle.vh_chassis_num,
    vehicle.engine_code,
    vehicle.engine_num,
    vehicle.engine_cc,
    vehicle.package,
    vehicle.vh_year,
    vehicle.vh_color,
    vehicle.vh_milage,
    vehicle.vh_options,
    vehicle.fuel_type,
    vehicle.transmission,
    vehicle.seats,
    vehicle.doors,
    vehicle.eval_grade,
    vehicle.drive_wheels,
    vehicle.additional_options,
    vehicle.bid_date,
    vehicle.auction_name,
    vehicle.lot_no,
    vehicle.auction_grade,
    vehicle.auc_display_price,
    vehicle.stock_location,
    vehicle.stock_status,
    maker_model.mod_name,
    maker.maker_name,
    coordinator.short_name,
    supplier.supp_name,
    vehicle.color_group
    FROM
    vehicle
    INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
    INNER JOIN maker ON maker_model.maker_id = maker.maker_id
    LEFT JOIN coordinator ON vehicle.coordinator_id = coordinator.coordinator_id
    INNER JOIN supplier ON vehicle.supp_id = supplier.supp_id
    WHERE
    vehicle.record_status = '1' ";

        if ($_POST['stock_status'] != 0) {
            $query_p1 = $query_p1 . " AND vehicle.stock_status = '{$_POST['stock_status']}'";
        }

        $query_p3 = " ORDER BY vehicle.vh_group ASC,vehicle.vh_index_num DESC LIMIT $start_from, $rec_per_page";
        if ($_POST['supp_id'] > 0) {
            $query_p2 = " AND supplier.supp_id = '{$_POST['supp_id']}'";
//            create_vehicle_viewlist($query_p1 . $query_p2 . $query_p3, $query_p1 . $query_p2);
            $system->prepareSelectQueryForJSON($query_p1 . $query_p2 . $query_p3);
        } else {
            $system->prepareSelectQueryForJSON($query_p1 . $query_p3);
        }


        //
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