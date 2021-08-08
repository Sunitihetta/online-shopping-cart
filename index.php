<?php
session_start();
include_once 'buslogic.php';
if(isset($_REQUEST["ccod"]))
{
    $_SESSION["ccod"]=$_REQUEST["ccod"];
}
if(isset($_REQUEST["sts"]))
{
    if($_REQUEST["sts"]=='L')
    {
        unset($_SESSION["ucod"]);
        unset($_SESSION["rol"]);
        unset($_SESSION["ccod1"]);
        unset($_SESSION["cart"]);
    }
}
if(isset($_REQUEST["msg"]))
{
    ?>
<script>
    alert('Server Is Not Responding');
</script>
        <?php
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
 <script>
     function abc(a)
     {
         window.location="index.php?ccod="+a;
     }
     </script>
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
                                           
                                            <li class="nav-item"><a class="nav-link" href="frmlogin.php">Login</a></li>
                                            <li class="nav-item"><a class="nav-link" href="frmreg.php">Create An Account</a></li>
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

        <!-- ****** Top Discount Area Start ****** -->
        <section class="top-discount-area d-md-flex align-items-center">
            <!-- Single Discount Area -->
            <div class="single-discount-area">
                <h5>Free Shipping &amp; Returns</h5>
                <h6><a href="#">BUY NOW</a></h6>
            </div>
            <!-- Single Discount Area -->
            <div class="single-discount-area">
                <h5>20% Discount for all dresses</h5>
                <h6>USE CODE: Colorlib</h6>
            </div>
            <!-- Single Discount Area -->
            <div class="single-discount-area">
                <h5>20% Discount for students</h5>
                <h6>USE CODE: Colorlib</h6>
            </div>
        </section>
        <!-- ****** Top Discount Area End ****** -->

        <!-- ****** Welcome Slides Area Start ****** -->
        <section class="welcome_area">
            <div class="welcome_slides owl-carousel">
                <!-- Single Slide Start -->
                <div class="single_slide height-800 bg-img background-overlay" style="background-image: url(img/bg-img/bg-1.jpg);">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <div class="col-12">
                                <div class="welcome_slide_text">
                                    <h6 data-animation="bounceInDown" data-delay="0" data-duration="500ms">* Only today we offer free shipping</h6>
                                    <h2 data-animation="fadeInUp" data-delay="500ms" data-duration="500ms">Fashion Trends</h2>
                                    <a href="#" class="btn karl-btn" data-animation="fadeInUp" data-delay="1s" data-duration="500ms">Shop Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Slide Start -->
                <div class="single_slide height-800 bg-img background-overlay" style="background-image: url(img/bg-img/bg-4.jpg);">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <div class="col-12">
                                <div class="welcome_slide_text">
                                    <h6 data-animation="fadeInDown" data-delay="0" data-duration="500ms">* Only today we offer free shipping</h6>
                                    <h2 data-animation="fadeInUp" data-delay="500ms" data-duration="500ms">Summer Collection</h2>
                                    <a href="#" class="btn karl-btn" data-animation="fadeInLeftBig" data-delay="1s" data-duration="500ms">Check Collection</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Slide Start -->
                <div class="single_slide height-800 bg-img background-overlay" style="background-image: url(img/bg-img/bg-2.jpg);">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center">
                            <div class="col-12">
                                <div class="welcome_slide_text">
                                    <h6 data-animation="fadeInDown" data-delay="0" data-duration="500ms">* Only today we offer free shipping</h6>
                                    <h2 data-animation="bounceInDown" data-delay="500ms" data-duration="500ms">Women Fashion</h2>
                                    <a href="#" class="btn karl-btn" data-animation="fadeInRightBig" data-delay="1s" data-duration="500ms">Check Collection</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ****** Popular Brands Area Start ****** -->
        <section class="karl-testimonials-area section_padding_100">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section_heading text-center">
                            <B>SELECT PRODUCT CATEGORY</B>     <select name="drpcat" onchange="abc(this.value);" class="FORM-CONTROL">
              <option value="-1">SELECT CATEGORY</option>
             <?php
              $obj=new clscat();
              $arr=$obj->disp_rec();
              foreach ($arr as $r)
              {
                  if(isset($_SESSION["ccod"])&&$_SESSION["ccod"]==$r[0])
                  {
                echo "<option value=$r[0] selected >$r[1]</option>";   
              }
              else
              {
                  echo "<option value=$r[0]>$r[1]</option>";
              }
              }
              ?>
                            </select><BR><HR>
                              <?php
      if(isset($_SESSION["ccod"]))
      {
          $ccod=$_SESSION["ccod"];
          $obj=new clsprd();
          $arr=$obj->disp_rec($ccod);
      ?>
           <div class="row">      <?php
              foreach ($arr as $r)
              {
        ?>
        <div class="col-12 col-sm-6 col-lg-4 single_gallery_item wow fadeInUpBig" data-wow-delay="0.4s">
                                    <!-- Product Image -->
                                    <div class="product-img">
                                        <img src="prdimg/<?php echo "$r[3]"; ?>" height="230" width="100"/>
                                    </div>
                                    <!-- Product Description -->
                                    <div class="product-description">
                                        <h4 class="product-price">RS. <?php echo "$r[4]"; ?> /-</h4>
                                        <B><?php echo "$r[1]"; ?> </B>
                                        <!-- Add to Cart -->
                                        <a href="frmcrt.php?pid=<?php echo$r[0];?>&action=add" class="add-to-cart-btn">ADD TO CART</a><br>
                                        <?php
                                        if(isset($_SESSION["ucod"])!="")
                                        {
                                            $con=new clscon();
                                             $link=$con->db_connect();
                                       $qry="select *,count(*) as cnt  from tbrat where ratusrcod=".$_SESSION["ucod"]." and ratprdcod=".$r[0] ;
                                            $res= mysqli_query($link, $qry);
                                            if($r1= mysqli_fetch_array($res))
                                            {
                                                if($r1[4]>0)
                                                {
                                                    for($i=1;$i<=$r1[3];$i++)
                                                    {
                                                        echo"<img src=img/star1.jpg height=50 width=50 />";
                                                    }
                                                }
                                                 else 
                                                     {
                                                     $qry1="SELECT DISTINCT * from tborddet,tbord where orddetordcod in (select ordcod from tbord where ordusrcod=".$_SESSION["ucod"].") and orddetprdcod=".$r[0];
                                                     $res1= mysqli_query($link, $qry1);
                                                     if(mysqli_num_rows($res1)>0)
                                                     {
                                                   ?>
                                        <form method="post" action="frmrat.php?pid=<?php echo$r[0]?>" name="abc">
                                            <input  type="radio" name="r1" value="1"/>1
                                             <input  type="radio" name="r1" value="2"/>2
                                              <input  type="radio" name="r1" value="3"/>3
                                               <input  type="radio" name="r1" value="4"/>4
                                               <input  type="radio" name="r1" value="5"/>5<br>
                                                <input type="submit" name="b1" value="RATE THIS PRODUCT"/>
                                        </form>
                                        <?php
                                                     }
                                                    else {
                                                         echo "Buy And Rate This Product";
                                                        }
                                                     }
                                            }
                                        }
                                        ELSE
                                        {
                                            ECHO"<B>Login To See Product Rating</B>";
                                        }
                                        ?>
                                    </div>
                                </div>
        <?php
      }
      }
        ?>
                        </div>
                    </div>
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