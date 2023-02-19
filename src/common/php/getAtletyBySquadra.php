<?php
    require_once("dbConnect.php");
    $json = file_get_contents('php://input');
    $data = json_decode($json);
    
    $id_squadra = $data->id_squadra;
    
    $queryResponse = mysqli_query($db, "SELECT * FROM tatleta WHERE tatleta.idSquadra = $id_squadra");



    $json = array();
    while($row = mysqli_fetch_assoc($queryResponse)){
        $json[] = $row;
     }

    $response = array (
        'status' => 200,
        'data' => json_encode($json),
    );

    echo json_encode($response);
?>