<?php

session_start();
require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$system = new setting();
$database = new database();
MainConfig::connectDB();

///////////////////////////////////////////////////////////////////////////////////////     
/////////////////////         COMMON ACTIONS                         ///////////// 
//////////////////////////////////////////////////////////////////////////////////////



if (array_key_exists("action", $_POST)) {
if ($_POST['action'] == 'select_customer_for_quotation') {

$cus_id = $_POST['cus_id'];
$system->prepareSelectQueryForJSON("SELECT customer.cus_id,
        customer.cus_name,
        customer.cus_inv_name,
        customer.cus_address,
        customer.cus_inv_address,
        customer.cus_phone1,
        customer.cus_phone2,
        customer.cus_email1,
        customer.cus_email2,
        customer.other_contact,
        customer.comments,
        leasing.ls_name,
        leasing.ls_id,
        leasing.ls_address
        FROM `customer`
        LEFT JOIN leasing ON customer.leasing_id = leasing.ls_id
        WHERE
        customer.cus_status != 99 AND
        customer.cus_id = '{$cus_id}' ORDER BY cus_id DESC LIMIT 1");
} else if ($_POST['action'] == 'save_quotation') {
// Customer Quotation
$data = $_POST['form_data'];
if (strlen($data['vh_id']) > 0) {
foreach ($data as $key => $value) {
$data[$key] = mysql_real_escape_string($data[$key]);
}
if (empty($data['customer_id'])) {
echo json_encode(array(array("msgType" => 2, "msg" => "Select Customer for Quotation")));
return;
}

$ins = "INSERT INTO `quotation` (
		`vh_id`,`invoce_no`,`customer_id`,`customer_name`,
	`address`,`phone_no`,`vehicle_price`,`first_advance`,`lc_charge`,`second_advance`,`balance`) VALUES('{$data['vh_id']}', '{$data['invoice_no']}','{$data['customer_id']}','{$data['customer_name']}','{$data['address']}','{$data['phone_no']}','{$data['vehicle_price']}','{$data['first_advance']}','{$data['lc_charge']}','{$data['second_advance']}','{$data['balance']}')";

$insert = mysql_query($ins);
$error = mysql_error();
if ($insert) {
echo json_encode(array(array("msgType" => 1, "msg" => "Customer Bank Added")));
} else {
echo json_encode(array(array("msgType" => 2, "msg" => $error)));
}
MainConfig::closeDB();
}
} else if ($_POST['action'] == 'get_quotation_info') {

$q_id = $_POST['q_id'];

$system->prepareSelectQueryForJSON(" SELECT
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
                    INNER JOIN vehicle ON quotation.vh_id = vehicle.vh_id 
                    WHERE quotation.q_id = '{$q_id}' ORDER BY q_id DESC LIMIT 1");
}
}

///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////                 END!                         ///////////// 
//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////          COMBO BOX LOADING                   ///////////// 
//////////////////////////////////////////////////////////////////////////////////////


if (array_key_exists("comboBox", $_POST)) {
if ($_POST['comboBox'] == 'load_vehicle_code_combo') {

$system->prepareSelectQueryForJSON("SELECT
	maker.maker_name,
	maker.maker_id,
	maker_model.mod_name,
	vehicle.vh_id,
	vehicle.vh_code,
	vehicle.vh_index_num,
	vehicle.supp_id,
	vehicle.vh_maker_model,
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
	vehicle.currency_type,
	vehicle.color_group,
	vehicle.vh_group,
	vehicle.additional_options,
	vehicle.bid_date,
	vehicle.auction_name,
	vehicle.lot_no,
	vehicle.auction_grade,
	vehicle.auc_display_price,
	vehicle.vh_disp_price,
	vehicle.auc_real_price,
	vehicle.stock_location,
	vehicle.stock_status,
	vehicle.coordinator_id,
	vehicle.pdf_file,
	vehicle.record_status,
	vehicle.vh_is_reg
                FROM
                        vehicle
                INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
                INNER JOIN maker ON maker_model.maker_id = maker.maker_id
                  ORDER BY vh_id DESC");
}

if ($_POST['comboBox'] == 'load_vehicle_data') {


$system->prepareSelectQueryForJSON(" SELECT
maker.maker_name,
 maker.maker_id,
 maker_model.mod_name,
 vehicle.vh_id,
 vehicle.vh_code,
 vehicle.vh_index_num,
 vehicle.supp_id,
 vehicle.vh_maker_model,
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
 vehicle.currency_type,
 vehicle.color_group,
 vehicle.vh_group,
 vehicle.additional_options,
 vehicle.bid_date,
 vehicle.auction_name,
 vehicle.lot_no,
 vehicle.auction_grade,
 vehicle.auc_display_price,
 vehicle.vh_disp_price,
 vehicle.auc_real_price,
 vehicle.stock_location,
 vehicle.stock_status,
 vehicle.coordinator_id,
 vehicle.pdf_file,
 vehicle.record_status,
 vehicle.vh_is_reg
FROM
vehicle
INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
INNER JOIN maker ON maker_model.maker_id = maker.maker_id
WHERE
vehicle.vh_id = '{$_POST['vh_id']}'");
                                    
                                  
    }
}


///////////////////////////////////////////////////////////////////////////////////////     
////////////////////////                 END!                         ///////////// 
//////////////////////////////////////////////////////////////////////////////////////


