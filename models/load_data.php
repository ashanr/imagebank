<?php

session_start();
require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$system = new setting();
$database = new database();
MainConfig::connectDB();
if (array_key_exists("action", $_POST)) {
    if ($_POST['action'] == 'load_drch_balance') {
        $today = date('Y-m-d');
        $data = $_POST['driver_name_array'];

        $system->prepareSelectQueryForJSONSingleData("SELECT
                                        ((sum(driver_charges.drch_salary)+sum(driver_charges.drch_petrol)+ sum(driver_charges.drch_expenses)) - (sum(driver_charges.drch_advance)+sum(driver_charges.drch_payment))) as driver_balance
                                        FROM
                                        driver_charges
                                        WHERE 
                                        record_status =1 
                                        AND
                                        pay_status = 0
                                        AND driver_id= '{$data['driver_id']}'");
    } else if ($_POST['action'] == 'load_clear_balance') {
        $today = date('Y-m-d');
        $agent_id = $_POST['agent_id'];
        $system->prepareSelectQueryForJSON("SELECT  sum(clearing_balance.charge) - sum(clearing_balance.paid)   AS final_balance FROM  clearing_balance  WHERE clearing_balance.agent_id='{$agent_id}'");
    } else if ($_POST['action'] == 'load_cb_info') {

        $today = date('Y-m-d');
        $cb_id = $_POST['cb_id'];

        $system->prepareSelectQueryForJSON("SELECT
                                                clearing_balance.clearing_balance_id,
                                                clearing_balance.date,
                                                clearing_balance.cus_id,
                                                clearing_balance.list,
                                                clearing_balance.model,
                                                clearing_balance.coordinator,
                                                clearing_balance.chassis_number,
                                                clearing_balance.color,
                                                clearing_balance.payment_type,
                                                clearing_balance.charge,
                                                clearing_balance.paid,
                                                clearing_balance.balance,
                                                clearing_balance.confirm,
                                                clearing_balance.desc,
                                                clearing_balance.agent_id,
                                                vehicle.vh_id,
                                                vehicle.vh_maker_model,
                                                vehicle.vh_chassis_num,
                                                vehicle.vh_color,
                                                maker_model.mod_name,
                                                coordinator.coordinator_name
                                                FROM
                                                clearing_balance
                                                INNER JOIN vehicle ON clearing_balance.vh_id = vehicle.vh_id
                                                INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
                                                INNER JOIN coordinator ON vehicle.coordinator_id = coordinator.coordinator_id
                                                WHERE clearing_balance.clearing_balance_id ='{$cb_id}' ");
    } else if ($_POST['action'] == 'load_drch_payments') {

        $today = date('Y-m-d');
        $data = $_POST['driver_name_array'];
        echo $data['driver_name'];
        exit;
        $system->prepareSelectQueryForJSON("SELECT
                                                driver_charges.drch_payment,
                                                driver_charges.driver_name,
                                                driver_charges.drch_date,
                                                driver_charges.record_status,
                                                driver_charges.pay_status
                                                WHERE
                                                driver_name = '{$data['driver_name']}' AND drch_type = 2");
    }
}