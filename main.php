<?php 
    $servername = "localhost"; 
    $username = "root"; 
    $password = ""; 
  
    $conn = new mysqli($servername, $username, $password); 
    if ($conn->connect_error) { 
          die("Connection failed: " . $conn->connect_error); 
    } 
  
    $sql = "CREATE DATABASE vtmDB"; 
    if ($conn->query($sql) === TRUE) { 
          echo "Database has been created successfully"; 
    } else { 
          echo "Error creating database: " . $conn->error; 
    } 
    $conn->close(); 
?>
