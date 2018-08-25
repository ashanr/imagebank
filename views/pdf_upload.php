<?php

require_once '../class/systemSetting.php';

if (isset($_POST['pdf_upload'])) {

    if ((!isset($_POST['file_category'])) || empty($_POST['file_category'])) {
        echo json_encode(600);
        exit;
    }

    if (isset($_POST['file_id'])) {

        $file_id = intval($_POST['file_id']);
        MainConfig::connectDB();
        $file_code_res = mysql_query("SELECT img_file.file_category FROM `img_file` WHERE img_file.image_ai_id = '{$file_id}'");
        $vh_data_arr = mysql_fetch_assoc($file_code_res);
        $subject = $_POST['file_category'];
        $pdf_dir = $subject . '_' . $file_id;

        MainConfig::closeDB();
        $uploaddir = "../image_library/" . $pdf_dir;

        if ($_FILES['file']['error'] !== UPLOAD_ERR_OK) {
            echo json_encode($_FILES['file']['error']);
            exit();
        }
        /** The proper method for validating uploads is to use server-side mime-type determination, e.g. via fileinfo
         *  This extension is enabled by default as of PHP 5.3.0
         *  Windows users must include the bundled php_fileinfo.dll DLL file in php.ini to enable this extension.
         */
//        $finfo = finfo_open(FILEINFO_MIME_TYPE);
//        $mime = finfo_file($finfo, $_FILES['file']['tmp_name']);
        $mime = $_FILES['file']['type'];
//        echo $mime;
        $ok = false;
        if ($mime == 'application/pdf') {
            $filename = $file_id . ".pdf";
            $save_path = $pdf_dir.'/'.$filename;
            $uploadfile = $uploaddir . "/" . $filename;
            if (!file_exists($uploaddir)) {
                $createFolder = mkdir($uploaddir, 755);
                if (!$createFolder) {
                    $error_message = "Cannot create directory !";
                    echo $error_message;
                    exit;
                }
            }
            $upload_ok = move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile);
            if ($upload_ok) {
                MainConfig::connectDB();
                $updq = "UPDATE `img_file` SET `pdf_file` = '{$save_path}' WHERE (`file_id` = '{$_POST['file_id']}');";
         
                $result = mysql_query($updq);
                MainConfig::closeDB();

                if ($result) {
                    echo json_encode(100);
                } else {
                    echo json_encode(900);
                }
            }
        } else {
            echo json_encode(800);
        }
    }
} elseif (isset($_POST['pdf_file_upload'])) {
    //  DEVELOPMENT ONGOING
    if (isset($_POST['vh_id'])) {

        $vehicle_id = intval($_POST['vh_id']);
        MainConfig::connectDB();
        $vh_code_res = mysql_query("SELECT vehicle.vh_code FROM vehicle WHERE vehicle.vh_id = '{$vehicle_id}'");
        $vh_data_arr = mysql_fetch_assoc($vh_code_res);
        $pdf_dir = $vh_data_arr['vh_code'] . '_' . $vehicle_id;
        MainConfig::closeDB();
        $uploaddir = "../vehicle_img/" . $pdf_dir;

        if ($_FILES['file']['error'] !== UPLOAD_ERR_OK) {
            echo json_encode($_FILES['file']['error']);
            exit();
        }
        /** The proper method for validating uploads is to use server-side mime-type determination, e.g. via fileinfo
         *  This extension is enabled by default as of PHP 5.3.0
         *  Windows users must include the bundled php_fileinfo.dll DLL file in php.ini to enable this extension.
         */
//        $finfo = finfo_open(FILEINFO_MIME_TYPE);
//        $mime = finfo_file($finfo, $_FILES['file']['tmp_name']);
        $mime = $_FILES['file']['type'];

        $ok = false;
        if ($mime == 'application/pdf') {
            $filename = $vehicle_id . ".pdf";
            $uploadfile = $uploaddir . "/" . $filename;
            if (!file_exists($uploaddir)) {
                $createFolder = mkdir($uploaddir, 755);
                if (!$createFolder) {
                    $error_message = "Cannot create directory !";
                    echo $error_message;
                    exit;
                }
//            echo "Folder successfully created at " . $veh_folder;
            }
            $upload_ok = move_uploaded_file($_FILES['file']['tmp_name'], $uploadfile);
            if ($upload_ok) {
                MainConfig::connectDB();
                $updq = "UPDATE `vehicle` SET `pdf_file` = '{$filename}' WHERE (`vh_id` = '{$_POST['vh_id']}');";
                mysql_query($updq);
                echo json_encode(100);
                MainConfig::closeDB();
            } else {
                echo json_encode(900);
            }
        } else {
            echo json_encode(800);
        }
    }
}

    