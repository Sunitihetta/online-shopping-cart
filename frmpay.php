<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php
session_start();
?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body onload="document.getElementById('btntest').click();">
<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
    <input type="hidden" name="cmd" value="_xclick" />
    <input type="hidden" name="Personal" value="abc@business.com" />    
    <input type="hidden" name="business" value="abc@business.com" />
    <input type="hidden" name="item_name" value='Shopping' />
    <input type="hidden" name="amount" value='<?php echo$_SESSION['totamt']; ?>' /> 
    <input type="hidden" name="return" value="http://localhost/shopping/confirm.php" />
    <input type="hidden" name="cancel_return" value="cancel_confirm.php" />
    <input type="hidden" name="rm" value="2" />
   
    <input type="submit" style="display:none;" id="btntest" value="Buy with additional parameters!" /> 
    Please wait...............
    </form>
</body>
</html>

