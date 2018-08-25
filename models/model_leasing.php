<?php
session_start();
require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$system = new setting();
$database = new database();
MainConfig::connectDB();

if (array_key_exists("action", $_POST)) {
    if ($_POST['action'] == 'load_leasing_vehicle_info') {
        $vh_id = $_POST['vh_id'];

        $system->prepareSelectQueryForJSON("SELECT
                                                vehicle.vh_index_num,
                                                vehicle.vh_code,
                                                vehicle.supp_id,
                                                vehicle.vh_chassis_num,
                                                vehicle.coordinator_id,
                                                vehicle.record_status,
                                                vehicle.vh_disp_price,
                                                vehicle.auc_real_price,
                                                vehicle.auc_display_price,
                                                vehicle.engine_cc,
                                                maker_model.mod_name,
                                                coordinator.coordinator_name,
                                                vehicle_leasing.vhl_date,
                                                customer.cus_name,
                                                customer.cus_address,
                                                customer.cus_phone1,
                                                leasing.ls_id,
                                                leasing.ls_name,
                                                leasing.ls_address,
                                                leasing.ls_contact,
                                                vehicle_leasing.cus_id,
                                                vehicle_leasing.vhl_amount,
                                                vehicle_leasing.vhl_valuation_by,
                                                vehicle_leasing.vhl_docs_submitted,
                                                vehicle_leasing.vhl_submit_date,
                                                vehicle_leasing.vhl_payment_status,
                                                vehicle_leasing.vhl_deposit_acc,
                                                vehicle_leasing.vhl_additional_info,
                                                vehicle_leasing.vhl_confirmed_amount,
                                                vehicle_leasing.vhl_confirm,
                                                vehicle_leasing.vhl_status,
                                                vehicle_leasing.payment_type,
                                                vehicle_leasing.vhl_status,
                                                vehicle_leasing.sold_price,
                                                 vehicle_leasing.advance
                                                FROM
                                                vehicle
                                                INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
                                                INNER JOIN coordinator ON vehicle.coordinator_id = coordinator.coordinator_id
                                                INNER JOIN vehicle_leasing ON vehicle_leasing.vh_id = vehicle.vh_id
                                                INNER JOIN customer ON vehicle_leasing.cus_id = customer.cus_id
                                                INNER JOIN leasing ON vehicle_leasing.ls_company_id = leasing.ls_id
                                                WHERE vhl_id='{$vh_id}' ") ;
    }else if ($_POST['action'] == 'load_ins_vehicle_info') {
        $query = "SELECT
                                            vehicle.vh_index_num,
                                            vehicle.vh_code,
                                            vehicle.supp_id,
                                            vehicle.vh_chassis_num,
                                            vehicle.coordinator_id,
                                            vehicle.record_status,
                                            vehicle.vh_disp_price,
                                            vehicle.auc_real_price,
                                            vehicle.auc_display_price,
                                            vehicle.engine_cc,
                                            maker_model.mod_name,
                                            vh_sales.sold_price,
                                            coordinator.coordinator_name
                                            FROM
                                            vehicle
                                            INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
                                            INNER JOIN coordinator ON vehicle.coordinator_id = coordinator.coordinator_id
                                            INNER JOIN vh_sales ON vehicle.vh_id = vh_sales.vh_id
                                            WHERE vehicle.vh_id= {$_POST['vh_id']}";
        $system->prepareSelectQueryForJSON($query);
    }

}