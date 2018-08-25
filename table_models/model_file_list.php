<?php

require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$dbClass = new database();
$system = new setting();

if (array_key_exists("table", $_POST)) {
    if ($_POST['table'] == 'load_image_file_list_table') {

        $records = $_POST['records'];
       
        $qry1 = "SELECT
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
                                                FROM `img_file` LIMIT $records";
        
//        echo $qry1;exit;
        $system->prepareSelectQueryForJSON($qry1);
        
        
    } else if ($_POST['table'] == 'load_file_paging_tbl') {

        $rec_per_page = 5; // enter the same value in 'view_filelist_tbl_paging'
        if (filter_var($_REQUEST["records"], FILTER_VALIDATE_INT)) {
            $rec_per_page = $_REQUEST["records"];
        }
        if (isset($_REQUEST["page"])) {
            $page = $_REQUEST["page"];
        } else {
            $page = 1;
        }
        $start_from = ($page - 1) * $rec_per_page;
        $query_p1 = "SELECT
                                                img_file.file_category,
                                                img_file.file_id,
                                                img_file.file_name,
                                                img_file.file_description,
                                                img_file.file_added_date,
                                                img_file.file_last_update_date,
                                                img_file.pdf_file,
                                                img_file.image_ai_id
                                                FROM `img_file` ";

        $query_p3 = " LIMIT $start_from, $rec_per_page";

//        echo $query_p1 . $query_p3; exit;
        $system->prepareSelectQueryForJSON($query_p1 . $query_p3);
    } else if ($_POST['table'] == 'view_filelist_tbl_paging') {
        $rec_per_page = 5;
        if (filter_var($_REQUEST["records"], FILTER_VALIDATE_INT)) {
            $rec_per_page = $_REQUEST["records"];
        }
        MainConfig::connectDB();
        $link = MainConfig::conDB();
      

        $query_p1 = "SELECT
                        img_file.file_category,
                        img_file.file_id,
                        img_file.file_name,
                        img_file.file_description,
                        img_file.file_added_date,
                        img_file.file_last_update_date,
                        img_file.pdf_file,
                        img_file.image_ai_id
                        FROM `img_file`";
        $result_1 = mysqli_query($link,$query_p1) or die(mysqli_error());
        $total_pages = 0;
        if (!empty($result_1)) {
            $data_arr = mysqli_fetch_array($result_1);
            $total_pages = ceil($data_arr[0] / $rec_per_page);
        }
       // echo json_encode(array("tot_pg" => 3));
//        echo json_encode(array("tot_pg" => $total_pages));
    } else if ($_POST['table'] == 'search_image_table') {

        // $records = $_POST['records'];
        $keyword_arr = $_POST['key_arr'];
        // column names are case sensitive
        $search_cols = array('file_category', 'file_id', 'file_name', 'file_description');
        $init_query = "SELECT
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
                                                FROM `img_file` ";

        $data = array();
        MainConfig::connectDB();
        $link = MainConfig::conDB();
      
        $result = mysqli_query($link,$init_query) or die(mysqli_error());
        $numrows = mysqli_num_rows($result);

        if ($numrows !== FALSE && $numrows < 10000) {
            while ($row = mysqli_fetch_assoc($result)) {

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
       // echo json_encode($data);
    }
}  