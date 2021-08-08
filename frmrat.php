<?php
session_start();
include_once './buslogic.php';
if(isset($_POST["b1"]))
{
    $pcod=$_REQUEST["pid"];
    $ucod=$_SESSION["ucod"];
    $rat=$_POST["r1"];
    $con=new clscon();
     $link=$con->db_connect();
              $res1= mysqli_query($link,"insert tbrat values(null,$ucod,$pcod,$rat)");
               
                if(mysqli_affected_rows($link))
                {
                header('location:index.php');
                }
                else
                {
                    header('location:index.php?msg=invalid');
                }
     }
?>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        // put your code here
        ?>
    </body>
</html>
