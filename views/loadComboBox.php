<?php

require_once '../config/dbc.php';
require_once '../class/database.php';
require_once '../class/systemSetting.php';
$dbClass = new database();
$system = new setting();

if (array_key_exists("comboBox", $_POST)) {
    if ($_POST['comboBox'] == 'makers') {
        $system->prepareSelectQueryForJSON("SELECT
        maker.maker_id,
        maker.maker_name
        FROM maker
        WHERE maker.maker_status = '1'");
    } else if ($_POST['comboBox'] == 'select_in_com') {
        $system->prepareSelectQueryForJSON("SELECT
insurance_company.ln_id,
insurance_company.ln_name
FROM
insurance_company
");
    } else if ($_POST['comboBox'] == 'file_code_combo') {
        $system->prepareSelectQueryForJSON("SELECT
img_file.image_ai_id,
img_file.file_id
FROM
img_file
");
    } else if ($_POST['comboBox'] == 'file_subject_combo') {
        $system->prepareSelectQueryForJSON("SELECT
img_subject.subject_id,
img_subject.subject_name,
img_subject.subject_code
FROM
img_subject
WHERE
img_subject.`subject_status` = '1'
");
    }
}
