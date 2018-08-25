<?php
require_once './include/MainConfig.php';
include './config/dbc.php';
?>
<!DOCTYPE html>
<!-- @Ashan-->
<html>
    <head>  
        <!--load CSS styles-->
        <?php require_once './include/systemHeader.php'; ?>        
    </head>
    <body class="green-back">
        <div id="wrap">
            <!--load navigation bar-->
            <?php require_once './include/navBar.php'; ?>
            <div class="container-fluid">               
                <div class="row">                                 
                    <div class="col-md-12">
                        <div class="page-header cutom-header">
                            <h3>Subjects</h3>
                        </div>
                        <div class="row">
                            <!-- FORM START -->
                            <div class="col-md-6">
                                <div class="form-horizontal">
                                    <input type="hidden" id="maker_id">

                                    <div class="form-group ">                                        
                                        <label class="col-lg-4 control-label custom-label required">Subject* :</label>
                                        <div class="col-lg-6">
                                            <input type="text" id="subject_name" class="form-control custom-text1" maxlength="45" required onkeyup="set_focus_next(event, '#subject_code')">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label custom-label">Subject Code* :</label>
                                        <div class="col-lg-6">
                                            <input type="text" id="subject_code" class="form-control custom-text1" onkeyup="set_focus_next(event, '#company_tel1')">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-offset-4 col-lg-10">
                                            <span  id="maker_save_div" class="">
                                                <button class="btn btn-custom-save" id="subject_save_btn" onkeyup=""><i class="fa fa-plus-square fa-lg"></i>&nbsp;Add</button>
                                            </span>
                                            <span  id="maker_updateDiv" class="">
                                                <button class="btn btn-warning hidden" id="subject_update_btn"><i class="fa fa-pencil fa-sm"></i>&nbsp;Update</button>                                                
                                            </span>
                                            <span  id="maker_reset_div" class="">
                                                <button class="btn btn-custom-light" id="subject_reset" onkeyup=""><i class="fa fa-refresh fa-lg"></i>&nbsp;Reset</button>
                                            </span>
                                        </div>
                                    </div>
                                    
                                </div>
                                <!-- FORM END -->
                            </div>
                            <div class="col-md-6">
                                <div class="panel" style="">
                                    <div class="panel-heading panel-custom">
                                        <h3 class="panel-title title-custom">Subjects</h3>

                                        <div class="pull-right">
                                            <span class="clickable filter" data-toggle="tooltip" title="Toggle table filter" data-container="body">
                                                <i class="glyphicon glyphicon-filter"></i>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="panel-body filterTableSearch">
                                        <input type="text" class="form-control" id="dev-table-filter" data-action="filter" data-filters=".maker_info_table"/>
                                    </div>
                                    <div class="scrollable" style="height: 65vh; overflow-y: auto">
                                        <table class="table table-bordered table-striped table-hover datable maker_info_table">
                                            <thead>
                                                <tr>
                                                    <th width="50%">Subject Name</th>
                                                    <th width="30%">Subject Code</th>
                                                    <th width="20%">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>                                                             
                                            </tbody>
                                        </table>
                                        <input type="hidden" id="system_id">
                                    </div>
                                </div>
                            </div><!-- end of col-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- load Java Script-->
        <?php require_once './include/systemFooter.php'; ?>
        <script type="text/javascript" src="controllers/controller_img_subject.js"></script>
        <script type="text/javascript">
            $(function () {
                pageProtect();
                checkurl();
                $('#logout').click(function () {
                    logout(); //Logout
                });
                
                load_subject_table(); //Load Subject Table
                
                $('#subject_save_btn').click(function () {
                    subject_save(); //subject save
                });
                
                $('#subject_update_btn').click(function () {
                    subject_update($(this).val()); //subject update
                });
                
                $('#subject_reset').click(function () {
                    reset_subject(); //reset form
                });
                
            });
            
            function set_focus_next(e, next_comp) {
                e.which = e.which || e.keyCode;
                if (e.which === 13) {
                    $(next_comp).focus();
                }
            }
            $('select').chosen({width: "100%"});
        </script>

    </body>

</html>

