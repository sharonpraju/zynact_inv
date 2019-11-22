<?php
session_start();
if(!isset($_SESSION['admin']))
{
    header("location:index.html");
}
?>
<link rel="stylesheet" href="css/reports.css">
<div><br><br><br><br>
    <form method="post" action="validate.php">
        <input type="text" name="validation" value="sales_purchase_report" hidden readonly>
        <input type="submit" value="Sales / Purchase Report">
    </form>
    <form method="post" action="validate.php">
        <input type="text" name="validation" value="alert_level" hidden readonly>
        <input type="submit" value="Alert Level">
</form>
<form method="post" action="validate.php">
    <input type="text" name="validation" value="stock_report" hidden readonly>
    <input type="submit" value="Stock Report">
</form>
<form method="post" action="validate.php">
    <input type="text" name="validation" value="purchase_report" hidden readonly>
    <input type="submit" value="Purchase Report">
</form>
<form method="post" action="distribution_log.php">

    <input type="submit" value="Distribution Report">
</form>
</div>