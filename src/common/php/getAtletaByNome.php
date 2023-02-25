<?php
require_once("dbConnect.php");
$json = file_get_contents('php://input');
$data = json_decode($json);

$nome_atleta = $data->nome_atleta;

$queryResponse = mysqli_query($db, "SELECT tatleta.id, tatleta.nome, cognome, dataNascita, tsquadra.nome AS nome_squadra, tnazionalita.nome AS nazionalita, tistituto.nome AS istituto_provenienza FROM tatleta 
INNER JOIN tsquadra ON tsquadra.id = tatleta.idSquadra
INNER JOIN tnazionalita ON tnazionalita.id = tatleta.idNazionalita
INNER JOIN tistituto ON tistituto.id = tatleta.idIstitutoProvenienza
WHERE tatleta.nome LIKE '%$nome_atleta%';");

$json = array();
while ($row = mysqli_fetch_assoc($queryResponse)) {
    $json[] = $row;
}

$response = array(
    'status' => 200,
    'data' => json_encode($json),
);

echo json_encode($response);
