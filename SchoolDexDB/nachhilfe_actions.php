<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = $_POST['schulname'];
    $table = "Nachhilfe";

    $action = $_POST['action'];

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    if('CREATE_TABLE' == $action){
        $sql = "CREATE TABLE IF NOT EXISTS $table (
            id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            fach TEXT NOT NULL,
            jahrgang TEXT NOT NULL,
            beschreibung TEXT NOT NULL,
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
        $sql = "SELECT id, fach, jahrgang, beschreibung, userId, benutzername, schulname FROM $table ORDER BY id DESC";
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

    if('ADD_Nachhilfe' == $action){
        $fach = $_POST['fach'];
        $jahrgang = $_POST['jahrgang'];
        $beschreibung = $_POST['beschreibung'];
        $userId = $_POST['userId'];
        $benutzername = $_POST['benutzername'];
        $schulname = $_POST['schulname'];
        $sql = "INSERT INTO $table (fach, jahrgang, beschreibung, userId, benutzername, schulname) VALUES('$fach', '$jahrgang', '$beschreibung', '$userId', '$benutzername', '$schulname')";
        $result = $conn->query($sql);
        echo 'success';
        return;
    }

    if('UPDATE_Nachhilfe' == $action){
        $id = $_POST['id'];
        $fach = $_POST['fach'];
        $jahrgang = $_POST['jahrgang'];
        $beschreibung = $_POST['beschreibung'];
        $userId = $_POST['userId'];
        $benutzername = $_POST['benutzername'];
        $schulname = $_POST['schulname'];
        $sql = "UPDATE $table SET fach = '$fach', jahrgang = '$jahrgang', beschreibung = '$beschreibung', userId = '$userId', benutzername = '$benutzername', schulname = '$schulname' WHERE id = $id";
        if ($conn->query($sql) === TRUE) {
            echo "success";
        } else {
            echo "error";
        }
        $conn->close();
        return;
    }

    if('DELETE_Nachhilfe' == $action){
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
