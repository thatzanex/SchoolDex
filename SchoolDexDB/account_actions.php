<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = $_POST['schulname'];
    $table = "Accounts";

    $action = $_POST['action'];

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    if('GET_ALL' == $action){
        $dbdata = array();
        $sql = "SELECT id, benutzername, passwort,  status1, schulname FROM $table ORDER BY id DESC";
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

    if('ADD_Account' == $action){
        $benutzername = $_POST['benutzername'];
        $passwort = $_POST['passwort'];
        $status = $_POST['status1'];
        $schulname = $_POST['schulname'];
        $sql = "INSERT INTO $table (benutzername, passwort, status1, schulname) VALUES('$benutzername', '$passwort', '$status', '$schulname')";
        $result = $conn->query($sql);
        echo 'success';
        return;
    }

    if('Check_Account' == $action){
        $benutzername = $_POST['benutzername'];
        $passwort = $_POST['passwort'];
        $schulname = $_POST['schulname'];
        $sql = "SELECT id, benutzername, passwort,  status1, schulname FROM $table ORDER BY id DESC";
        $result = $conn->query($sql);
        if ($result->num_rows > 0 && ) {
            while($row = $result->fetch_assoc()) {
                $dbdata[]=$row;
            }
            $list = json_encode($dbdata);
            echo $list;		 
        } else {
            echo "error";
        }
        return;
    }

//    if('UPDATE_Account' == $action){
//        $id = $_POST['id'];
//        $benutzername = $_POST['benutzername'];
//        $passwort = $_POST['passwort'];
//        $status = $_POST['$status'];
//        $sql = "UPDATE $table SET benutzername = '$benutzername', passwort = '$passwort', status = '$status' WHERE id = $id";
//        if ($conn->query($sql) === TRUE) {
//            echo "success";
//        } else {
//            echo "error";
//        }
//        $conn->close();
//        return;
//    }

//    if('DELETE_Account' == $action){
//        $id = $_POST['id'];
//        $sql = "DELETE FROM $table WHERE id = $id";
//        if ($conn->query($sql) === TRUE) {
//            echo "success";
//        } else {
//            echo "error";
//        }
//        $conn->close();
//        return;
//    }
    
?>
