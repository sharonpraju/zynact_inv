<?php
session_start();
if(!isset($_SESSION['admin']))
{
  header("location:index.html");
}
?>
<link rel="stylesheet" href="css/add_item.css">
<center>
<form method="post" action="validate.php">
    <input type="text" name="validation" value="add_item" hidden readonly>
    <br>
    <input type="text" class="input_txt" name="item_name" placeholder=" Item Name">
    <br><br>
    <input type="text" class="input_txt" name="item_remarks" placeholder=" Remarks"><br>
    <input type="text" class="input_txt_alert" name="item_alert1" placeholder=" Alert Level 1"  type="number">
    <input type="text" class="input_txt_alert" name="item_alert2" placeholder=" Alert Level 2"  type="number">
    <br>
    <input type="text" class="input_txt" name="max_expected" placeholder=" Max Expected"  type="number">
    <br><br>
    <input type="submit" class="submit_btn" value="Add Item">
</form>
</center>