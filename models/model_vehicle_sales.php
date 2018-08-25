<?php

session_start();
require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$dbClass = new database();
$system = new setting();
MainConfig::connectDB();
if (array_key_exists("action", $_POST)) {
    if ($_POST['action'] == 'update_vehicle_sales') {
        $today = date('Y-m-d');
        $data = $_POST['form_data'];
        foreach ($data as $key => $value) {
            $data[$key] = mysql_real_escape_string($data[$key]);
        }
        $update_query = "UPDATE `vh_sales`
                          SET  
                         `vh_code` = '{$data['vh_code']}',
                         `marks_sales_invoice` = '{$data['marks_invoice']}',
                         `marked_price` = '{$data['marked_price']}',
                         `selling_price` = '{$data['selling_price']}',
                         `sold_price` = '{$data['sold_price']}',
                         `sell_status` = '{$data['selling_status']}',
                         `current_milage` = '{$data['current_mileage']}',
                         `vh_sales_status` = '{$data['sales_status']}',
                         `customer_id` = '{$data['customer_id']}',
                         `lease` = '{$data['vhl_amount']}',
                         `registration` = '{$data['registration']}',
                         `modification` = '{$data['modification']}',
                         `advance` = '{$data['advance']}',
                         `sold_date` = '{$data['sold_date']}',
                         `cash` ='{$data['cash']}',
                         `other` = '{$data['other']}',
                         `record_status` = '1'
                         WHERE (vh_sales.`sales_id` = '{$data['sales_id']}')";
        mysql_query("START TRANSACTION");
        $update_registration = mysql_query("UPDATE `registration_balance` SET ref_no = '{$data['vh_code']}+KR', date = CURDATE(), paid = '555' where `registration_balance`.`vh_id`='{$data['vh_id']}'");
        $t = "INSERT INTO `transaction` (`tr_type`, `tr_desc`, `tr_time`,`tr_date`, `tr_user_id`) VALUES ('UPDATE', 'vehicle_sales', CURTIME(), '{$today}', '{$_SESSION['user_id']}')";
        
        $update = mysql_query($update_query) or die(mysql_error());
        $sold_status = mysql_query($update_sales_status);
        //&& $sold_status
        mysql_query($t)or die(mysql_error());

        $update = mysql_query($update_query);
        $update_sales_status = mysql_query("UPDATE `vehicle` SET stock_status ='{$data['sales_status']}' where `vehicle`.`vh_id`= '{$data['vh_id']}' ");

        $error = mysql_error();
        //&& $sold_status
        if ($update && $update_sales_status) {

            mysql_query("COMMIT");
            echo json_encode(array("msgType" => 1, "msg" => "Vehicle Sales Updated."));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array("msgType" => 2, "msg" => "Couldn't Update Record ."));
        }
        MainConfig::closeDB();
    } else if ($_POST['action'] == 'save_sales_entry') {

        $today = date('Y-m-d');
        $data = $_POST['form_data'];
//        if (empty($data['co_category'])) {
//            echo json_encode(array(array("msgType" => 2, "msg" => "Select a category")));
//            return;
//        }
        foreach ($data as $key => $value) {
            $data[$key] = mysql_real_escape_string($data[$key]);
        }
        mysql_query("START TRANSACTION");
        $ins = mysql_query("INSERT INTO `vh_sales` (`vh_id`,`vh_code`,`marks_sales_invoice`,`clearing_id`,`coordinator_id`,	`marked_price`,	`selling_price`,`sold_price`,`sell_status`,`current_milage`,`vh_sales_status`,`customer_id`,`lease`,`registration`,`modification`,`advance`,`sold_date`,`cash`,`other`,`record_status`) "
                . "VALUES ('{$data['vh_id']}', '{$data['vh_code']}', '{$data['marks_invoice']}','{$data['clearing_id']}', '{$data['coordinator_id']}','{$data['marked_price']}', '{$data['selling_price']}', '{$data['sold_price']}', '{$data['selling_status']}', '{$data['current_mileage']}','{$data['sales_status']}', '{$data['cus_id']}', '{$data['lease']}', '{$data['registration']}','{$data['modification']}', '{$data['advance']}', '{$data['sold_date']}', '{$data['cash']}', '{$data['other']}',  '1')");

        $error = mysql_error();
        //$reg = mysql_query("INSERT INTO `registration_balance` (`vh_id`,`ref_no`,`reg_no`, `total`) VALUES('{$data['vh_id']}','{$data['vh_code']}','reg no','5000');");
        // $trn = mysql_query("INSERT INTO `transaction` (`tr_type`, `tr_desc`, `tr_date`, `tr_user_id`) VALUES ('INSERT', 'sales save', '{$today}', '{$_SESSION['user_id']}')")or die(mysql_error());
        //  $trn = true;
        if ($ins) {
            mysql_query("COMMIT");
            echo json_encode(array(array("msgType" => 1, "msg" => "Vehicle Sale saved")));
        } else {
            mysql_query("ROLLBACK");
            echo json_encode(array(array("msgType" => 2, "msg" => $error)));
        }
        MainConfig::closeDB();
    } else if ($_POST['action'] == 'get_vh_sales_info') {
        $vh_id = $_POST['vh_id'];
        $system->prepareSelectQueryForJSON("SELECT
                                        coordinator.coordinator_name,
                                        maker.maker_name,
                                        maker.maker_id,
                                        vh_clearing.clr_id,
                                        vehicle.vh_id,
                                        vehicle.vh_code,
                                        vehicle.engine_cc,
                                        vehicle.stock_status,
                                        vehicle.vh_disp_price,
                                        vehicle.auc_real_price,
                                        vehicle.vh_milage,
                                        vehicle.record_status,
                                        vehicle.vh_group,
                                        vehicle.vh_options,
                                        vehicle.vh_chassis_code,
                                        vehicle.vh_maker_model,
                                        vehicle.vh_chassis_num,
                                        vehicle.vh_index_num,
                                        vehicle.supp_id,
                                        vehicle.engine_code,
                                        vehicle.engine_num,
                                        vehicle.package,
                                        vehicle.vh_year,
                                        vehicle.vh_color,
                                        vehicle.fuel_type,
                                        vehicle.transmission,
                                        vehicle.seats,
                                        vehicle.doors,
                                        vehicle.eval_grade,
                                        vehicle.drive_wheels,
                                        vehicle.currency_type,
                                        vehicle.color_group,
                                        vehicle.additional_options,
                                        vehicle.bid_date,
                                        vehicle.auction_name,
                                        vehicle.lot_no,
                                        vehicle.auction_grade,
                                        vehicle.auc_display_price,
                                        vehicle.stock_location,
                                        vehicle.coordinator_id,
                                        vehicle.pdf_file,
                                        vehicle.vh_is_reg,
                                        vh_clearing.shipped_date
                                        FROM
                                             vehicle
                                        LEFT JOIN coordinator ON vehicle.coordinator_id = coordinator.coordinator_id 
                                        INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
                                        INNER JOIN maker ON maker_model.maker_id = maker.maker_id
                                        INNER JOIN vh_clearing ON vh_clearing.vh_id = vehicle.vh_id
                                             where vehicle.vh_id ='{$vh_id}'");
    } else if ($_POST['action'] == 'get_vehicle_sales_info') {
        $sales_id = $_POST['sales_id'];
        
     //  echo $sales_id; exit;
        $system->prepareSelectQueryForJSON("SELECT
                                            vehicle.vh_id,
                                            vehicle.vh_code,
                                            vehicle.engine_cc,
                                            vehicle.stock_status,
                                            vehicle.vh_disp_price,
                                            vehicle.auc_real_price,
                                            vehicle.vh_milage,
                                            vh_sales.marks_sales_invoice,
                                            vh_sales.customer_id,
                                            vh_sales.sold_date,
                                            vehicle.record_status,
                                            vh_sales.sales_id,
                                            vh_sales.selling_price,
                                            vh_sales.sold_price,
                                            vh_sales.vh_code,
                                            vh_sales.coordinator_id,
                                            vh_sales.marked_price,
                                            vh_sales.sell_status,
                                            vh_sales.current_milage,
                                            vh_sales.vh_sales_status,
                                            vh_sales.record_status,
                                            coordinator.coordinator_name,
                                            vh_clearing.shipped_date,
                                            vh_sales.lease,
                                            vh_sales.registration,
                                            vh_sales.modification,
                                            vh_sales.advance,
                                            vh_sales.cash,
                                            vh_sales.other
                                            FROM
                                            vehicle
                                            INNER JOIN vh_sales ON vh_sales.vh_id = vehicle.vh_id
                                            INNER JOIN coordinator ON vh_sales.coordinator_id = coordinator.coordinator_id
                                            INNER JOIN vh_clearing ON vh_clearing.vh_id = vehicle.vh_id
                                            WHERE
                                            vh_sales.sales_id='{$sales_id}'");
    } else if ($_POST['action'] == 'save_inv_payments') {
//        echo $_POST['form_data']['customer_id'];
//        return;
        MainConfig::connectDB();
        mysql_query("START TRANSACTION");
        $payed_amt = $_POST['form_data']['payed_amt'];
        $sales_id = $_POST['form_data']['sales_id'];
        $update = mysql_query("UPDATE `vh_sales` SET `sell_status`='5', `cash`=(`cash`+'{$payed_amt}') WHERE (`sales_id`='{$sales_id}');");
        $VHID = mysql_real_escape_string($_POST['form_data']['vh_id']);
        $CUSID = mysql_real_escape_string($_POST['form_data']['customer_id']);
        $PAYED_AMT = mysql_real_escape_string($_POST['form_data']['payed_amt']);
        $QUERY = "INSERT INTO `payments` (`vh_id`, `cus_id`, `payment_date`, `time`, `amount`) "
                . "VALUES ('{$VHID}', '{$CUSID}', CURDATE(), CURTIME(), '{$PAYED_AMT}')";

        $query = mysql_query($QUERY);
        if ($update && $query) {
            mysql_query("COMMIT");
            MainConfig::closeDB();
            echo json_encode(array(array("msgType" => 1, "msg" => "Payment saved ")));
        } else {
            mysql_query("ROLLBACK");
            MainConfig::closeDB();
            echo json_encode(array(array("msgType" => 2, "msg" => "Payment Error !")));
        }
    } else if ($_POST['action'] == 'delete_payment') {

        if ($_POST['user_level'] == '194') {
            echo json_encode(array(array("msgType" => 2, "msg" => "Sorry! You don't have permissions to remove this payment! Please contact a Admin User to remove this payment. ")));
            return;
        } else {
            MainConfig::connectDB();
            $get_amt = mysql_query("SELECT
                                    payments.amount
                                    FROM `payments`
                                    WHERE
                                    payments.payment_id = '{$_POST['paymnt_id']}'");
            if (mysql_num_rows($get_amt) == 0) {
                echo json_encode(array(array("msgType" => 2, "msg" => " Nothing to Delete! -- {$_POST['paymnt_id']} == {$_POST['user_level']}")));
                return;
            }
            $row = mysql_fetch_assoc($get_amt);
            $payed_amt = $row['amount'];
            mysql_query("START TRANSACTION");
            $update_bal = mysql_query("UPDATE `carsale`.`vh_sales` SET  `cash`=(`cash`-'{$payed_amt}') WHERE (`sales_id`='{$_POST['sales_id']}')");
            $delete = mysql_query("DELETE FROM `payments` WHERE (`payment_id`='{$_POST['paymnt_id']}')");
            if ($update_bal && $delete) {
                mysql_query("COMMIT");
                MainConfig::closeDB();
                echo json_encode(array(array("msgType" => 1, "msg" => "Payment cancelled.. ")));
            } else {
                mysql_query("ROLLBACK");
                MainConfig::closeDB();
                echo json_encode(array(array("msgType" => 2, "msg" => "Error in Cancelling  !")));
            }
        }
    }
}
