<?php
require_once './include/MainConfig.php';
include './config/dbc.php';
$image_file = '';
?>
<!DOCTYPE html>
<html>
    <!-- @Ashan -->
    <head>  
        <!--load CSS styles-->
        <?php require_once './include/systemHeader.php'; ?>  
        <link href="css/image_upload.css" rel="stylesheet" type="text/css" />
    </head>
    <body class="green-back">
        <div id="wrap">
            <input type="hidden" disabled="" id="v_supp_country" class="form-control custom-text1">
            <!--load navigation bar-->
            <?php require_once './include/navBar.php'; ?>
            <div class="container-fluid">               
                <div class="row">                                 
                    <div class="col-md-12">
                        <div class="page-header cutom-header">
                            <h3>File Image Registration</h3>
                        </div>
                        <div class="row">
                            <ul class="nav nav-tabs">
                                <li id="link_one" class="elementToggle active"><a href="#vh_info_tab" data-toggle="tab">Image Information</a></li>
                                <li id="link_two" class="elementToggle "><a href="#vh_photo_tab" data-toggle="tab">Photo Upload</a></li>
                            </ul>
                            <!-- FORM START -->
                            <div class="tab-content">
                                <div class="tab-pane active" id="vh_info_tab">
                                    <br/>
                                    <div class="col-md-4">

                                        <div class="form-horizontal">

                                            <input type="hidden" id="vh_reg_id" value="<?php
                                            if (isset($_REQUEST['img_ai_id'])) {
                                                echo $_REQUEST['img_ai_id'];
                                            }
                                            ?>">

                                            <input type="hidden" id="select_tab" class="cat" value="<?php
                                            if (isset($_REQUEST['cat'])) {
                                                echo $_REQUEST['cat'];
                                            }
                                            ?>">

                                            <?php
                                            echo '<div class="margin-top:100px;>';
                                            if (isset($_REQUEST['image_ai_id'])) {
                                                $img_ai_id = $_REQUEST['image_ai_id'];
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
                                                img_file.image_ai_id = '{$_REQUEST['img_ai_id']}'") or die(mysql_error());


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
                                                ?>

                                                <div class ="form-group" >
                                                    <label class = "col-lg-4 control-label custom-label">Subject:</label>
                                                    <div class = "col-lg-6">
                                                        <select class = "category_ComboBox" id = "category_ComboBox">
                                                        </select>     
                                                    </div>
                                                </div>

                                                <div class ="form-group" >
                                                    <label class = "col-lg-4 control-label custom-label" style="margin-top: 15px;">File No :</label>
                                                    <div class = "col-lg-6">
                                                        <input type = "text" id = "file_number" class = "form-control custom-text1" style = "text-transform:uppercase;margin-top:15px;">
                                                    </div>
                                                </div>

                                                <div class ="form-group hidden">
                                                    <label class = "col-lg-4 control-label custom-label hidden">Identification Code</label>
                                                    <div class = "col-lg-6">
                                                        <input type = "text" disabled = "" id = "v_code_num" class = "form-control custom-text1 hidden" value = "<?php
                                                        if (isset($_REQUEST['img_ai_id'])) {
                                                            echo $_REQUEST['img_ai_id'];
                                                        }
                                                        ?>">
                                                    </div>
                                                </div>

                                                <div class = "form-group">
                                                    <label class = "col-lg-4 control-label custom-label">File Name:</label>
                                                    <div class = "col-lg-6">
                                                        <input type = "text" id = "file_name" style = "text-transform:uppercase" class ="form-control custom-text1" onkeyup = "set_focus_next(event, '#description')">
                                                    </div>
                                                </div>
                                                <div class = "form-group">
                                                    <label class = "col-lg-4 control-label custom-label">Rack No:</label>
                                                    <div class = "col-lg-6">
                                                        <input type = "text" id = "rack_no" style = "text-transform:uppercase" class = "form-control custom-text1" onkeyup = "set_focus_next(event, '#row_no')">
                                                    </div>
                                                </div>

                                                <div class = "form-group">
                                                    <label class = "col-lg-4 control-label custom-label">Row No:</label>
                                                    <div class = "col-lg-6">
                                                        <input type = "text" id = "row_no" style = "text-transform:uppercase" class = "form-control custom-text1" onkeyup = "set_focus_next(event, '#box_no')">
                                                    </div>
                                                </div>

                                                <div class = "form-group">
                                                    <label class = "col-lg-4 control-label custom-label">Box No:</label>
                                                    <div class = "col-lg-6">
                                                        <input type = "text" id = "box_no" style = "text-transform:uppercase" class = "form-control custom-text1" onkeyup = "set_focus_next(event, '#file_name')">
                                                    </div>
                                                </div>

                                                <div class = "form-group">
                                                    <label class = "col-lg-4 control-label custom-label">Description:</label>
                                                    <div class = "col-lg-6">
                                                        <textarea id = "description" class = "form-control custom-text1" > </textarea>
                                                    </div>
                                                </div>

                                                <div class = "form-group" style = "margin-left:75px;">
                                                    <div class = "col-lg-offset-2 col-lg-10">
                                                        <span id = "co_reset_div" class = "">
                                                            <button class = "btn btn-lg btn-info" id = "v_reset" onkeyup = ""><i class = "fa fa-refresh fa-lg"></i>&nbsp;Reset</button>
                                                        </span>
                                                        <span id = "co_updateDiv" class = "">
                                                            <button class = "btn btn-lg btn-warning " id = "v_update_btn"><i class = "fa fa-pencil fa-sm"></i>&nbsp;Update</button>
                                                        </span>
                                                        <span id = "co_save_div" class = "" style = "margin-left:30px;">
                                                            <button class = "btn btn-lg btn-success" id = "v_save_btn" ><i class = "fa fa-plus-square fa-lg"></i>&nbsp;Complete</button>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>

                                        </div><!--end of col-->

                                        <div class = "col-md-4">

                                            <div class = "form-horizontal">

                                                <div id = "vehicle_img_container" class = "container-fluid">
                                                    <div class = "row">
                                                        <div class = "col-md-12 col-lg-12">
                                                            <div class="col-md-6">
                                                                <?php
                                                                if (!empty($image_file)) {
                                                                    echo '<button data-toggle="modal" data-target="#image_view">';
                                                                    echo '<img src = "./image_library/' . $image_file . '"  width = "150" height = "150" />';
                                                                    echo '</button>';
                                                                } else {
                                                                    // echo '<button data-toggle="modal" data-target="#image_view">';
                                                                    echo '<img src="images/no_image_available.png" width="150" height="150">';
                                                                    // echo '</button>';
                                                                }
                                                                ?>
                                                            </div>
                                                            <div class="col-md-6">

                                                                <?php
                                                                if (!empty($pdf_file)) {
                                                                    echo '<button data-toggle="modal" data-target="#pdf_view">';
                                                                    //  echo '<embed src = "./image_library/' . $pdf_file . '" type = "application/pdf" width = "150" height = "150" /> ';
                                                                    echo 'Click to View PDF';
                                                                    echo '</button>';
                                                                } else {
                                                                    //   echo '<button data-toggle="modal" data-target="#pdf_view">';
                                                                    echo '<img src="images/pdf_unavailable.png" width="150" height="150">';
                                                                    //   echo '</button>';
                                                                }
                                                                ?>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                                <!--END OF ROW-->

                                            </div>

                                        </div>

                                        <div class = "col-md-4">

                                            <div class="form-horizontal" id="uploaderform">
                                                <!--<form action = "views/file_image_upload.php" method = "post" enctype = "multipart/form-data" name = "UploadForm" id = "UploadForm"> -->
                                                <h1>Select Images of the File</h1>
                                                <div id = "AddFileInputBox"><input id = "fileInputBox" style = "margin-bottom: 5px;" type = "file" multiple = "multiple" name = "file[]"/></div>

                                                <div>
                                                    <input name = "vh_id" type = "hidden" id = "vh_id" value = "<?php
                                                    if (isset($_GET['img_ai_id'])) {
                                                        echo $_GET['img_ai_id'];
                                                    }
                                                    ?>" />
                                                    <input name = "cat" type = "hidden" id = "img_cat" value = "<?php
                                                    if (isset($_GET['cat'])) {
                                                        echo $_GET['cat'];
                                                    }
                                                    ?>" />

                                                </div>

                                                <button type = "submit" class = "btn btn-custom-save" id = "btn_image_upload"><i class = "fa fa-picture-o"></i> &nbsp;
                                                    Upload</button>
                                                <a href = "img_reg.php" class = "btn btn-custom-light" id = "vh_back">Back</a>
                                                <div id = "progressbox"><div id = "progressbar"></div ><div id = "statustxt">0%</div ></div>
                                                <!--</form> -->

                                                <div>
                                                    <h1>Select PDF file of the File</h1>
                                                    <div id = "AddFileInputBox"><input id = "pdf_file" style = "margin-bottom: 5px;" type = "file" name = "file[]"/></div>

                                                    <input name = "vh_id" type = "hidden" id = "vh_id" value = "<?php
                                                    if (isset($_GET['img_ai_id'])) {
                                                        echo $_GET['img_ai_id'];
                                                    }
                                                    ?>" />

                                                    <button class = "btn btn-custom-save" id = "btn_pdf_upload"><i class = "fa fa-file-text-o"></i>&nbsp;
                                                        Upload</button>
                                                    <a href = "vehicle_reg.php" class = "btn btn-custom-light" id = "vh_back">Back</a>
                                                    <div id = "progressbox"><div id = "progressbar"></div ><div id = "statustxt">0%</div ></div>
                                                </div>
                                            </div>
                                            <!--END OF COLUMN-->

                                            <!--<div id = "uploadResults">
                                            <div align = "center" style = "margin:20px;"><a href = "#" id = "ShowForm">Toggle Form</a></div>
                                            <div id = "output"></div>
                                            </div>
                                            </div>
                                            </div> -->
                                            <!--</form> -->
                                        </div>
                                    </div>



                                    <div class ="tab-pane" id ="vh_photo_tab"> <!--PHOTO TAB-->
                                        <div class = "row">
                                            <br/>
                                            <div class = "col-md-5">

                                                <div class = "form-group">
                                                    <div class = "col-md-4">
                                                        <label class = "control-label custom-label">Select File : </label>
                                                    </div>
                                                    <div class = "col-md-6">
                                                        <select id = "vehi_id" class = "file_code_combo"></select>
                                                    </div>
                                                </div>
                                                <div class = "form-group">
                                                    <div class = "col-md-offset-4 col-md-6">
                                                        <input type = "text" id = "vh_info" class = "form-control custom-text1" readonly = "" onkeyup = "">
                                                    </div>
                                                </div>
                                                <div class = "form-group">
                                                    <div class = "col-md-offset-4 col-md-6">
                                                        <button type = "button" id = "load_images" class = "btn btn-custom-save" style = "margin-top: 5px;"><i class = "fa fa-picture-o"></i> Load Uploaded Images</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--ENF OF COL-->
                                        </div>
                                        <!--END OF ROW-->
                                    </div>
                                    <!--END OF TAB-->
                                </div>
                                <!--END OF TAB SECTION-->

                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--IMAGE VIEW MODAL -->
        <div class = "modal fade" id = "image_view" tabindex = "-1" role = "dialog" aria-labelledby = "myModalLabel" aria-hidden = "true">
            <div class = "modal-dialog">
                <div class = "modal-content">
                    <div class = "modal-header">
                        <button type = "button" class = "close" data-dismiss = "modal" aria-label = "Close"><span aria-hidden = "true">&times;
                            </span></button>
                        <h4 class = "modal-title" id = "myModalLabel">VIEW IMAGE</h4>
                    </div>
                    <div class = "modal-body">
                        <div class = "container-fluid">
                            <div class = "row">
                                <input type="hidden" id="img_url" value="<?php echo $image_file ?>">
                                <img alt = "image" src = "./image_library/<?php echo $image_file; ?>" width = "550" height = "600" />
                            </div>
                        </div>
                    </div>
                    <div class = "modal-footer">
                        <button id="open_image">Print Image</button>
                    </div>
                </div>
            </div>
        </div>

        <!--PDF VIEW MODAL -->
        <div class = "modal fade" id = "pdf_view" tabindex = "-1" role = "dialog" aria-labelledby = "myModalLabel" aria-hidden = "true">
            <div class = "modal-dialog">
                <div class = "modal-content">
                    <div class = "modal-header">
                        <button type = "button" class = "close" data-dismiss = "modal" aria-label = "Close"><span aria-hidden = "true">&times;
                            </span></button>
                        <h4 class = "modal-title" id = "myModalLabel">VIEW PDF FILE</h4>
                    </div>
                    <div class = "modal-body">
                        <div class = "container-fluid">
                            <div class = "row">
                                <input type="hidden" id="pdf_url" value="<?php echo $pdf_file ?>">
                                <embed src = "./image_library/<?php echo $pdf_file; ?>" type = "application/pdf" width="550" height = "600" />
                            </div>
                        </div>
                    </div>
                    <div class = "modal-footer">
                        <button id="open_pdf">Print PDF</button>
                    </div>
                </div>
            </div>
        </div>

        <!--load JavaScript-->
        <?php require_once './include/systemFooter.php';
        ?>
        <script type="text/javascript" src="js/jquery.form.js"></script>
        <script type="text/javascript" src="controllers/controller_image_table.js"></script>

        <script type="text/javascript">
                                                            $(function () {
                                                                pageProtect();
                                                                checkurl();
                                                                show_action();
                                                                $('.datepicker').datepicker({
                                                                    format: 'yyyy-mm-dd',
                                                                    autoclose: true
                                                                });
                                                                $('select').chosen({
                                                                    disable_search_threshold: 5,
                                                                    width: "100%"});

                                                                $('#logout').click(function () {
                                                                    logout();
                                                                });

                                                                file_subject_combo();
                                                                var file_id = $('#vh_reg_id').val(); // FILE AI ID 

                                                                if ((parseInt($('#vh_reg_id').val()) != undefined) || ($('#vh_reg_id').val() != "")) {
                                                                    var file_id = $('#vh_reg_id').val()
                                                                    load_file_details();
                                                                } // LOAD FORM DATA


                                                                $('#v_save_btn').click(function () {
                                                                    save_document_details();
                                                                });//SAVE FORM DATA

                                                                $('#v_update_btn').click(function () {
                                                                    var file_ai_id = $('#vh_reg_id').val()
                                                                    update_document_details(file_ai_id);
                                                                });//UPDATE FORM DATA

                                                                $('#v_reset').click(function () {
                                                                    clear_file_data();
                                                                });//CLEAR FORM

                                                                $('#btn_image_upload').click(function (e) {
                                                                    image_file_upload();
                                                                });//UPLOAD IMAGE 
                                                                $('#btn_pdf_upload').click(function (e) {
                                                                    pdf_file_uplaod();
                                                                });//UPLOAD PDF
                                                                
                                                                $('#open_image').click(function (e) {
                                                                    var url = $('#img_url').val();
                                                                    printimage("./image_library/" + url);
                                                                });//OPEN IMAGE IN NEW TAB TO PRINT
                                                                
                                                                $('#open_pdf').click(function (e) {
                                                                    var url = $('#pdf_url').val();
                                                                    printimage("./image_library/" + url);
                                                                });//OPEN PDF IN NEW TAB TO PRINT


                                                       
                                                                
                                                                var msnry = $('#vehicle_img_container').masonry({
                                                                    itemSelector: '.item'
                                                                }).masonry()

                                                            });



                                                            function load_file_details() {
                                                                var file_ai_id = $('#vh_reg_id').val();
                                                                var cat = $('#cat').val();
                                                                $.post("models/model_image_file.php", {action: 'load_image_file_data', image_ai_id: file_ai_id}, function (e) {
                                                                    if (e === undefined || e === null || e.length === 0) {
                                                                    } else {

                                                                        $.each(e, function (index, qData) {
                                                                            $('#category_ComboBox select').val(qData.file_category);
                                                                            $('#file_number').val(qData.file_id);
                                                                            $('#rack_no').val(qData.rack_no);
                                                                            $('#row_no').val(qData.row_no);
                                                                            $('#box_no').val(qData.box_no);
                                                                            $('#file_name').val(qData.file_name);
                                                                            $('#description').val(qData.file_description);
                                                                        });
                                                                    }
                                                                }, 'json');
                                                            } //LOAD FILE DETAILS FORM

                                                            function clear_file_data() {
                                                                $('#v_code_num').val(""),
                                                                        $('#rack_no').val("");
                                                                $('#row_no').val("");
                                                                $('#box_no').val("");
                                                                $('#category_ComboBox').val("");
                                                                $('#file_name').val("");
                                                                $('#description').val("");
                                                                $('#file_number').val("");
                                                            }//CLEAR FORM DATA

                                                            function show_action() {
                                                                var file_id = $('#vh_reg_id').val()
                                                                if (parseInt(file_id) > 0) {
                                                                    $('#co_save_div').addClass('hidden');
                                                                    $('#co_updateDiv').removeClass('hidden');

                                                                } else {
                                                                    $('#co_updateDiv').addClass('hidden');
                                                                    $('#co_save_div').removeClass('hidden');

                                                                }
                                                            }//SHOW 

                                                            function set_focus_next(e, next_comp) {
                                                                e.which = e.which || e.keyCode;
                                                                if (e.which === 13) {
                                                                    $(next_comp).focus();
                                                                }
                                                            }
                                                            function showTabTwo(callback) {
                                                                $('#link_one').removeClass('active');
                                                                $('#link_two').addClass('active');
                                                                $('#vh_info_tab').removeClass('active');
                                                                $('#vh_photo_tab').addClass('active');
                                                                if (typeof callback === 'function') {
                                                                    callback();
                                                                }
                                                            }



                                                            function printimage(URL) {
                                                                var W = window.open(URL);
                                                                W.window.print();
                                                            }
        </script>
    </body>

</html>

