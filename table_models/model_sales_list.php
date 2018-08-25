<?php

require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$dbClass = new database();
$system = new setting();

if (array_key_exists("table", $_POST)) {
    if ($_POST['table'] == 'load_view_vehicle_sales_tbl') {
        $query_p1 = "SELECT
                    vehicle.vh_id,
                    vehicle.vh_code,
                    vehicle.vh_index_num,
                    vh_sales.sales_id,
                    vh_sales.selling_price,
                    vh_sales.sold_price,
                    vh_sales.sell_status,
                    vh_sales.current_milage,
                    vh_sales.vh_sales_status,
                    vh_sales.marked_price,
                    vh_sales.sold_date,
                    vehicle.auc_real_price,
                    vehicle.coordinator_id,
                    coordinator.coordinator_name,
                    vehicle.engine_cc,
                    vehicle.vh_milage,
                    vehicle.stock_status,
                    coordinator.coordinator_id,
                    vh_clearing.shipped_date,
                    vehicle.vh_maker_model,
                    maker_model.mod_id,
                    maker.maker_name
                    FROM
                    vehicle
                    INNER JOIN vh_sales ON vh_sales.vh_id = vehicle.vh_id
                    INNER JOIN coordinator ON coordinator.coordinator_id = vh_sales.coordinator_id
                    INNER JOIN vh_clearing ON vh_clearing.vh_id = vehicle.vh_id
                    INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
                    INNER JOIN maker ON maker_model.maker_id = maker.maker_id
                    WHERE vh_sales.record_status ='1'";
        if (isset($_POST['serch_text']) && (!empty($_POST['serch_text']))) {
            $query_p1 .= "AND vehicle.vh_code LIKE '{$_POST['serch_text']}%'";
        }
        if ($_POST['sell_status'] != 0) {
            $query_p1 = $query_p1 . " AND vh_sales.sell_status = '{$_POST['sell_status']}'";
        }
//        echo $query_p1;
//        return;
        $system->prepareSelectQueryForJSON($query_p1);
    }//    ******************** keyword search with paging--  
    else if ($_POST['table'] == 'sales_keyword_tbl') {
        $keyword_arr = $_POST['key_arr'];
        // column names are case sensitive
        $search_cols = array('vh_code', 'vh_id', 'maker_model', 'coordinator_name');
        $init_query = "SELECT
                    vehicle.vh_id,
                    vehicle.vh_code,
                    vehicle.vh_index_num,
                    vh_sales.sales_id,
                    vh_sales.selling_price,
                    vh_sales.sold_price,
                    vh_sales.sell_status,
                    vh_sales.current_milage,
                    vh_sales.vh_sales_status,
                    vh_sales.marked_price,
                    vehicle.auc_real_price,
                    vehicle.coordinator_id,
                    coordinator.coordinator_name,
                    vehicle.engine_cc,
                    vehicle.vh_milage,
                    vehicle.stock_status,
                    coordinator.coordinator_id,
                    vh_clearing.shipped_date,
                    vehicle.vh_maker_model,
                    maker_model.mod_id,
                    maker.maker_name
                    FROM
                    vehicle
                    INNER JOIN vh_sales ON vh_sales.vh_id = vehicle.vh_id
                    INNER JOIN coordinator ON coordinator.coordinator_id = vh_sales.coordinator_id
                    INNER JOIN vh_clearing ON vh_clearing.vh_id = vehicle.vh_id
                    INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
                    INNER JOIN maker ON maker_model.maker_id = maker.maker_id
                    WHERE vh_sales.record_status = '1' ";

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
    } else if ($_POST['table'] == 'vhcle_payment_model_table') {
        $system->prepareSelectQueryForJSON("SELECT
payments.payment_id,
payments.payment_date,
payments.amount,
payments.time
FROM `payments`
WHERE
payments.vh_id = '{$_POST['veh_id']}'");
    }
}