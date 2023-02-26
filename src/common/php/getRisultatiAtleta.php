<?php
require_once("dbConnect.php");
$json = file_get_contents('php://input');
$data = json_decode($json);

$id_atleta = $data->id_atleta;

$queryResponse = mysqli_query($db, "SELECT tgara.id, tgara.target AS luogo_gara, tpartecipazioneatleta.punteggio AS punteggio_atleta, tgara.data AS data_gara, tfasegara.nome AS fase_gara  FROM tpartecipazioneatleta
INNER JOIN tatleta ON tpartecipazioneatleta.idAtleta = tatleta.id
INNER JOIN tgara ON tpartecipazioneatleta.idGara = tgara.id
INNER JOIN tfasegara ON tgara.idFaseGara = tfasegara.id
WHERE tatleta.id = $id_atleta;");

$json = array();
while ($row = mysqli_fetch_assoc($queryResponse)) {
    $json[] = $row;
}

$response = array(
    'status' => 200,
    'data' => json_encode($json),
);

echo json_encode($response);
