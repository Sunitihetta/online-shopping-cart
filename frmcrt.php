<?php
session_start();
include_once 'buslogic.php';
if(isset($_POST["btnsub"]))
{
    $_SESSION["add"]=$_POST["txtadd"];
    $_SESSION["phn"]=$_POST["txtphn"];
    if(isset($_SESSION["ucod"]))
    {
        header("location:frmorddet.php");
    }
 else
     {
        header("location:frmlogin.php");   
    }
}
if(isset($_REQUEST["pid"])&& $_REQUEST["action"]=='add')
{
    if(isset($_SESSION["cart"])&& $_SESSION["cart"]!="")
    {
       $_SESSION["cart"].=','.$_REQUEST["pid"];//101,102,103 
    }
    else
    {
       $_SESSION["cart"]=$_REQUEST["pid"]; //101
    }
}
if(isset($_REQUEST["pid"])&&$_REQUEST["action"]=='delete')
{
    if(isset($_SESSION["cart"]))
    {
        if($_SESSION["cart"]!="")
        {
        $str=$_SESSION["cart"];
        $arr= explode(',', $str);
        $str1="";
        foreach ($arr as $r)
        {
            if($r!=$_REQUEST["pid"])
            {
                if($str1!="")
                {
                 $str1.=','.$r;      
                }
                else 
                {
              $str1=$r;
            }
            }
        }
        if(isset($str1))
        {
        $_SESSION["cart"]=$str1;
    }
    else
    {
        $_SESSION["cart"]="";
    }
}
}
}
if(isset($_REQUEST["action"])&& $_REQUEST["action"]=='update')
{
    foreach($_POST as $key=>$value)
    {
       if(strstr($key,'qty'))
       {
           $pid= str_replace('qty','', $key);
         //  echo $pid;
           for($i=0;$i<$value;$i++)
           {
               if(isset($newcart))
               {
                   $newcart.=','.$pid;
               }
               else
               {
                   $newcart=$pid;
               }
             //  echo $newcart;
               $_SESSION["cart"]=$newcart;       
       }
    }
}
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Karl - Fashion Ecommerce Template | Home</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="style.css">

    <!-- Responsive CSS -->
    <link href="css/responsive.css" rel="stylesheet">

</head>

<body>

    <div id="wrapper">

        <!-- ****** Header Area Start ****** -->
        <header class="header_area">
            <!-- Top Header Area Start -->
            <div class="top_header_area">
                <div class="container h-100">
                    <div class="row h-100 align-items-center justify-content-end">

                        <div class="col-12 col-lg-7">
                            <div class="top_single_area d-flex align-items-center">
                                <!-- Logo Area -->
                                <div class="logo">
                                    <a href="#"><img src="img/core-img/logo.jpeg" height="180" width="200" ></a>
                                </div>
                                <!-- Cart & Menu Area -->
                                <div class="header-cart-menu d-flex align-items-center ml-auto">
                                    <!-- Cart Area -->
                                    <div class="cart">
                                       
                                    </div>
                                   
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Top Header Area End -->
            <div class="main_header_area">
                <div class="container h-100">
                    <div class="row h-100">
                        <div class="col-12 d-md-flex justify-content-between">
                            <!-- Header Social Area -->
                            <div class="header-social-area">
                                <a href="#"><span class="karl-level">Share</span> <i class="fa fa-pinterest" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                            </div>
                            <!-- Menu Area -->
                            <div class="main-menu-area">
                                <nav class="navbar navbar-expand-lg align-items-start">

                                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#karl-navbar" aria-controls="karl-navbar" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><i class="ti-menu"></i></span></button>

                                    <div class="collapse navbar-collapse align-items-start collapse" id="karl-navbar">
                                        <ul class="navbar-nav animated" id="nav">
                                            <li class="nav-item active"><a class="nav-link" href="index.php">Home</a></li>
                                           
                                            <li class="nav-item"><a class="nav-link" href="index.php?sts=L">Logout</a></li>
                                            <li class="nav-item"><a class="nav-link" href="frmabout.php">About Us</a></li>
                                              <li class="nav-item"><a class="nav-link" href="frmcontact.php">Contact Us</a></li>
                                        </ul>
                                    </div>
                                </nav>
                            </div>
                            <!-- Help Line -->
                            <div class="help-line">
                                <a href="tel:+346573556778"><i class="ti-headphone-alt"></i> +34 657 3556 778</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- ****** Header Area End ****** -->

        <!-- ****** Popular Brands Area Start ****** -->
            <div class="container">
                <div class="row">
 <?php
 if(isset($_SESSION["cart"]))
 {
     if($_SESSION["cart"]!="")
     {
    //echo $_SESSION["cart"];
     $str=$_SESSION["cart"];
     $arr= explode(',', $str);
    //print_r($arr);
     foreach ($arr as $item)
     {
     $contents[$item]= isset($contents[$item])?$contents[$item]+1:1;    
     }
     echo"<form method=post class=form action=frmcrt.php?action=update style='display: grid; align-content: center; margin: 0 auto; width:768px !important;' ><b>";
         echo "<table border=10 ><tr><th>&nbsp;PRODUCT TITLE &nbsp;&nbsp;&nbsp;</th><th>&nbsp;PRODUCT PRICE&nbsp;&nbsp;&nbsp;</th><th>&nbsp;QUANTITY&nbsp;&nbsp;&nbsp;"
     . "</th><th>&nbsp;AMOUNT&nbsp;&nbsp;&nbsp;&nbsp;</th><th colspan=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th></tr>";
        // print_r($contents);
         $tot=0;
     foreach ($contents as $key=>$value)
     {
       $a=$key;
       $obj=new clsprd();
       $obj->prdcod=$a;
       $r=$obj->find_rec();
       echo '<tr ><td>'.$obj->prdnam.'</td>';
       echo '<td class=form-control>'.$obj->prdprc.'</td>';
       echo '<td  ><input type=text name=qty'.$key.' value='.$value.' class=form-control /></td>';//qty1,qty2
      $amt=$obj->prdprc*$value;
      $tot+=$amt;
       echo '<td>'.$amt.'</td>';
       echo '<td><input type=submit name=btnupd value=update  class=form-control /></td>';
       echo '<td><a href=frmcrt.php?pid='.$obj->prdcod.'&action=delete class=form-control  >DELETE</a></td></tr>';
       }
       echo '<tr><td colspan=3>TOTAL AMOUNT</td>';
       echo '<td colspan=3>'.$tot.'</td></tr>'; 
       $_SESSION["totamt"]=$tot;
     echo '</table>';
     echo '</form>';
 }
 else
 {
     echo "<b><h3 align=center>YOUR CART IS EMPTY</h3></b>";
 }
 }
 else 
{
     echo "<b><h3 align=center>YOUR CART IS EMPTY</h3></b>";     
}
 ?>
      <hr>
      <form method="post" action="frmcrt.php" style="display: grid; align-content: center; margin: 0 auto; width:768px !important;" >
          <table>
              <tr>
                  <td>ENTER DEL. ADD.</td>
                  <td><textarea rows="5" cols="10" name="txtadd" required=""class="form-control"></textarea></td>
              </tr>
              <tr>
                  <td>ENTER MOB. NO.</td>
                  <td><input type="text" name="txtphn" required="" class="form-control"/></td>
              </tr>
              <tr>
                  <td colspan="2" style="text-align: center; margin: 0 auto;" >
                      <input type="submit" name="btnsub" value="PLACE YOUR ORDER" class="button" />
                  </td>
              </tr>
          </table>
      </form>
                    </div>
                </div>
                        </div>
            
                
        <!-- ****** Popular Brands Area End ****** -->

        <!-- ****** Footer Area Start ****** -->
        <footer class="footer_area">
            <div class="container">
                <div class="row">
                    <!-- Single Footer Area Start -->
                    <div class="col-12 col-md-6 col-lg-3">
                        <div class="single_footer_area">
                            <div class="footer-logo">
                                <img src="img/core-img/logo.JPEG" alt="">
                            </div>
                            <div class="copywrite_text d-flex align-items-center">
                                <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved ||
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                            </div>
                        </div>
                    </div>
                    <!-- Single Footer Area Start -->
                    <div class="col-12 col-sm-6 col-md-3 col-lg-2">
                        <div class="single_footer_area">
                          
                        </div>
                    </div>
                    <!-- Single Footer Area Start -->
                  
                <div class="line"></div>

                
            </div>
        </footer>
        <!-- ****** Footer Area End ****** -->
    </div>
    <!-- /.wrapper end -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>

</body>

</html>