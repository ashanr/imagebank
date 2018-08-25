<?php
require_once './include/MainConfig.php';
include './config/dbc.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <?php require_once './include/systemHeader.php'; ?>        
    </head>
    <body class="green-back">
        <div>
            <?php require_once './include/navBar.php'; ?>
            <div class="container-fluid">

                <div class="row hidden-print">
                    <div class="col-md-12">
                        <div class="col-md-4">
                            <div class="page-header cutom-header">
                                <h3>File Data Report</h3>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group " style="margin-top:50px;">                                        
                                <label class="col-md-4 control-label custom-label">Subject:</label>
                                <div class="col-md-8 ">
                                    <select class="category_ComboBox"></select>
                                </div>

                            </div>
                        </div>

                        <div class="col-md-4" style="margin-top:50px;">
                            <div class="form-group">                           
                                <div>
                                    <button class="btn btn-primary col-md-4" id="genReport">Generate Report</button>
                                    <button class="btn btn-default col-md-4" onclick="print()" style="margin-left: 0px;">Print</button>
                                </div>
                            </div>   
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <span id="rep_date">Report File Information pdf Subject As at <?php echo date('Y-m-d, h:i:s A') ?></span>
                        <table class="table table-bordered table-striped table-striped" id="tlReport">
                            <thead>
                                <tr>
                                    <th>Location</th>
                                    <th>Maker</th>
                                    <th>Model</th>
                                    <th>Code</th>
                                    <th>import date</th>
                                    <th>Chassis No.</th>
                                    <th>Purchase Type</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th colspan="12" class="text-center">Click Generate Button to view report</th>
                                </tr>
                            </tbody>
                            <tfoot>

                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <?php require_once './include/systemFooter.php'; ?>
        <script>

            $(function () {
                $('select').chosen({width: "100%"});
                $(".dp").datepicker({
                    format: "yyyy-mm-dd"
                });

                file_subject_combo();
                $("#genReport").click(function () {

                });

            });


          




        </script>
    </body>
</html>
