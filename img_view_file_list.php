<?php
require_once './include/MainConfig.php';
include './config/dbc.php';
?>
<!DOCTYPE html>

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
                            <span style="padding-right: 20px; font-size: 28px; font-weight: bold;background-color: #DDDDBB;border: 1px;border-radius: 5px ">View File List</span>
                            <span style="margin-left:10px; ">
                                <label class="control-label custom-label" style="font-size:18px;color:#2e863e">Category: </label>
                                <select id="category_combo" style="height: 26px;width:200px;font-weight: bold;font-size: 18px">
                                    <option value="PVT">PRIVATE</option>
                                    <option value="GOV">GOVERNMENT</option>
                                    <option value="REL">RELIGIOUS</option>
                                </select>         </span>
<!--                            <span style="margin-left:10px; ">
                                <label class="control-label custom-label" style="font-size:18px;color:#2e863e">Status: </label>
                                <select id="cmb_stock_status" style="height: 26px;width:100px;font-weight: bold;font-size: 18px"></select>
                            </span>-->
<!--                            <span class="">
                            -->                                <label class="control-label custom-label">records per page </label>
                            <select id="page_records">
                                <option value="10" selected>10</option>
                                <option value="15" >15</option>
                                <option value="20">20</option>
                                <option value="25">25</option>
                                <option value="50">50</option>
                            </select><!--
                        </span>-->
                            <span style="margin-left:40px; ">
                                <label class="control-label custom-label"  style="font-size:18px;color:#FF8811">Search by keywords: </label>
                                <input type="text" id="txt_search_key" class="custom-text1" data-toggle="tooltip" data-placement="bottom" title="Enter File Code" style="width: 250px" onkeyup="set_focus_next(event, '#co_short_name')">
                            </span>
                            <button class="btn btn-custom-light" id="btn_stock_search" ><i class="fa fa-search fa-sm"></i>&nbsp;</button>
                            <span class="pull-right">
                                <button class="btn btn-custom-save btn-sm" data-toggle="modal" data-target="#vh_actionsModal" id="btn_action"  data-placement="bottom" title="Perform actions on selected vehicles" >Actions</button>
                            </span>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <!-- MAIN CATEGORIES TABLE START-->
                                <div class="panel">
                                    <div class="scrollable" style="height:85vh; overflow-y: auto">
                                        <table class="table  table-data table-bordered datable searchable view_vh_table" border="1px">
                                            <thead>
                                                <tr>
                                                    <th>Action</th>
                                                    <th>File ID</th>
                                                    <th>Category</th>
                                                    <th>File Name</th>
                                                    <th>Description</th>
                                                    <th>Rack No</th>
                                                    <th>Row No</th>
                                                    <th>Box No</th>
                                                    <th>Added Date</th>
                                                    <th>Last Updated Date</th>
                                                    <th>PDF File</th>
                                                    <th>Image File</th>
                                                </tr>
                                            </thead>
                                            <tbody>                                                             
                                            </tbody>
                                        </table>
                                        <!--</div>-->
                                        <div>
                                            <div class="btn-group vh_view_pg" role="group" aria-label="...">
                                            </div>
                                        </div>
                                    </div>
                                    <!--MAIN CATEGORIES TABLE END-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Vehicle Actions Modal -->
            <div class="modal fade" id="vh_actionsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Select an action</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <div class="radio">
                                                    <label><input id="rbt_inv" type="radio" name="optradio">Create Pro-Forma Invoice</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="radio">
                                                    <label><input id="rbt_web" type="radio" name="optradio">Send to web</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="radio">
                                                    <label><input id="rbt_modification" type="radio" name="optradio">Add Modification entry</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="radio">
                                                    <label><input id="color" type="radio" name="optradio">Change Back Color</label>
                                                    <span id="clor_area" class="">&nbsp;<input type="text" id="selectedColor" class="color" disabled=""></span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="radio">
                                                    <label><input id="rbt_vehicle_clear" type="radio" name="optradio">Send to Clear</label>
                                                </div>
                                            </div>

                                            <div class="form-group hidden">
                                                <div class="radio">
                                                    <label><input id="rbt_group" type="radio" name="optradio">Add to group</label>
                                                    <select id="cmb_vh_group"></select>
                                                </div>
                                            </div>
                                            <div class="form-group hidden">
                                                <div class="radio">
                                                    <label><input id="rbt_sell" type="radio" name="optradio">Sell</label>
                                                </div>
                                            </div>
                                            <div class="form-group ">
                                                <div class="radio">
                                                    <label><input id="rbt_set_properties" type="radio" name="optradio">Change Properties</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-custom-save" id="continue_btn" onkeyup=""><i class="fa fa-plus-square fa-lg"></i>&nbsp;Continue</button>
                            <button type="button" class="btn btn-custom-light" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <?php // require_once './include/footerBar.php'; ?>
            <!-- load JavaScript-->

        </div>

        <?php require_once './include/systemFooter.php'; ?>
        <script type="text/javascript" src="js/jscolor/jscolor.js"></script>

        <script src="controllers/controller_image_table.js" type="text/javascript"></script>

        <script type="text/javascript">
                                    $(function () {
                                        // $('select').chosen({width: "100%"});
                                        pageProtect();
                                        checkurl();
                                        $(document).ready(function () {
                                            load_file_list_table();
                                        });

                                        $('#logout').click(function () {
                                            logout();
                                        });

                                        $('#btn_stock_search').click(function () {
                                            load_file_list_table();
                                        });

                                        $("#page_records").change(function () {
                                            load_file_list_table();
                                        });

                                        $('#txt_search_key').keyup(function () {

                                            var str = $(this).val();
                                            // isBlank(str);

                                            if ((str == "") || (str == null)) {
                                                load_file_list_table();
                                            } else {
                                                image_keyword_search_table();
                                            }
                                        }); //Keyword Search

                                    });

                                    $('.datepicker').datepicker({
                                        format: 'yyyy-mm-dd'
                                    });

                                    function set_focus_next(e, next_comp) {
                                        e.which = e.which || e.keyCode;
                                        if (e.which === 13 && $('#txt_search_key').val().length > 1) {
                                            vehicle_keyword_search();
                                        }
                                    }

                                    function isBlank(str) {
                                        return (!str || /^\s*$/.test(str));
                                    }

        </script>

    </body>

</html>

