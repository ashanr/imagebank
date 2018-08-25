<?php

require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$dbClass = new database();
$system = new setting();

if (array_key_exists("table", $_POST)) {
    if ($_POST['table'] == 'load_view_clearing_tbl') {

        $query_p1 = "SELECT
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
          supplier.supp_id,
          supplier.supp_name,
          vh_clearing.duty,
          vh_clearing.clr_date,
          vh_clearing.lc_no,
          vh_clearing.transporter_name,
          vh_clearing.to_clr_agent,
          vh_clearing.clr_id,
          vh_clearing.clr_status
          FROM
          vehicle
          INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
          INNER JOIN maker ON maker_model.maker_id = maker.maker_id
          LEFT JOIN coordinator ON vehicle.coordinator_id = coordinator.coordinator_id
          INNER JOIN supplier ON vehicle.supp_id = supplier.supp_id
          LEFT JOIN vh_clearing ON vh_clearing.vh_id = vehicle.vh_id
          WHERE
              vehicle.record_status = '1' ";

        if (($_POST['stock_status'] != 0) ) {
            $query_p1 .= " AND  vehicle.stock_status = '{$_POST['stock_status']}'";
        }
        if (isset($_POST['serch_text']) && (!empty($_POST['serch_text']))) {
            $query_p1 .=" AND vehicle.vh_code LIKE '{$_POST['serch_text']}%'";
        }
        if (($_POST['supp_id'] != 0)) {
            $query_p1 .= " AND supplier.supp_id = '{$_POST['supp_id']}' ORDER by vh_index_num DESC ";
        }
//        echo $query_p1;
//        return;
        $system->prepareSelectQueryForJSON($query_p1);
    }
}