<?php

//print_r($_POST);exit;

require_once '../class/systemSetting.php';

if (isset($_POST['image_upload'])) {
//    echo $_POST['file_ai_id'];
    if (isset($_POST['file_ai_id'])) {

        $file_ai_id = intval($_POST['file_ai_id']);
        $file_category = $_POST['file_category'];


        MainConfig::connectDB();
        $file_code_res = mysql_query("SELECT img_file.file_category FROM `img_file` WHERE img_file.image_ai_id = '{$file_ai_id}'") or die(mysql_error());
        $image_file_data_arr = mysql_fetch_assoc($file_code_res);
        $img_dir = $image_file_data_arr['file_category'] . '_' . $file_ai_id;

        //If you face any errors, increase values of "post_max_size", "upload_max_filesize" and "memory_limit" as required in php.ini
        //Some Settings
        $BigImageMaxSize = 700; //Image Maximum height or width
        $ThumbPrefix = "S_"; //Normal thumb Prefix
        $Quality = 90;

        //ini_set('memory_limit', '-1'); // maximum memory!
        $file__ai_id = $_POST['file_ai_id'];
        $cat = $file_category;


        $img_res = mysql_query("SELECT img_file.file_id, img_file.image_ai_id,img_file.file_category  FROM `img_file` WHERE img_file.image_ai_id = '{$file__ai_id}'") or die(mysql_error());
        $image_file_data_arr = mysql_fetch_assoc($img_res);
        $img_dir = $image_file_data_arr['file_category'] . '_' . $image_file_data_arr['file_id']; //FILE DIRECTORY NAME SET HERE

        $file_no = $image_file_data_arr['file_id'];
        $uploaddir = "../image_library/" . $img_dir;
        $view_image_dir = "image_library/" . $img_dir . '/';
        $DestinationDirectory = $uploaddir . '/';

//      CREATING FOLDER AT IMAGE LIBRARY DIRECTORY
        if (!file_exists($uploaddir)) {
            $createFolder = mkdir($uploaddir, 755);
            if (!$createFolder) {
                $error_message = "Cannot create image derectory !";
                exit;
            }
//            echo "Folder successfully created at " . $createFolder;exit;
        }


//        print_r($_FILES);exit;
        foreach ($_FILES as $file) {

// some information about image we need later.

            $ImageName = $file['name'];
            $ImageSize = $file['size'];
            $TempSrc = $file['tmp_name'];
            $ImageType = $file['type'];

            $c = count($ImageName);
            $processImage = true;

            if (!isset($ImageName) || !is_uploaded_file($TempSrc)) {
                echo '<div class="error">Error occurred while trying to process <strong>' . $ImageName . '</strong>, may be file too big!</div>'; //output error
            } else {
                //Validate file + create image from uploaded file.
                switch (strtolower($ImageType)) {
                    case 'image/png':
                        $CreatedImage = imagecreatefrompng($TempSrc);
                        break;
                    case 'image/gif':
                        $CreatedImage = imagecreatefromgif($TempSrc);
                        break;
                    case 'image/jpeg':
                    case 'image/pjpeg':
                        $CreatedImage = imagecreatefromjpeg($TempSrc);
                        break;
                    default:
                        $processImage = false; //image format is not supported!
                }
                //get Image Size
                list($CurWidth, $CurHeight) = getimagesize($TempSrc);

                //Get file extension from Image name, this will be re-added after random name
                $ImageExt = substr($ImageName, strrpos($ImageName, '.'));
                $ImageExt = str_replace('.', '', $ImageExt);

                //Construct a new image name (with random number added) for our new image.
                $NewImageName = $file_no . '.' . $ImageExt;
                //$NewImageName = $RandomNumber . '_' . $file__ai_id . '.' . $ImageExt;
                //  echo $NewImageName;exit;
                //Set the Destination Image path with Random Name

                $large_name = $NewImageName;

                $DestRandImageName = $DestinationDirectory . $large_name; //path for Big Image
                //Resize image to our Specified Size by calling resizeImage function.
                if ($processImage) {
                    $process_large = resizeImage($CurWidth, $CurHeight, $BigImageMaxSize, $DestRandImageName, $CreatedImage, $Quality, $ImageType);
                    // $process_med = resizeImage($CurWidth, $CurHeight, $MedImageMaxSize, $med_DestRandImageName, $CreatedImage, $Quality, $ImageType[$i]);
                    if ($process_large) {
                        //Get New Image Size
                        list($ResizedWidth, $ResizedHeight) = getimagesize($DestRandImageName);

                        $img_directory = $view_image_dir;
                        $image_name = $img_dir . '/' . $NewImageName;
                        $img_path = $view_image_dir . $NewImageName;


                        MainConfig::connectDB();
                        $query = "INSERT INTO `img_image` ( `file_ai_id`,`file_id`,`image_title`,
	 `image_description`,`image_added_date`) VALUES ('{$file_ai_id}', '23','{$image_name}','test desc','test date');";

                        $query1 = "UPDATE `img_file` SET `image_file` = '{$image_name}' WHERE  `image_ai_id` = '{$file_ai_id}'";

                        // echo $query1;

                        $result = mysql_query($query);
                        $result1 = mysql_query($query1);
//                        
//                              MainConfig::closeDB();
                        echo json_encode(100); // Image Successfully Uploaded
                    } else {
                        echo json_encode(200); // IMAGE PROCESS ERROR;
                    }
                } else {
                    echo json_encode(600); // LARGE IMAGE FILE FOUND ERROR;
//                    echo '<div class="error">Error occurred while trying to process <strong>' . $ImageName . '</strong>! Please check if file is supported</div>'; //output error
                }
            }
        }
        MainConfig::closeDB();
    } else {
        echo json_encode(700); // NO IMAGE FILE ID FOUND ERROR
    }
}

// This function will proportionally resize image 
function resizeImage($CurWidth, $CurHeight, $MaxSize, $DestFolder, $SrcImage, $Quality, $ImageType) {
    //Check Image size is not 0
    if ($CurWidth <= 0 || $CurHeight <= 0) {
        return false;
    }

    //Construct a proportional size of new image
    $ImageScale = min($MaxSize / $CurWidth, $MaxSize / $CurHeight);
    $NewWidth = ceil($ImageScale * $CurWidth);
    $NewHeight = ceil($ImageScale * $CurHeight);

    if ($CurWidth < $NewWidth || $CurHeight < $NewHeight) {
        $NewWidth = $CurWidth;
        $NewHeight = $CurHeight;
    }
    $NewCanves = imagecreatetruecolor($NewWidth, $NewHeight);
    // Resize Image
    if (imagecopyresampled($NewCanves, $SrcImage, 0, 0, 0, 0, $NewWidth, $NewHeight, $CurWidth, $CurHeight)) {
        switch (strtolower($ImageType)) {
            case 'image/png':
                imagepng($NewCanves, $DestFolder);
                break;
            case 'image/gif':
                imagegif($NewCanves, $DestFolder);
                break;
            case 'image/jpeg':
            case 'image/pjpeg':
                imagejpeg($NewCanves, $DestFolder, $Quality);
                break;
            default:
                return false;
        }
        if (is_resource($NewCanves)) {
            imagedestroy($NewCanves);
        }
        return true;
    }
}

//This function corps image to create exact square images, no matter what its original size!
function cropImage($CurWidth, $CurHeight, $iSize, $DestFolder, $SrcImage, $Quality, $ImageType) {
    //Check Image size is not 0
    if ($CurWidth <= 0 || $CurHeight <= 0) {
        return false;
    }

    //abeautifulsite.net has excellent article about "Cropping an Image to Make Square"
    //http://www.abeautifulsite.net/blog/2009/08/cropping-an-image-to-make-square-thumbnails-in-php/
    if ($CurWidth > $CurHeight) {
        $y_offset = 0;
        $x_offset = ($CurWidth - $CurHeight) / 2;
        $square_size = $CurWidth - ($x_offset * 2);
    } else {
        $x_offset = 0;
        $y_offset = ($CurHeight - $CurWidth) / 2;
        $square_size = $CurHeight - ($y_offset * 2);
    }

    $NewCanves = imagecreatetruecolor($iSize, $iSize);
    if (imagecopyresampled($NewCanves, $SrcImage, 0, 0, $x_offset, $y_offset, $iSize, $iSize, $square_size, $square_size)) {
        switch (strtolower($ImageType)) {
            case 'image/png':
                imagepng($NewCanves, $DestFolder);
                break;
            case 'image/gif':
                imagegif($NewCanves, $DestFolder);
                break;
            case 'image/jpeg':
            case 'image/pjpeg':
                imagejpeg($NewCanves, $DestFolder, $Quality);
                break;
            default:
                return false;
        }
        if (is_resource($NewCanves)) {
            imagedestroy($NewCanves);
        }
        return true;
    }
}
