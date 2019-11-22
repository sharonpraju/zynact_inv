<?php
session_start();
if(!isset($_SESSION['admin']))
{
    header("location:index.html");
}
?>
<link rel="stylesheet" href="css/settings.css">



<link rel="stylesheet" href="css/add_item.css">
<center>
<form method="post" action="validate.php">
    <br><br><br><br>
    <input type="text" name="validation" value="dist_settings" hidden readonly>
    <br>
    <input type="text" class="input_txt" name="type" placeholder=" Name">
    <br><br>
    <input type="submit" class="submit_btn" value="Add Section">
</form>
</center>
