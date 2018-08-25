<?php

session_start();
require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$dbClass = new database();
$system = new setting();

if (array_key_exists("table", $_POST)) {
    if ($_POST['table'] == 'load_leasing_tbl') {
        //@AShan : load sub category table by main category id
        $query_p1 = "SELECT
vehicle_leasing.vhl_id,
vehicle_leasing.vhl_date,
vehicle_leasing.vhl_amount,
vehicle_leasing.vhl_valuation_by,
vehicle_leasing.vhl_docs_submitted,
vehicle_leasing.vhl_submit_date,
vehicle_leasing.vhl_payment_status,
vehicle_leasing.vhl_status,
vehicle.vh_chassis_num,
vehicle.vh_id,
vehicle.vh_maker_model,
customer.cus_name,
customer.cus_address,
customer.cus_phone1,
leasing.ls_name,
leasing.ls_address,
leasing.ls_contact,
leasing.ls_email,
vehicle_leasing.sold_price,
vehicle.model_no,
coordinator.coordinator_name,
vehicle_leasing.advance,
vehicle_leasing.vhl_confirm,
(vehicle_leasing.vhl_confirmed_amount - vehicle_leasing.advance) as balance,
vehicle_leasing.vhl_confirmed_amount,
maker_model.mod_name,
maker.maker_name
FROM
vehicle_leasing
INNER JOIN vehicle ON vehicle_leasing.vh_id = vehicle.vh_id
INNER JOIN customer ON vehicle_leasing.cus_id = customer.cus_id
INNER JOIN leasing ON vehicle_leasing.ls_company_id = leasing.ls_id AND vehicle_leasing.ls_company_id = leasing.ls_id
INNER JOIN coordinator ON coordinator.coordinator_id = vehicle_leasing.coordinator_id
INNER JOIN maker_model ON maker_model.maker_id = vehicle.vh_maker_model
INNER JOIN maker ON maker_model.maker_id = maker.maker_id
WHERE
vehicle_leasing.vhl_status = '1'";

        if ($_POST['status'] == '1' && $_POST['con_st'] == '0') {
            $query_p2 = $query_p1 . "AND  vehicle_leasing.vhl_confirm ='{$_POST['status']}'";
            $system->prepareSelectQueryForJSON($query_p2);
        } elseif ($_POST['status'] == '1' && $_POST['con_st'] == '1') {
            $query_p3 = $query_p1 . "AND  vehicle_leasing.vhl_confirm ='{$_POST['status']}' AND  vehicle_leasing.vhl_payment_status ='{$_POST['con_st']}'";
            $system->prepareSelectQueryForJSON($query_p3);
        } elseif ($_POST['status'] == '1' && $_POST['con_st'] == '2') {
            $query_p4 = $query_p1 . "AND  vehicle_leasing.vhl_confirm ='{$_POST['status']}' AND  vehicle_leasing.vhl_payment_status ='{$_POST['con_st']}'";
            $system->prepareSelectQueryForJSON($query_p4);
        } elseif ($_POST['status'] == '1' && $_POST['con_st'] == '3') {
            $query_p5 = $query_p1 . "AND  vehicle_leasing.vhl_confirm ='{$_POST['status']}' AND  vehicle_leasing.vhl_payment_status ='{$_POST['con_st']}'";
            $system->prepareSelectQueryForJSON($query_p5);
        } elseif ($_POST['status'] == '2') {
            $system->prepareSelectQueryForJSON($query_p1);
        }elseif ($_POST['status'] == '0') {
            $query_p6 = $query_p1 . "AND  vehicle_leasing.vhl_confirm ='{$_POST['status']}'";
            $system->prepareSelectQueryForJSON($query_p6);
        } else {
            $system->prepareSelectQueryForJSON($query_p1);
        }
    }
}