<?php
//echo $_POST['file_ai_id'];
//exit;

require_once './include/MainConfig.php';
include './config/dbc.php';
?>
<!DOCTYPE html>
<!-- @ASHAN -->
<html>
    <head>  
        <!--load CSS styles-->
        <?php require_once './include/systemHeader.php'; ?>        
        <link type="text/css" href="css/lightslider.css" rel="stylesheet" >
        <style type="text/css">
            .demo {
                width:620px;
            }
            ul {
                list-style: none outside none;
                padding-left: 0;
                margin-bottom:0;
            }
            li {
                display: block;
                float: left;
                margin-right: 6px;
                cursor:pointer;
                /*height: 40px;*/
            }
            img {
                display: block;
                height: auto;
                max-width: 100%;
            }
            .detail_tbl tr{
                /*height: 25px;*/
                border: 1px solid #B2B3B2;
            }
            .detail_tbl td{
                text-align: right;
                padding: 3px;
            }

            .detail_tbl th{
                text-align: left;
                padding: 3px;
            }

            .detail_tbl{
                font-size: 15px;
                width: 80%;
            }
        </style>
    </head>
    <body class="green-back">
        <div id="wrap">
            <!--load navigation bar-->
            <?php require_once './include/navBar.php'; ?>
            <div class="container-fluid">            
                <button class="btn btn-info "  style="margin-top:40px;" id="back_btn">Back</button>
                <?php
                echo '<div class="margin-top:100px;>';
                if (isset($_POST['image_ai_id'])) {
                    $img_ai_id = $_POST['image_ai_id'];
                } else {
                    header('Location: img_view_file_list.php');
                }
                MainConfig::connectDB();

                $img_file_data = mysql_query("SELECT
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
                img_file
                WHERE
                img_file.image_ai_id = '{$img_ai_id}'");

                if (!empty($img_file_data)) {
                    while ($row = mysql_fetch_array($img_file_data)) {
                        $file_category = $row['file_category'];
                        $file_id = $row['file_id'];
                        $file_name = $row['file_name'];
                        $file_description = $row['file_description'];
                        $file_added_date = $row['file_added_date'];
                        $file_last_update_date = $row['file_last_update_date'];
                        $pdf_file = $row['pdf_file'];
                        $image_file = $row['image_file'];
                        $rack_no = $row['rack_no'];
                        $row_no = $row['row_no'];
                        $box_no = $row['box_no'];
                    }
                }
                ?>
                <div class="row">                                 
                    <div class="col-md-12">
                        <div class="page-header cutom-header">
                            <h3><?php
                                echo $file_category . ' ' . $file_id;
                                ?></h3>
                        </div>
                        <div class="row">
                            <!-- FORM START -->
                            <div class="col-md-7" style="">
                                <div>
                                    <?php
                                    if (!empty($pdf_file)) {
                                        ?>
                                        <div class="demo" style="padding: 35px 0 0 35px;">
                                            <ul id="lightSlider">
                                                <?php
                                                echo '<li><embed src = "./image_library/' . $pdf_file . '" type = "application/pdf" width = "100%" height = "600px" /> </li>';
                                                ?>
                                            </ul>
                                        </div>
                                    <?php } else { ?>

                                        <div style="padding: 40px 0 0 110px;"><img src="images/pdf_unavailable.png"></div>

                                        <?php
                                    }
                                    ?>
                                </div>
                            </div>



                            <div class="col-md-5" style="">
                                <div>
                                    <?php
                                    if (!empty($image_file)) {
                                        ?>
                                        <div class="demo" style="padding: 35px 0 0 35px;">
                                            <ul id="lightSlider">
                                                <?php
                                                  $img_path = './image_library/' . $image_file;
                                                    echo '<li><img src = "./image_library/' . $image_file . '"  width = "400" height = "600" /> </li>';
                                                    ?>
                                            </ul>
                                        </div>

                                    <?php } else {
                                        ?>
                                        <div style="padding: 40px 0 0 110px;"><img src="images/no_image_available.png"></div>
                                            <?php
                                        }
                                        ?>
                                </div>
                            </div>
                            <!--                            <div class="col-md-5" style="">
                                                            <div>
                                                                <table class="detail_tbl" border="1">
                                                                    <tbody>
                                                                        <tr>
                                                                            <th>FILE NAME:</th>
                                                                            <td><?php // echo isset($file_name) ? $file_name : '';      ?></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>DESC:</th>
                                                                            <td><?php //echo isset($file_description) ? $file_description : '';      ?></td>
                                                                        </tr>
                            
                                                                        <tr>
                                                                            <th>File:</th>
                                                                            <td><?php //echo isset($pdf_file) ? '<a href="image_library/' . $pdf_file . '">Download PDF<a>' : '';      ?></td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>-->
                            <!--END OF COL-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--load JavaScript-->
        <?php require_once './include/systemFooter.php';
        ?>
        <script type="text/javascript" src="js/lightslider.min.js"></script>

        <script type="text/javascript">
            $(function () {

                $('#lightSlider').lightSlider({
                    gallery: true,
                    item: 1,
                    loop: true,
                    slideMargin: 0,
                    thumbItem: 9
                });


                $('#back_btn').click(function () {
                    submitSingleDataByPost('img_view_file_list.php', 'veh_id', 1);
                });

                pageProtect();
                checkurl();
                $('#logout').click(function () {
                    logout();
                });

            });
            $('select').chosen({width: "100%"});
        </script>
    </body>

</html>

