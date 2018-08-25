<?php

require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$dbClass = new database();
$system = new setting();

if (array_key_exists("table", $_POST)) {
    if ($_POST['table'] == 'subject_table') {
        //@Ashan : load subjects
        $system->prepareSelectQueryForJSON("SELECT
                                                img_subject.subject_id,
                                                img_subject.subject_name,
                                                img_subject.subject_code
                                                FROM
                                                img_subject
                                                WHERE
                                                img_subject.subject_status=1
                                                ");
    } else if ($_POST['table'] == 'load_view_vehicle_tbl') {
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
    }
//    ******************** keyword search with paging-- 
    else if ($_POST['table'] == 'view_vehicle_keyword_search::::fnc-disabled') {
        $keyword_arr = $_POST['key_arr'];
        $rec_per_page = 15;
        if (isset($_REQUEST["page"])) {
            $page = $_REQUEST["page"];
        } else {
            $page = 1;
        }
        $start_from = ($page - 1) * $rec_per_page;
// column names are case sensitive
        $search_cols = array('vh_code', 'vh_chassis_code', 'vh_chassis_num', 'engine_code', 'engine_num', 'vh_year', 'vh_color', 'vh_options', 'additional_options', 'auc_display_price', 'mod_name', 'maker_name', 'short_name');
        $init_query = "SELECT
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
    supplier.supp_name
    FROM
    vehicle
    INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
    INNER JOIN maker ON maker_model.maker_id = maker.maker_id
    INNER JOIN coordinator ON vehicle.coordinator_id = coordinator.coordinator_id
    INNER JOIN supplier ON vehicle.supp_id = supplier.supp_id
    WHERE
    vehicle.record_status = '1' ORDER BY vehicle.vh_index_num ASC";

        $data = array();
        MainConfig::connectDB();
        $result = mysql_query($init_query);
        $numrows = mysql_num_rows($result);

        if ($numrows !== FALSE && $numrows < 101) {
            if (mysql_data_seek($result, $start_from)) {
                $i = 0;
//                while ($row = mysql_fetch_assoc($result)) {
                while ($i < $rec_per_page) {

                    $row = mysql_fetch_assoc($result);
//                    print_r($row);
                    if (!$row === FALSE) {
//                search keywords are resetted in each db row
//                $keywords = array('yota', 'riu');
                        $keywords = $keyword_arr;
//
                        foreach ($row as $dbcol => $dbcell) {
// check if,there are any keywords left for search. (matched keywords are removed from array)
                            if (!empty($keywords)) {
//then, match column names to see if this column included for searching
                                if (in_array($dbcol, $search_cols)) {
//
                                    foreach ($keywords as $index => $needle) {
                                        if (stripos($dbcell, $needle) !== FALSE) {
// one of the keywords found in a cell value 
// remove the found keyword
                                            unset($keywords[$index]);
                                        }
                                    }

                                    if (empty($keywords)) {
//all keywords are matched
                                        $i++;
                                        $data[] = $row;
                                        continue;
                                    }
                                }
                            }
                        }
                    } else {
//no more data rows
                        $i = $rec_per_page;
                        continue;
                    }
                }
            }//invslid start row number          
        }// too many search results
        MainConfig::closeDB();
        echo json_encode($data);
//
    } else if ($_POST['table'] == 'view_image_keyword_search') {
        $keyword_arr = $_POST['key_arr'];
// column names are case sensitive
        $search_cols = array('vh_code', 'vh_chassis_code');
        $init_query = "SELECT
                                img_file.image_ai_id,
                                img_file.file_category,
                                img_file.file_id,
                                img_file.file_name,
                                img_file.file_description,
                                img_file.file_added_date,
                                img_file.file_last_update_date,
                                img_file.pdf_file,
                                img_file.image_file,
                                img_file.rack_no,
                                img_file.row_no,
                                img_file.box_no,
                                img_file.`status`
                                FROM
                                img_file";

        $data = array();
        MainConfig::connectDB();
        $result = mysql_query($init_query);
        $numrows = mysql_num_rows($result);

        if ($numrows !== FALSE && $numrows < 2000) {
            while ($row = mysql_fetch_assoc($result)) {

//                search keywords are resetted in each db row
//                $keywords = array('yota', 'riu');
                $keywords = $keyword_arr;
//
                foreach ($row as $dbcol => $dbcell) {
// check if,there are any keywords left for search. (matched keywords are removed from array)
                    if (!empty($keywords)) {
//then, match column names to see if this column included for searching
                        if (in_array($dbcol, $search_cols)) {
//
                            foreach ($keywords as $index => $needle) {
                                if (stripos($dbcell, $needle) !== FALSE) {
// one of the keywords found in a cell value 
// remove the found keyword
                                    unset($keywords[$index]);
                                }
                            }

                            if (empty($keywords)) {
//all keywords are matched
                                $data[] = $row;
                                continue;
                            }
                        }
                    }
                }
            }
        } else {
            echo 'too many search results';
        }// too many search results
        MainConfig::closeDB();
        echo json_encode($data);
//
    } else if ($_POST['table'] == 'view_vehicle_clearing_keyword_search') {
        $keyword_arr = $_POST['key_arr'];
// column names are case sensitive
        $search_cols = array('vh_code', 'vh_chassis_num', 'engine_cc', 'shipped_date', 'vessel', 'clr_date', 'transporter_name');
        $init_query = "SELECT
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
                        vh_clearing.clr_id
                        FROM
                        vehicle
                        INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
                        INNER JOIN maker ON maker_model.maker_id = maker.maker_id
                        LEFT JOIN coordinator ON vehicle.coordinator_id = coordinator.coordinator_id
                        INNER JOIN supplier ON vehicle.supp_id = supplier.supp_id
                        LEFT JOIN vh_clearing ON vh_clearing.vh_id = vehicle.vh_id
                        WHERE
                            vehicle.record_status = '1' AND (clr_status = '3' OR clr_status= '4') ";

        $data = array();
        MainConfig::connectDB();
        $result = mysql_query($init_query);
        $numrows = mysql_num_rows($result);

        if ($numrows !== FALSE && $numrows < 2000) {
            while ($row = mysql_fetch_assoc($result)) {

//                search keywords are resetted in each db row
//                $keywords = array('yota', 'riu');
                $keywords = $keyword_arr;
//
                foreach ($row as $dbcol => $dbcell) {
// check if,there are any keywords left for search. (matched keywords are removed from array)
                    if (!empty($keywords)) {
//then, match column names to see if this column included for searching
                        if (in_array($dbcol, $search_cols)) {
//
                            foreach ($keywords as $index => $needle) {
                                if (stripos($dbcell, $needle) !== FALSE) {
// one of the keywords found in a cell value 
// remove the found keyword
                                    unset($keywords[$index]);
                                }
                            }

                            if (empty($keywords)) {
//all keywords are matched
                                $data[] = $row;
                                continue;
                            }
                        }
                    }
                }
            }
        } else {
            echo 'too many search results';
        }// too many search results
        MainConfig::closeDB();
        echo json_encode($data);
//
    } else if ($_POST['table'] == 'ctpo_keyword_search') {
        $keyword_arr = $_POST['key_arr'];
// column names are case sensitive
        $search_cols = array('ct_id', 'ref_no', 'engine_cc', 'from_acc_no', 'to_acc_no', 'from_name', 'to_name');
        $init_query = "SELECT
                    credit_transfer.ct_id,
                    credit_transfer.ref_no,
                    credit_transfer.ct_type,
                    credit_transfer.from_bank,
                    credit_transfer.from_bank_branch,
                    credit_transfer.from_name,
                    credit_transfer.from_address,
                    credit_transfer.from_acc_no,
                    credit_transfer.to_bank,
                    credit_transfer.to_bank_branch,
                    credit_transfer.to_name,
                    credit_transfer.to_acc_no,
                    credit_transfer.ct_amount,
                    credit_transfer.ct_address,
                    credit_transfer.ct_header,
                    credit_transfer.ct_message,
                    credit_transfer.ho_name,
                    credit_transfer.ho_nic,
                    credit_transfer.user_id,
                    credit_transfer.ct_description,
                    credit_transfer.ct_date,
                    credit_transfer.ct_status
                    FROM
                    credit_transfer
                    WHERE
                    credit_transfer.ct_status != '98' ";

        $data = array();
        MainConfig::connectDB();
        $result = mysql_query($init_query);
        $numrows = mysql_num_rows($result);

        if ($numrows !== FALSE && $numrows < 2000) {
            while ($row = mysql_fetch_assoc($result)) {

//                search keywords are resetted in each db row
//                $keywords = array('yota', 'riu');
                $keywords = $keyword_arr;
//
                foreach ($row as $dbcol => $dbcell) {
// check if,there are any keywords left for search. (matched keywords are removed from array)
                    if (!empty($keywords)) {
//then, match column names to see if this column included for searching
                        if (in_array($dbcol, $search_cols)) {
//
                            foreach ($keywords as $index => $needle) {
                                if (stripos($dbcell, $needle) !== FALSE) {
// one of the keywords found in a cell value 
// remove the found keyword
                                    unset($keywords[$index]);
                                }
                            }

                            if (empty($keywords)) {
//all keywords are matched
                                $data[] = $row;
                                continue;
                            }
                        }
                    }
                }
            }
        } else {
            echo 'too many search results';
        }// too many search results
        MainConfig::closeDB();
        echo json_encode($data);
//
    } else if ($_POST['table'] == 'customer_search_res') {
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
    } else if ($_POST['table'] == 'load_proinv_vehicle_tbl') {
        if (!empty($_POST['ref_id'])) {
            $system->prepareSelectQueryForJSON("SELECT
            vehicle.vh_id,
            maker.maker_name,
            maker_model.mod_name,
            vehicle.vh_chassis_code,
            vehicle.vh_chassis_num,
            vehicle.engine_code,
            vehicle.engine_num,
            vehicle.engine_cc,
            vehicle.vh_year,
            vehicle.auc_display_price,
            vehicle.vh_code,
            pi_entries.pi_entry_id,
            pi_entries.tot_amt
            FROM
            vehicle
            INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
            INNER JOIN maker ON maker_model.maker_id = maker.maker_id
            INNER JOIN pi_entries ON pi_entries.vh_id = vehicle.vh_id
            WHERE
            pi_entries.pi_id = '{$_POST['ref_id']}'
            ORDER BY vehicle.vh_code ASC");
        }
    } else if ($_POST['table'] == 'load_supp_bank_tbl') {
        $system->prepareSelectQueryForJSON("SELECT
        supp_bank.bank_id,
        supp_bank.bank_name,
        supp_bank.swift,
        supp_bank.branch,
        supp_bank.ac_num
        FROM
        supp_bank
        WHERE
        supp_bank.bank_status = 1");
    } else if ($_POST['table'] == 'vh_search_res') {
        $system->prepareSelectQueryForJSON("SELECT
maker_model.mod_name,
maker.maker_name,
vehicle.vh_color,
vehicle.vh_chassis_num,
vehicle.vh_chassis_code,
vehicle.vh_code,
vehicle.vh_id
FROM
vehicle
INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
INNER JOIN maker ON maker_model.maker_id = maker.maker_id
WHERE
vehicle.record_status = '1' AND
vehicle.stock_status = '1'
ORDER BY
vehicle.supp_id ASC,
vehicle.vh_index_num ASC");
    } else if ($_POST['table'] == 'load_proInvoiceView_table') {
//viraj
        $system->prepareSelectQueryForJSON("SELECT
proforma_inv.pi_id,
proforma_inv.pi_no,
proforma_inv.pi_date,
customer.cus_inv_name,
proforma_inv.consignee_name,
proforma_inv.last_shipment_date,
proforma_inv.port_discharge,
proforma_inv.validity,
proforma_inv.presentation_period,
proforma_inv.total_cif,
proforma_inv.pi_sent,
proforma_inv.pi_type
FROM
proforma_inv
INNER JOIN customer ON customer.cus_id = proforma_inv.cus_id
WHERE
proforma_inv.pi_status = '{$_POST['inv_status']}'
ORDER BY
proforma_inv.pi_date ASC");
    } else if ($_POST['table'] == 'vh_search_filtered') {
        $system->prepareSelectQueryForJSON("SELECT
maker_model.mod_name,
maker.maker_name,
vehicle.vh_color,
vehicle.vh_chassis_num,
vehicle.vh_chassis_code,
vehicle.vh_code,
vehicle.vh_id
FROM
vehicle
INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
INNER JOIN maker ON maker_model.maker_id = maker.maker_id
WHERE
vehicle.record_status = '1' AND
vehicle.stock_status = '1' AND
maker_model.mod_id = '{$_POST['vh_model']}'
ORDER BY
vehicle.supp_id ASC,
vehicle.vh_index_num ASC");
    } else if ($_POST['table'] == 'load_lease_co_tbl') {
        $system->prepareSelectQueryForJSON("SELECT
leasing.ls_id,
leasing.ls_name,
leasing.ls_address,
leasing.ls_contact,
leasing.ls_status
FROM
leasing
WHERE
leasing.ls_status = '1'");
    } else if ($_POST['table'] == 'syscode_tbl') {
        $query = "SELECT
        syscode.description,
        syscode.sys_id,
        syscode.remarks
        FROM
        syscode
        WHERE
        syscode.type = '{$_POST['type_id']}'";
        $system->prepareSelectQueryForJSON($query);
    } else if ($_POST['table'] == 'web_vh_feauture_list') {
        $query = "SELECT
        syscode.description,
        syscode.sys_id,
        syscode.remarks
        FROM
        syscode
        WHERE
        syscode.type = '{$_POST['type_id']}' ORDER BY syscode.description ASC";
        MainConfig::connectDB();
        $result = mysql_query($query) or die(mysql_error());
        $rowcount = mysql_num_rows($result);
        $html = '';
        if ($rowcount > 0) {
            $blank_cell = 3 - ($rowcount % 3);
            $j = 0;
            while ($row1 = mysql_fetch_assoc($result)) {
                if ($j === 0) {
                    $html .= '<tr>';
                }
                $html .= '<td><label><input type="checkbox" value="' . $row1['sys_id'] . '"/>&nbsp;' . $row1['description'] . '</label></td>';
                $j++;
                if ($j === 3) {
                    $html .= '</tr>';
                    $j = 0;
                }
            }
            if ($blank_cell < 3) {
                for ($i = 1; $i <= $blank_cell; $i++) {
                    $html .= '<td>&nbsp;</td>';
                }
                $html .= '</tr>';
            }
        }
        MainConfig::closeDB();
        echo $html;
//
    } else if ($_POST['table'] == 'tbl_web_homepg') {
        $query = "SELECT
        web_homepg.wh_id,
        web_homepg.wh_image,
        web_homepg.wh_head1
        FROM
        web_homepg WHERE
        web_homepg.wh_section = '{$_POST['section']}'";
        $system->prepareSelectQueryForJSON($query);
    } else if ($_POST['table'] == 'vehicle_spec_table') {
        $query = "SELECT
        vh_tech_spec.spec_title,
        vh_tech_spec.spec_id,
        vh_tech_spec.eng_cc,
        vh_tech_spec.eng_rpm,
        vh_tech_spec.perf_max_speed,
        vh_tech_spec.trans_type,
        vh_tech_spec.fuel_cons_highway,
        vh_tech_spec.bd_curb_weight,
        vh_tech_spec.cap_fuel_tank
        FROM
        vh_tech_spec
        WHERE
        vh_tech_spec.mod_id = '{$_POST['model_id']}'";
        $system->prepareSelectQueryForJSON($query);
    } else if ($_POST['table'] == 'sendWeb_selectedVh') {
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
        vehicle.vh_id IN ({$_POST['idlist']})";
        $system->prepareSelectQueryForJSON($query);
    } else if ($_POST['table'] == 'addTo_clearVh') {
        $query = "SELECT
                vehicle.vh_id,
                vehicle.vh_code,
                vehicle.vh_maker_model,
                vehicle.vh_index_num,
                vehicle.engine_cc,
                vehicle.vh_color,
                vehicle.vh_year,
                vehicle.auction_name,
                vehicle.transmission,
                vehicle.record_status
                FROM
                vehicle
                WHERE
                vehicle.vh_id IN ({$_POST['idlist']})";
        $system->prepareSelectQueryForJSON($query);
    } else if ($_POST['table'] == 'load_clearBalance') {
        $query = "SELECT
                    clr_agent_payment.agpay_id,
                    clr_agent_payment.ag_name,
                    clr_agent_payment.agpay_date,
                    clr_agent_payment.ag_charge,
                    clr_agent_payment.ag_paid,
                    clr_agent_payment.pay_type,
                    clr_agent_payment.vh_id,
                    clr_agent_payment.cus_id,
                    clr_agent_payment.agpay_desc,
                    clr_agent_payment.agpay_confirmed,
                    clr_agent_payment.agpay_status
                    FROM
                    clr_agent_payment
                    ";
        $system->prepareSelectQueryForJSON($query);
    } else if ($_POST['table'] == 'news_details_tbl') {
        $system->prepareSelectQueryForJSON("SELECT
        web_news.news_id,
        web_news.heading_1,
        web_news.posted_date,
        web_news.image
        FROM
        web_news");
    } else if ($_POST['table'] == 'load_vh_group_tbl') {
        $system->prepareSelectQueryForJSON("SELECT DISTINCT (tbl.vh_group)
        FROM
        (SELECT vehicle.vh_id,vehicle.vh_group
        FROM vehicle WHERE vh_group !='' ORDER BY vehicle.vh_id DESC LIMIT 100) AS tbl");
    } else if ($_POST['table'] == 'report_imported_vehicle') {
        $system->prepareSelectQueryForJSON("SELECT
        vehicle.vh_code,
        maker.maker_name,
        maker_model.mod_name,
        vehicle.vh_chassis_code,
        vehicle.vh_chassis_num,
        vehicle.vh_year,
        vehicle.vh_color,
        vehicle.vh_milage,
        vehicle_other.tot_cost,
        vehicle_other.import_date
        FROM vehicle
        INNER JOIN vehicle_other ON vehicle_other.vh_id = vehicle.vh_id
        INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
        INNER JOIN maker ON maker_model.maker_id = maker.maker_id
        WHERE vehicle.record_status = 1 AND vehicle_other.import_date BETWEEN '{$_POST['firstDate']}' AND '{$_POST['endDate']}'");
    } else if ($_POST['table'] == 'report_vehicle_sales') {
        $system->prepareSelectQueryForJSON("SELECT
        vehicle.vh_code,
        maker.maker_name,
        maker_model.mod_name,
        CONCAT_WS('-',vehicle.vh_chassis_code,vehicle.vh_chassis_num) AS vh_chassis,
        vehicle_other.import_date,
        customer.cus_inv_name,
        vehicle_other.vh_reg_num,
        vehicle_other.tot_cost,
        vehicle_other.sold_price,
        (vehicle_other.sold_price-vehicle_other.tot_cost) AS sales_profit
        FROM
        vehicle
        INNER JOIN vehicle_other ON vehicle_other.vh_id = vehicle.vh_id
        INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
        INNER JOIN maker ON maker_model.maker_id = maker.maker_id
        INNER JOIN customer ON customer.cus_id = vehicle_other.cus_id
        WHERE vehicle.record_status = 1 AND vehicle_other.import_date BETWEEN '{$_POST['firstDate']}' AND '{$_POST['endDate']}'");
    } else if ($_POST['table'] == 'exvh_search_result') {
        $system->prepareSelectQueryForJSON("SELECT
        vehicle.vh_code,
        vehicle.vh_id,
        maker.maker_name,
        maker_model.mod_name,
        CONCAT(vehicle.vh_chassis_code,'-',vehicle.vh_chassis_num) AS vh_chassis
        FROM
        vehicle
        INNER JOIN vehicle_other ON vehicle_other.vh_id = vehicle.vh_id
        INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
        INNER JOIN maker ON maker_model.maker_id = maker.maker_id
        WHERE
        vehicle_other.vh_purchase_type = '1'");
    } else if ($_POST['table'] == 'report_cheque') {
//    Sam_Rulz Creations - Sam -
        $system->prepareSelectQueryForJSON("SELECT
customer.cus_inv_name,
vh_payment.in_amount,
vh_payment.pay_date,
vh_payment.chq_date,
vh_payment.pay_bank,
vh_payment.chq_num,
vh_payment.pay_confirmed,
vh_payment.vp_id,
vh_payment.bank_account
FROM
vh_payment
INNER JOIN customer ON customer.cus_id = vh_payment.cus_id
WHERE
vh_payment.pay_method = 'CHEQUE' AND
vh_payment.pay_date BETWEEN '{$_POST['firstDate']}' AND '{$_POST['endDate']}'  AND
vh_payment.pay_confirmed = '{$_POST['chq_type']}'");
    } else if ($_POST['table'] == 'vh_payments') {
        $system->prepareSelectQueryForJSON("SELECT
    vh_payment.in_amount,
    vh_payment.pay_date,
    vh_payment.chq_date,
    vh_payment.pay_method,
    vh_payment.pay_bank,
    vh_payment.chq_num,
    vh_payment.pay_confirmed,
    vh_payment.vp_id,
    vh_payment.pay_category,
    vh_payment.bank_account
    FROM
    vh_payment
    WHERE
    vh_payment.vh_id = '{$_POST['vh_id']}' AND
    vh_payment.pay_confirmed < '5' ORDER BY
    vh_payment.pay_date ASC,
    vh_payment.pay_method ASC");
    } else if ($_POST['table'] == 'report_vh_stock') {
        $qpart1 = "SELECT
	vehicle.vh_code,
	maker.maker_name,
	maker_model.mod_name,
	vehicle.vh_chassis_code,
	vehicle.vh_chassis_num,
	vehicle.vh_year,
	vehicle.vh_color,
	vehicle.vh_milage,
	vehicle_other.import_date,
	vehicle.stock_location,
	vehicle_other.vh_purchase_type
        FROM
	vehicle
	INNER JOIN vehicle_other ON vehicle_other.vh_id = vehicle.vh_id
	INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
	INNER JOIN maker ON maker_model.maker_id = maker.maker_id
        WHERE
        vehicle.record_status = '1'";
        if (!empty($_POST['st_location']) && $_POST['st_location'] !== 0) {
            $qpart1 .= "  AND vehicle.stock_location = '{$_POST['st_location']}'";
        }
        $qpart1 .= " ORDER BY maker.maker_name ASC,maker_model.mod_name ASC,vehicle_other.import_date ASC";
        $system->prepareSelectQueryForJSON($qpart1);
    } else if ($_POST['table'] == 'vh_inweb') {
        $query = "SELECT
        vehicle.vh_code,
        vehicle.vh_id,
        maker_model.mod_name,
        maker.maker_name,
        CONCAT(vehicle.vh_chassis_code,'-',vehicle.vh_chassis_num)AS vh_chassis,
        vehicle.vh_year,
        vehicle.vh_color,
        maker_model.mod_id
        FROM web_vh_data
        INNER JOIN vehicle ON web_vh_data.vh_id = vehicle.vh_id
        INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
        INNER JOIN maker ON maker_model.maker_id = maker.maker_id
        ORDER BY
        maker.maker_name ASC,
        maker_model.mod_name ASC,
        vehicle.vh_id DESC LIMIT 100";
        $system->prepareSelectQueryForJSON($query);
    } else if ($_POST['table'] == 'vh_clear_entry') {
        $query = "SELECT
                    vh_clearing.clr_id,
                    vh_clearing.vh_id,
                    vh_clearing.shipped_date,
                    vh_clearing.clr_group,
                    vh_clearing.vh_marks_invoice,
                    vh_clearing.coordinator,
                    vh_clearing.driver_name,
                    vh_clearing.vessel,
                    vh_clearing.refunds,
                    vh_clearing.clr_st,
                    vh_clearing.clr_status,
                    vh_clearing.arrival_date,
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
                    vh_clearing";
        $system->prepareSelectQueryForJSON($query);
    } else if ($_POST['table'] == 'vh_clear_entry') {
        $query = "SELECT
                    vh_clearing.clr_id,
                    vh_clearing.vh_id,
                    vh_clearing.shipped_date,
                    vh_clearing.clr_group,
                    vh_clearing.vh_marks_invoice,
                    vh_clearing.coordinator,
                    vh_clearing.driver_name,
                    vh_clearing.vessel,
                    vh_clearing.refunds,
                    vh_clearing.clr_st,
                    vh_clearing.clr_status,
                    vh_clearing.arrival_date,
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
                    vh_clearing";
        $system->prepareSelectQueryForJSON($query);
    } else if ($_POST['table'] == 'load_view_clearing_tbl') {
        $rec_per_page = 15; // enter the same value in 'view_vechicle_tbl_paging'
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
                         vh_clearing.clr_id
                        FROM
                        vehicle
                        INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
                        INNER JOIN maker ON maker_model.maker_id = maker.maker_id
                        LEFT JOIN coordinator ON vehicle.coordinator_id = coordinator.coordinator_id
                        INNER JOIN supplier ON vehicle.supp_id = supplier.supp_id
                        LEFT JOIN vh_clearing ON vh_clearing.vh_id = vehicle.vh_id
                        WHERE
                            vehicle.record_status = '1'   ";

        if ($_POST['stock_status'] != 0) {
            $query_p1 = $query_p1 . " AND  vehicle.stock_status = '{$_POST['stock_status']}'";
        }

        $query_p3 = " ORDER BY vehicle.vh_group ASC,vehicle.vh_index_num ASC LIMIT $start_from, $rec_per_page";
        if ($_POST['supp_id'] > 0) {
            $query_p2 = " AND supplier.supp_id = '{$_POST['supp_id']}'";
//            create_vehicle_viewlist($query_p1 . $query_p2 . $query_p3, $query_p1 . $query_p2);
            $system->prepareSelectQueryForJSON($query_p1 . $query_p2 . $query_p3);
        } else {
            $system->prepareSelectQueryForJSON($query_p1 . $query_p3);
        }
    } else if ($_POST['table'] == 'load_drch_payment_tbl') {
        $query_p1 = "SELECT
	driver_charges.drch_payment,
	driver_charges.pay_status,
	driver_charges.drch_date,
        driver_charges.drch_id
        FROM
             driver_charges
        WHERE
        driver_id = '{$_POST['dr_id']}' AND drch_type = '1'  AND
        driver_charges.record_status = '1'       
        ORDER BY
        driver_charges.drch_id DESC";
        $system->prepareSelectQueryForJSON($query_p1);
    }
}