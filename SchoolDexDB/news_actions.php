<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = $_POST['schulname'];
    $table = "News";

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
            ueberschrift TEXT NOT NULL,
            inhalt TEXT NOT NULL,
            datum TEXT NOT NULL,
            schulname TEXT NOT NULL,
            userId TEXT NOT NULL
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
        $sql = "SELECT id, ueberschrift, inhalt, datum, schulname, userId FROM $table ORDER BY id DESC";
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

    if('ADD_News' == $action){
        $ueberschrift = $_POST['ueberschrift'];
        $inhalt = $_POST['inhalt'];
        $datum = $_POST['datum'];
        $schulname = $_POST['schulname'];
        $userId = $_POST['userId'];
        $sql = "INSERT INTO $table (ueberschrift, inhalt, datum, schulname, userId) VALUES('$ueberschrift', '$inhalt', '$datum', '$schulname', '$userId')";
        $result = $conn->query($sql);
        echo 'success';
        return;
    }

    if('UPDATE_News' == $action){
        $id = $_POST['id'];
        $ueberschrift = $_POST['ueberschrift'];
        $inhalt = $_POST['inhalt'];
        $datum = $_POST['datum'];
        $schulname = $_POST['schulname'];
        $userId = $_POST['userId'];
        $sql = "UPDATE $table SET ueberschrift = '$ueberschrift', inhalt = '$inhalt', datum = '$datum', schulname = '$schulname', userId = '$userId' WHERE id = $id";
        if ($conn->query($sql) === TRUE) {
            echo "success";
        } else {
            echo "error";
        }
        $conn->close();
        return;
    }

    if('DELETE_News' == $action){
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
