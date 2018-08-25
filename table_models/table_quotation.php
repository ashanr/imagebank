<?php

require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$dbClass = new database();
$system = new setting();

if (array_key_exists("table", $_POST)) {
    if ($_POST['table'] == 'load_quotation_tbl') {
        $query_p1 = "SELECT
            quotation.q_id,
            quotation.vh_id,
            quotation.invoce_no,
            quotation.customer_id,
            quotation.customer_name,
            quotation.address,
            quotation.phone_no,
            quotation.vehicle_price,
            quotation.first_advance,
            quotation.lc_charge,
            quotation.second_advance,
            quotation.balance,
            vehicle.vh_id,
            vehicle.vh_code,
            vehicle.vh_chassis_num,
            vehicle.vh_chassis_code,
            vehicle.vh_maker_model,
            vehicle.engine_num,
            vehicle.engine_cc,
            vehicle.package,
            vehicle.vh_year,
            vehicle.vh_color,
            vehicle.vh_options,
            vehicle.fuel_type,
            vehicle.seats,
            vehicle.doors,
            vehicle.coordinator_id
            FROM
            quotation
            INNER JOIN vehicle ON quotation.vh_id = vehicle.vh_id ";

        if (isset($_POST['customer_id']) > 0 && (isset($_POST['serch_text']) && (!empty($_POST['serch_text'])))) {
            $query_p1 .= " WHERE quotation.invoce_no LIKE '%{$_POST['serch_text']}%' AND quotation.customer_id = '{$_POST['customer_id']}'";
            $system->prepareSelectQueryForJSON($query_p1);
            return;
        }
        if ($_POST['customer_id'] > 0) {
            $query_p1 .= " WHERE quotation.customer_id = '{$_POST['customer_id']}'";
        }
        if (isset($_POST['serch_text']) && (!empty($_POST['serch_text']))) {
            $query_p1 .=" WHERE quotation.invoce_no LIKE '%{$_POST['serch_text']}%'";
        }
        
        $query_p1 .= "ORDER BY q_id DESC ";
        //echo $query_p1; exit();
        $system->prepareSelectQueryForJSON($query_p1);
    } else if ($_POST['table'] == 'customer_search_result') {
        $system->prepareSelectQueryForJSON("SELECT customer.cus_id,
            customer.cus_inv_name,
            customer.cus_address,
            customer.cus_inv_address,
            customer.cus_phone1,
            customer.cus_phone2,
            customer.cus_email2,
            customer.other_contact,
            customer.cus_name,
            customer.cus_email1
            FROM customer
            WHERE cus_status ='1'");
    }
}