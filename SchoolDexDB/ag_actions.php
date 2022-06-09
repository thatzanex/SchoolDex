<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = $_POST['schulname'];
    $table = "Ags";

    $action = $_POST['action'];

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    if('GET_ALL' == $action){
        $dbdata = array();
        $sql = "SELECT id, thema, jahrgang, beschreibung, termin, schulname, userId FROM $table ORDER BY id DESC";
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

    if('ADD_Ags' == $action){
        $thema = $_POST['thema'];
        $jahrgang = $_POST['jahrgang'];
        $beschreibung = $_POST['beschreibung'];
        $termin = $_POST['termin'];
        $schulname = $_POST['schulname'];
        $userId = $_POST['userId'];
        $sql = "INSERT INTO $table (thema, jahrgang, beschreibung, termin, schulname, userId) VALUES('$thema', '$jahrgang', '$beschreibung', '$termin', '$schulname', '$userId')";
        $result = $conn->query($sql);
        echo 'success';
        return;
    }

    if('UPDATE_Ags' == $action){
        $id = $_POST['id'];
        $thema = $_POST['thema'];
        $jahrgang = $_POST['jahrgang'];
        $beschreibung = $_POST['beschreibung'];
        $termin = $_POST['termin'];
        $schulname = $_POST['schulname'];
        $userId = $_POST['userId'];
        $sql = "UPDATE $table SET thema = '$thema', jahrgang = '$jahrgang', beschreibung = '$beschreibung', termin = '$termin', schulname = '$schulname', userId = '$userId' WHERE id = $id";
        if ($conn->query($sql) === TRUE) {
            echo "success";
        } else {
            echo "error";
        }
        $conn->close();
        return;
    }

    if('DELETE_Ags' == $action){
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
