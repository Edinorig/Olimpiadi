<?php
require_once("dbConnect.php");
$json = file_get_contents('php://input');
$data = json_decode($json);


$queryResponse = mysqli_query($db, "SELECT * FROM tistituto");

$json = array();
while ($row = mysqli_fetch_assoc($queryResponse)) {
    $school_id = $row["id"];


    //prendi il punteggio medio
    $teamQueryResponse = mysqli_query($db, "SELECT AVG(punteggio) AS punteggio FROM tpartecipazioneatleta 
    INNER JOIN tatleta ON tpartecipazioneatleta.idAtleta = tatleta.id
    INNER JOIN tgara ON tpartecipazioneatleta.idGara = tgara.id
    WHERE tatleta.idIstitutoProvenienza = $school_id AND tgara.idFaseGara = 1;");

    $punteggio = mysqli_fetch_assoc($teamQueryResponse)['punteggio'];
    $row['punteggio_medio_fase_scolastica'] = round($punteggio);

    $json[] = $row;
}

$response = array(
    'status' => 200,
    'data' => json_encode($json),
);

echo json_encode($response);
