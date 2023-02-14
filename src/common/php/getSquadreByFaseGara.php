<?php
    require_once("dbConnect.php");
    $json = file_get_contents('php://input');
    $data = json_decode($json);
    
    $id_fase = $data->id_fase;
    
    $queryResponse = mysqli_query($db, "SELECT tsquadra.nome as squadra, tsquadra.id AS id_squadra, tfasegara.nome AS fase_gara, tgara.target AS luogo_gara FROM `tsquadra` 
        INNER JOIN tpartecipazionesquadra ON tsquadra.id = tpartecipazionesquadra.idSquadra
        INNER JOIN tgara ON tpartecipazionesquadra.idGara = tgara.id
        INNER JOIN tfasegara ON tgara.idFaseGara = tfasegara.id
        WHERE tfasegara.id = $id_fase");



    $json = array();
    while($row = mysqli_fetch_assoc($queryResponse)){
        $team_id = $row["id_squadra"];


        $teamQueryResponse = mysqli_query($db, "SELECT AVG(punteggio) AS punteggio FROM tpartecipazioneatleta
            INNER JOIN tatleta ON tatleta.id = tpartecipazioneatleta.idAtleta
            INNER JOIN tgara ON tgara.id = tpartecipazioneatleta.idGara
            WHERE tatleta.idSquadra = $team_id AND tgara.idFaseGara = $id_fase;");

        $punteggio = mysqli_fetch_assoc($teamQueryResponse)['punteggio'];

        $row['punteggio'] = round($punteggio);

        $json[] = $row;
     }

    $response = array (
        'status' => 200,
        'data' => json_encode($json),
    );

    echo json_encode($response);
?>