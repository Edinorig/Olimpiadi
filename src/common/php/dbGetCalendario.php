<?php
require_once("dbConnect.php");
$json = file_get_contents('php://input');
$data = json_decode($json);

$queryResponse = mysqli_query($db, "SELECT tgara.id, data ,viaSede, target AS luogo_gara, tfasegara.nome AS fase_gara FROM  tgara 
INNER JOIN tfasegara ON tfasegara.id = tgara.idFaseGara
ORDER BY data ASC;");
$json = array();
while ($row = mysqli_fetch_assoc($queryResponse)) {
    $json[] = $row;
}

$response = array(
    'status' => 200,
    'data' => json_encode($json),
);

echo json_encode($response);
