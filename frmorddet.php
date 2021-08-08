<?php
session_start();
include_once 'buslogic.php';
if(isset($_POST["btnsub"]))
{
    if($_POST["r1"]=='p')
    {
        $obj=new clsord();
        $obj->orddat= date('y-m-d');
        $obj->orddeladd=$_SESSION["add"];
        $obj->orddelphn=$_SESSION["phn"];
        $obj->ordusrcod=$_SESSION["ucod"];
        $a=$obj->save_rec();
        $str=$_SESSION["cart"];
        $arr= explode(',',$str);
        foreach ($arr as $item)
        {
            $contents[$item]= isset($contents[$item])?$contents[$item]+1:1;
        }
        foreach ($contents as $key=>$value)
        {
            $obj1=new clsorddet();
            $obj1->orddetordcod=$a;
            $obj1->orddetprdcod=$key;
            $obj1->orddetprdqty=$value;
            $obj1->save_rec();
        }
        unset($_SESSION["phn"]);
        unset($_SESSION["add"]);
        unset($_SESSION["cart"]);
        $msg="YOUR ORDER IS PLACED SUCCESSFULLY";
    }
    else if($_POST["r1"]=='t')
    {
        header("location:frmpay.php");
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
                                           
                                            <li class="nav-item"><a class="nav-link" href="index.php">Logout</a></li>
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
         <form method="post" action="frmorddet.php"style="align-content: center; margin: 0 auto; width:500px !important;">
          <input type="radio" name="r1" value="p"  />CASH ON DELIVERY
          <input type="radio" name="r1" value="t" />PAY ONLINE
         </br>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="btnsub" value="Submit Order" class="button" align="center"/>
          <BR>
          <?php
          if(isset($msg))
          {
              echo "<b>$msg</b>";
          }
          ?>
      </form>
                    </div>
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