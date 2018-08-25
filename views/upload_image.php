<html>
    
    <body>
        <noscript>
        <div align="center"><a href="index.php">Go Back To Upload Form</a></div><!-- If javascript is disabled -->
        </noscript>
        
    </body>
</html>
<?php
require_once '../class/systemSetting.php';
//If you face any errors, increase values of "post_max_size", "upload_max_filesize" and "memory_limit" as required in php.ini
//Some Settings
$ThumbSquareSize = 150; //Thumbnail 
$MedImageMaxSize = 500; //Image Maximum height or width
$BigImageMaxSize = 700; //Image Maximum height or width
$ThumbPrefix = "S_"; //Normal thumb Prefix
$Quality = 90;

//ini_set('memory_limit', '-1'); // maximum memory!
if (isset($_POST['vh_id'])) {
    $vehicle_id = $_POST['vh_id'];
    MainConfig::connectDB();
    
    $vh_code_res=mysql_query("SELECT vehicle.vh_code FROM vehicle WHERE vehicle.vh_id = '{$vehicle_id}'");
    
    $vh_data_arr = mysql_fetch_assoc($vh_code_res);
    $pdf_dir=$vh_data_arr['vh_code'].'_'.$vehicle_id;
    MainConfig::closeDB();
//  $uploaddir = "../vehicle_img/" . $vehicle_id;
    $uploaddir = "../vehicle_img/" . $pdf_dir;
    //
    $view_image_dir = "vehicle_img/" . $pdf_dir . '/';
    $DestinationDirectory = $uploaddir . '/';

//        echo "Creating folder at " . $veh_folder;
    if (!file_exists($uploaddir)) {
        $createFolder = mkdir($uploaddir,755);
        if (!$createFolder) {
            $error_message = "Cannot create image derectory !";
            exit;
        }
//            echo "Folder successfully created at " . $veh_folder;
    }
    foreach ($_FILES as $file) {
// some information about image we need later.
        $ImageName = $file['name'];
        $ImageSize = $file['size'];
        $TempSrc = $file['tmp_name'];
        $ImageType = $file['type'];


        if (is_array($ImageName)) {
            $c = count($ImageName);

            echo '<ul>';

            for ($i = 0; $i < $c; $i++){
                $processImage = true;
                $RandomNumber = rand(0, 9999999999);  // We need same random name for both files.

                if (!isset($ImageName[$i]) || !is_uploaded_file($TempSrc[$i])) {
                    echo '<div class="error">Error occurred while trying to process <strong>' . $ImageName[$i] . '</strong>, may be file too big!</div>'; //output error
                } else {
                    //Validate file + create image from uploaded file.
                    switch (strtolower($ImageType[$i])) {
                        case 'image/png':
                            $CreatedImage = imagecreatefrompng($TempSrc[$i]);
                            break;
                        case 'image/gif':
                            $CreatedImage = imagecreatefromgif($TempSrc[$i]);
                            break;
                        case 'image/jpeg':
                        case 'image/pjpeg':
                            $CreatedImage = imagecreatefromjpeg($TempSrc[$i]);
                            break;
                        default:
                            $processImage = false; //image format is not supported!
                    }
                    //get Image Size
                    list($CurWidth, $CurHeight) = getimagesize($TempSrc[$i]);

                    //Get file extension from Image name, this will be re-added after random name
                    $ImageExt = substr($ImageName[$i], strrpos($ImageName[$i], '.'));
                    $ImageExt = str_replace('.', '', $ImageExt);

                    //Construct a new image name (with random number added) for our new image.
                    $NewImageName = $RandomNumber . '_' . $vehicle_id . '.' . $ImageExt;

                    //Set the Destination Image path with Random Name
                    $thumb_name = $ThumbPrefix . $NewImageName;
                    $med_name = 'M_' . $NewImageName;
                    $large_name = 'L_' . $NewImageName;
                    $thumb_DestRandImageName = $DestinationDirectory . $thumb_name; //Thumb path
                    $med_DestRandImageName = $DestinationDirectory . $med_name; //path for Big Image
                    $DestRandImageName = $DestinationDirectory . $large_name; //path for Big Image
                    //Resize image to our Specified Size by calling resizeImage function.
                    if ($processImage) {
                        $process_large = resizeImage($CurWidth, $CurHeight, $BigImageMaxSize, $DestRandImageName, $CreatedImage, $Quality, $ImageType[$i]);
                        $process_med = resizeImage($CurWidth, $CurHeight, $MedImageMaxSize, $med_DestRandImageName, $CreatedImage, $Quality, $ImageType[$i]);
                        if ($process_large && $process_med) {
                            //Create a square Thumbnail right after, this time we are using cropImage() function
                            if (!cropImage($CurWidth, $CurHeight, $ThumbSquareSize, $thumb_DestRandImageName, $CreatedImage, $Quality, $ImageType[$i])) {
                                echo 'Error Creating thumbnail';
                            }
                            /*
                              At this point we have succesfully resized and created thumbnail image
                              We can render image to user's browser or store information in the database
                              For demo, we are going to output results on browser.
                             */

                            //Get New Image Size
                            list($ResizedWidth, $ResizedHeight) = getimagesize($DestRandImageName);

                            echo '<table width="100%" border="0" cellpadding="4" cellspacing="0">';
                            echo '<tr>';
                            echo '<td align="center"><a href="' . $view_image_dir . 'L_' . $NewImageName . '"><img src="' . $view_image_dir . $ThumbPrefix . $NewImageName . '" alt="Thumbnail" height="' . $ThumbSquareSize . '" width="' . $ThumbSquareSize . '"></a></td>';
                            echo '</tr>';
                            echo '</table>';
                            /*
                              // Insert info into database table!
                              mysql_query("INSERT INTO myImageTable (ImageName, ThumbName, ImgPath)
                              VALUES ($DestRandImageName, $thumb_DestRandImageName, 'uploads/')");
                             */
                            MainConfig::connectDB();
                            $updq = "INSERT INTO `vehicle_photo` ( `vh_id`, `p_title`, `p_desc`, `file_1`, `file_2`, "
                                    . "`file_3`, `date_added`, `order`, `p_visible`, `p_status` ) "
                                    . "VALUES ( '{$vehicle_id}', '', '', '{$large_name}', '{$med_name}', '{$thumb_name}', CURDATE(), 1, 0, 1 )";
                            mysql_query($updq);
                        } else {
                            echo 'error';
                        }
                    } else {
                        echo '<div class="error">Error occurred while trying to process <strong>' . $ImageName[$i] . '</strong>! Please check if file is supported</div>'; //output error
                    }
                }
            }
            echo '</ul>';
        }
    }
    MainConfig::closeDB();
} else {
    echo 'No Vehicle ID';
}

