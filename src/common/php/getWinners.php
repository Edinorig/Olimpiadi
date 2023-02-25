<?php
require_once("dbConnect.php");


$queryResponse = mysqli_query($db, "SELECT tsquadra.nome as squadra, tsquadra.id AS id_squadra, tfasegara.nome AS fase_gara, tgara.target AS luogo_gara FROM `tsquadra` 
        INNER JOIN tpartecipazionesquadra ON tsquadra.id = tpartecipazionesquadra.idSquadra
        INNER JOIN tgara ON tpartecipazionesquadra.idGara = tgara.id
        INNER JOIN tfasegara ON tgara.idFaseGara = tfasegara.id
        WHERE tfasegara.id = 4");



$json = array();
while ($row = mysqli_fetch_assoc($queryResponse)) {
    $team_id = $row["id_squadra"];


    //prendi il punteggio
    $teamQueryResponse = mysqli_query($db, "SELECT AVG(punteggio) AS punteggio FROM tpartecipazioneatleta
            INNER JOIN tatleta ON tatleta.id = tpartecipazioneatleta.idAtleta
            INNER JOIN tgara ON tgara.id = tpartecipazioneatleta.idGara
            WHERE tatleta.idSquadra = $team_id AND tgara.idFaseGara = 4;");

    $punteggio = mysqli_fetch_assoc($teamQueryResponse)['punteggio'];
    $row['punteggio'] = round($punteggio);
    $json[] = $row;
}

// Sort the array by the "punteggio" value in descending order
usort($json, function ($a, $b) {
    return $b['punteggio'] - $a['punteggio'];
});

// Get the element with the highest "punteggio"
$highest_punteggio_element = $json[0];

//ATLETA

$atletaResponse = mysqli_query($db, "SELECT tatleta.id, tatleta.nome, tatleta.cognome, MAX(tpartecipazioneatleta.punteggio) AS punteggio, tatleta.dataNascita AS data_nascita, tsquadra.nome AS squadra, tnazionalita.nome AS nazionalita, tistituto.nome AS istituto_provenienza
        FROM tatleta
        INNER JOIN tpartecipazioneatleta ON tatleta.id = tpartecipazioneatleta.idAtleta
        INNER JOIN tnazionalita ON tatleta.idNazionalita = tnazionalita.id
        INNER JOIN tistituto ON tistituto.id = tatleta.idIstitutoProvenienza
        INNER JOIN tsquadra ON tatleta.idSquadra = tsquadra.id
        INNER JOIN tgara ON tpartecipazioneatleta.idGara = tgara.id
        WHERE tgara.target = 'Internazionale'
        GROUP BY tatleta.id
        ORDER BY punteggio DESC
        LIMIT 1;");




$final = array();

$final['squadra'] = $highest_punteggio_element;
$final['atleta'] = mysqli_fetch_assoc($atletaResponse);

$response = array(
    'status' => 200,
    'data' => json_encode($final),
);


echo json_encode($response);
