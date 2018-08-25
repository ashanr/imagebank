<?php
require_once './include/MainConfig.php';
include './config/dbc.php';
?>
<!DOCTYPE html>
<html>
    <head> 
        <style>

            .font-small{
                font-size: 9pt;
            }
            .font-xsmall{
                font-size: 8pt;
            }
            .tbl12{
                border: 1px solid #000;
                border-collapse: collapse;
            }
            .tbl12 th, .tbl12 td {
                border: 1px solid #000;
                border-collapse: collapse;
                margin: 0px;
            }
            .noborder{
                border: none;
                border-collapse: collapse;
            }
            .noborder td, .noborder th{
                border: none;
                border-collapse: collapse;
            }
            @media print {

                .hide_content{
                    display: none;  
                }  
                @page{
                    margin-left: 2cm;
                    margin-bottom: 1.5cm;
                    margin-right: 2cm;
                    margin-top: 1.5cm;
                }

            }
        </style>
    </head>
    <body>
        <div <?php echo isset($_REQUEST['print_view']) ? 'style="display:none;"' : ''; ?>>
            <a href="quotation_list.php" class="hide_content" style="font-size: 20px;font-weight: bold; background-color: #f4bb51;" id="back">Vehicle Quotation List</a>
            <button class="btn btn-success hide_content tooltip-inner" style="border-radius: 5px;font-size: 20px;padding:6px;margin-left: 30px;margin-top: -50px" onclick="window.print()" data-toggle="tool-bar" title="print view" id="print"><b>Print</b></button>

            <div class="hide_content">
                <br/>
                <?php
                $numrows = 0;
                $pinv_data_arr;
                $vh_id;
//                echo $_REQUEST['vh_id'];
//                echo $_REQUEST['cus_id'];
                $data = $_REQUEST['vh_id'] && $_REQUEST['cus_id'];
                if (isset($data)) {
                    $vh_id = $_REQUEST['vh_id'];
                    MainConfig::connectDB();
                    $cus_data = mysql_query("SELECT
                        customer.cus_inv_name,
                        customer.cus_address,
                        customer.cus_phone1,
                        customer.cus_phone2
                        FROM
                        customer
                        WHERE
                        customer.cus_id = '{$_REQUEST['cus_id']}'");
                    $query = "SELECT
                        maker.maker_name,
                        maker_model.mod_name,
                        maker_model.mod_desc,
                        vehicle.package,
                        vehicle.vh_year,
                        vehicle.vh_chassis_num,
                        vehicle.engine_cc,
                        vehicle.engine_code,
                        vehicle.vh_color,
                        IF(vehicle.auc_display_price>0,vehicle.auc_display_price,vehicle.auc_real_price) AS v_price,
                        vehicle.vh_options,
                        vehicle.fuel_type,
                        vehicle.transmission,
                        vehicle.seats,
                        vehicle.drive_wheels
                        FROM
                        vehicle
                        INNER JOIN maker_model ON vehicle.vh_maker_model = maker_model.mod_id
                        INNER JOIN maker ON maker_model.maker_id = maker.maker_id
                        WHERE
                        vehicle.vh_id = '{$vh_id}' ";

                    $arr = array();
                    while ($row = mysql_fetch_assoc($cus_data)) {
                        $arr[] = $row;
                    }
                    foreach ($arr as $cus_details) {
                        $cusName = $cus_details['cus_inv_name'];
                        $cusAddrs = $cus_details['cus_address'];
                        $cusPhon1 = $cus_details['cus_phone1'];
                        $cusPhon2 = $cus_details['cus_phone2'];
                    }
                    $pinv_res = mysql_query($query);
                    $numrows = mysql_num_rows($pinv_res);
                    if ($numrows === 1) {
                        $pinv_data_arr = mysql_fetch_assoc($pinv_res);
                    } else {
                        header('Location: ' . $_SERVER['HTTP_REFERER']);
                    }
                } else {
                    echo 'invalid quotation';
                }

                MainConfig::closeDB();
                ?>

                <form action="mpdf/ct_download.php" method="post" style="">
                    <div style="" >
                        <input type="hidden" name="ref_id" value='<?php echo isset($_REQUEST['vh_id']) ? $_REQUEST['vh_id'] : 0; ?>'/>
                        <input type="text" name="email"  placeholder="email adress"/>
                        <input type="text" name="email_cc1" value='<?php ?>' placeholder="CC"/>
                        <input type="text" name="email_cc2" value='<?php ?>' placeholder="CC"/>
                        <input type="hidden" name="print_template" value='ct_print.php' placeholder="CC"/>
                    </div>
                    <input type="submit" id="createPdf" value="Email.PDF"/>
                </form>
            </div>
        </div>

        <div>


            <div style="padding-top: 10px;" class="font-small">
                <table style="width: 100%;">
                    <colgroup>
                        <col style="width: 30%;" />
                        <col style="width: 70%;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <td> <img src="img/siyekra.png" style="width: 100%;height: 60%;"></td>
                        </tr>

                    </tbody>
                </table>
                <div style="text-align: center;font-weight: bold;font-size: 15px;">Vehicle Quotation</div>
                <hr>
            </div>

            <div class="font-small" style="margin-top: 20px;">
                <div style="padding: 5px;">Customer Information</div>
                <div style="margin-top: 10px;">
                    <table style="width: 90%;" class="table-bordered">
                        <colgroup><col style="width: 35%;"><col style=""></colgroup>
                        <tr >
                            <td><b>Customer name</b></td><td><?php echo $cusName; ?></td>
                        </tr>
                        <tr>
                            <td><b>Address</b></td><td><?php echo $cusAddrs; ?></td>
                        </tr>
                        <tr>
                            <td><b>Contact No</b></td><td><?php echo $cusPhon1 . ' &nbsp;  &nbsp; ' . $cusPhon2; ?></td>
                        </tr>
                    </table>
                </div>
            </div>

            <table border="1 " style="height: 80%;margin-top:30px;" width="100%" class="tbl12" style="border:thick #000000 groove;border-collapse: collapse">
                <tr>
                    <th width="20%">Remarks</th>
                    <th colspan="2">DESCRIPTION OF MOTOR VEHICLE </th>
                    <th  width="20%">OTHER</th>
                </tr>
                <tr>
                    <td rowspan="3">
                        <?php
                        $numrows = 0;
                        $option_data_arr;
                        $balance;
                        $data = $_REQUEST['vh_id'];
                        if (isset($data)) {
                            $vh_id = $_REQUEST['vh_id'];
                            MainConfig::connectDB();
                            $price = "SELECT
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
                                        quotation.balance
                                        FROM
                                        quotation
                                        where quotation.vh_id ='{$_REQUEST['vh_id']}'";

                            $balance = mysql_query($price);
                            $numrows = mysql_num_rows($balance);

                            $arr = array();
                            while ($row = mysql_fetch_assoc($balance)) {
                                $price_arr[] = $row;
                            }
                            foreach ($price_arr as $q_details) {
                                $vehicle_price = $q_details['vehicle_price'];
                                $first_advance = $q_details['first_advance'];
                                $lc_charge = $q_details['lc_charge'];
                                $second_advance = $q_details['second_advance'];
                                $balance = $q_details['balance'];
                                $invoice_no = $q_details['invoce_no'];
                            }
                        } else {
                            echo 'invalid quotation';
                        }
                        MainConfig::closeDB();
                        ?>

                        <?php echo $invoice_no ?></td>
                    <td colspan="2">
                        <table class="noborder" style="width: 90%;">
                            <colgroup><col style="width: 35%;"><col style=""></colgroup>
                            <tr>
                                <td  style="background-color:#39b3d7"><b>Maker</b></td><td><?php echo $pinv_data_arr['maker_name']; ?></td>
                            </tr>
                            <tr>
                                <td  style="background-color:#39b3d7"><b>Model Name</b></td><td><?php echo $pinv_data_arr['mod_name']; ?></td>
                            </tr>
                            <tr>
                                <td  style="background-color:#39b3d7"><b>Model No</b></td><td><?php echo $pinv_data_arr['mod_desc'] . ' - &nbsp;&nbsp;&nbsp;     ' . $pinv_data_arr['vh_chassis_num']; ?></td>
                            </tr>
                            <tr>
                                <td  style="background-color:#39b3d7"><b>Package</b></td><td><?php echo $pinv_data_arr['package']; ?></td>
                            </tr>
                            <tr>
                                <td  style="background-color:#39b3d7"><b>Year</b></td><td><?php echo $pinv_data_arr['vh_year']; ?></td>
                            </tr>
                            <tr>
                                <td  style="background-color:#39b3d7"><b>Chassis No</b></td><td><?php echo $pinv_data_arr['vh_chassis_num']; ?></td>
                            </tr>
                            <tr>
                                <td  style="background-color:#39b3d7"><b>Engine Capacity</b></td><td><?php echo $pinv_data_arr['engine_cc']; ?></td>
                            </tr>
                            <tr>
                                <td  style="background-color:#39b3d7"><b>Options</b></td><td><?php echo $pinv_data_arr['vh_options']; ?></td>
                            </tr>
                        </table>
                    </td>
                    <td rowspan="3"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><b>Options</b></td>
                </tr>
                <tr><td colspan="2">
                        <?php
                        $numrows = 0;
                        $option_data_arr;
                        $opt_res;

                        $data = $_REQUEST['vh_id'];
                        if (isset($data)) {
                            $vh_id = $_REQUEST['vh_id'];
                            $ft_num;
                            MainConfig::connectDB();
                            $op = "SELECT
                                syscode.type,
                                syscode.`code`,
                                syscode.description,
                                syscode.is_default,
                                syscode.remarks,
                                syscode.sys_id,
                                vehicle.vh_id
                                FROM
                                vh_features
                                INNER JOIN syscode ON vh_features.vh_ft_syscode = syscode.sys_id
                                INNER JOIN vehicle ON vh_features.vh_id = vehicle.vh_id
                                WHERE
                                vehicle.vh_id ='{$_REQUEST['vh_id']}'";

                            // $options = "SELECT vh_options FROM vehicle WHERE	vehicle.vh_id ='{$_REQUEST['vh_id']}' ";
                            $opt_res = mysql_query($op);
                            $numrows = mysql_num_rows($opt_res);

                            $arr = array();
                            while ($row = mysql_fetch_assoc($opt_res)) {
                                $arr[] = $row;
                            }
                            $ft_num = count($arr);

                            while ($option_location = current($arr) !== FALSE) {
                                foreach ($arr as $vh_options) {
                                    if (key($arr) == 0) {
                                        echo '';
                                        next($arr);
                                    } else if (key($arr) % 2 == 0) {
                                        echo '<span style="float:right;margin-left:40px;" >' . $vh_options['description'] . '</span></br>';
                                        next($arr);
                                    } else {
                                        echo '<span style="float:left;" >' . $vh_options['description'] . '</span>';
                                        next($arr);
                                    }
                                }
                            }
                        } else {
                            echo 'invalid quotation';
                        }
                        MainConfig::closeDB();
                        ?>
                    </td>
                </tr>
                <tr>
                <table>
                    <td style=";border-bottom-color:#ffffff;border-left-color:#ffffff">&nbsp;</td>
                    <td colspan="3" style="font-weight:bold;"> Vehicle Price <?php echo '<span style="float:right; line-height: 90%;">Rs.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' . $vehicle_price . '</span></br>'; ?></br></td>
                    <td>1st Advance Payment <?php echo '<span style="float:right; line-height: 90%;">Rs.&nbsp;&nbsp;&nbsp;&nbsp;' . $first_advance . '</span></br>'; ?></br></td>
                    <td> LC Charges <?php echo '<span style="float:right; line-height: 90%;>Rs.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' . $lc_charge . '</span></br>'; ?></br></td>
                    <td>2nd Advance Payment <?php echo '<span style="float:right;">Rs.&nbsp;&nbsp;&nbsp;' . $second_advance . '</span></br>'; ?></br></td>
                    <td> Balance <?php echo '<span style="float:right;">Rs.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' . $balance . '</span></br>'; ?> </td></td>
                       
                        
                       
                </tr>
            </table>
        </div>

    </tr>
</div>


<!--<div style="margin-top:90px;">
    <span class="col-md-4"style="font-size:20px;font-weight: bold;margin-top:50px;">...............................  </span>
    <span class="col-md-8" style="margin-left:750px;font-size:20px;font-weight: bold;padding-right: 170px;">...........................................</span>
    <span class="col-md-4"style="font-size:20px;font-weight: bold;margin-left: 25px;">Date  </span>
    <span class="col-md-8" style="margin-left:750px;font-size:20px;font-weight: bold;margin-left:700px;">Authorized Signature</span>
</div>-->



</div>
</body>
</html><!-- @Ashan Rajapaksha MDCC IT Solutions--><?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

