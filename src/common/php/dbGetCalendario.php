<?php
    require_once("dbConnect.php");
    $json = file_get_contents('php://input');
    $data = json_decode($json);
    
    $queryResponse = mysqli_query($db, "SELECT data,viaSede,target FROM tgara");

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