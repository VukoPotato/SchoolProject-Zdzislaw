<?php
function zapytanie($db,$o_co){
    $result = $db->query ($o_co);
    $array= [];
    while($row = $result->fetch_assoc()){
        $array [] = $row;
    }
    return $array;
}

function getField($table,$fieldName){
    $result = [];
    foreach ($table as $array)
        $result[] = $array[$fieldName] ?? '';
    return $result;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Establish a database connection
    $db = new mysqli('localhost', 'root', '', 'commands');
    
    if ($db->connect_error) {
        die("Connection failed: " . $db->connect_error);
    }

    $user_message = strtolower($_POST['user_message']);    

    // Prepare and execute a query
    $id_table = zapytanie($db,"select id from champions where name = '$user_message'");
    $id = $id_table[0]['id'];
    $countersarray = zapytanie($db,"
    select c.name from counterchampions cs 
    left join champions c on (cs.idcountera = c.id)
    where cs.idchampiona = $id;"); 
    $counterstext = implode(", ", getField($countersarray, 'name'));

    $runesArray = zapytanie($db,"SELECT r.nazwa as runy, s.name as supporty FROM `champions` c left join runes r on (r.id=c.id_runes) left join supports s on (s.id=c.id_support) WHERE c.id=$id;");   

    $runes = implode(", ", getField($runesArray, 'runy') );
    $supports = implode(", ", getField($runesArray, 'supporty') );
        


    if (count($countersarray)) {
        // Format the response
        $chatbot_response = "Counters: $counterstext\n 
        Preferred Supports: $supports \n 
        Recommended Rune: $runes";
    } else {
        $chatbot_response = "Champion not found in the database.";
    }

    echo json_encode(['response' => $chatbot_response]);
}