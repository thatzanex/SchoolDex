<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = $_POST['schulname'];
    $table = "Blackboard";

    $action = $_POST['action'];

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    if('CREATE_TABLE' == $action){
        $sql = "CREATE TABLE IF NOT EXISTS $table (
            id INT(11) AUTO_INCREMENT PRIMARY KEY,
            ueberschrift TEXT NOT NULL,
            beschreibung TEXT NOT NULL,
            color TEXT NOT NULL,
            datum TEXT NOT NULL,
            userId TEXT NOT NULL,
            benutzername TEXT NOT NULL,
            schulname TEXT NOT NULL
            )";
        if ($conn->query($sql) === TRUE) {
            echo "success";
        } else {
            echo "error";
        }
        $conn->close();
        return;
    }

    if('GET_ALL' == $action){
        $dbdata = array();
        $sql = "SELECT id, ueberschrift, beschreibung, color, datum, userId, benutzername, schulname FROM $table ORDER BY id DESC";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $dbdata[]=$row;
            }
            $list = json_encode($dbdata);
            echo $list;		 
        } else {
            echo "error";
        }
        $conn->close();
        return;
    }

    if('ADD_blackboard' == $action){
        $ueberschrift = $_POST['ueberschrift'];
        $beschreibung = $_POST['beschreibung'];
        $color = $_POST['color'];
        $datum = $_POST['datum'];
        $userId = $_POST['userId'];
        $benutzername = $_POST['benutzername'];
        $schulname = $_POST['schulname'];
        $sql = "INSERT INTO $table (ueberschrift, beschreibung, color, datum, userId, benutzername, schulname) VALUES('$ueberschrift', '$beschreibung', '$color','$datum', '$userId', '$benutzername', '$schulname')";
        $result = $conn->query($sql);
        echo 'success';
        return;
    }

    if('UPDATE_blackboard' == $action){
        $id = $_POST['id'];
        $ueberschrift = $_POST['ueberschrift'];
        $beschreibung = $_POST['beschreibung'];
        $color = $_POST['color'];
        $datum = $_POST['datum'];
        $userId = $_POST['userId'];
        $benutzername = $_POST['benutzername'];
        $schulname = $_POST['schulname'];
        $sql = "UPDATE $table SET ueberschrift = '$ueberschrift', beschreibung = '$beschreibung', userId = '$userId', color = '$color', datum = '$datum', benutzername = '$benutzername', schulname = '$schulname' WHERE id = $id";
        if ($conn->query($sql) === TRUE) {
            echo "success";
        } else {
            echo "error";
        }
        $conn->close();
        return;
    }

    if('DELETE_blackboard' == $action){
        $id = $_POST['id'];
        $sql = "DELETE FROM $table WHERE id = $id";
        if ($conn->query($sql) === TRUE) {
            echo "success";
        } else {
            echo "error";
        }
        $conn->close();
        return;
    }
    
?>
