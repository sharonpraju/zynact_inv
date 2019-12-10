</head><body>
<link rel="stylesheet" href="css/inventory_status.css">
<div class="graph">
<div class="line-chart">
<div class="aspect-ratio">
<canvas id="chart"></canvas>
</div>
</div>
<br><br>
<?php
include 'db_connection.php';
$conn = OpenCon();
session_start();
if(!isset($_SESSION['admin']))
{
    header("location:index.html");
}
else
{
$section=$_SESSION['section'];
$admin=$_SESSION['admin'];
$out_of_stock=0;

$sql = "SELECT item_name, total_units FROM inv_stock WHERE total_units<='0' AND section_id='$section' AND status='1'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);
$item_name=$row['item_name'];
do{
    if($row['item_name']!=NULL)
    {
        $out_of_stock++;
    }

}while ($row = $result->fetch_assoc());

$sql = "SELECT item_name, total_units FROM inv_stock WHERE section_id='$section' AND status='1'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);
$alert_level=0;

do
{
        if($row['item_name']!=NULL)
        {
            $item_name=$row['item_name'];
            $total_units=$row['total_units'];
            $sql_1 = "SELECT item_alert1 FROM inv_items WHERE item_name='$item_name' AND section_id='$section' AND status='1'";
            $result_1 = mysqli_query($conn, $sql_1);
            $row_1 = mysqli_fetch_assoc($result_1);

            $alert_level_1=$row_1['item_alert1'];
            if($total_units<$alert_level_1)
            {
                $alert_level++;
            }
        }

}while ($row = $result->fetch_assoc());


echo'<link rel="stylesheet" href="css/inv_status.css">
<form method="post" action="validate.php">
        <input type="text" name="validation" value="alert_level" hidden readonly>
        <input class=input_button type="submit" value="Stocks Under Warning Limit: '.$alert_level.'">
</form>
<form method="post" action="status_stock.php">
        <input class=input_button type="submit" value="Out Of Stock :      '.$out_of_stock.'">
</form>
<form method="post" action="stock_request.php">
<input type="text" name="validation" value="" hidden readonly>
        <input class=input_button type="submit" value="Stock Requests ">
</form>';
}
?>
</div>
<script src="js/chart.min.js"></script>
<script src="js/inventory_status.js"></script>
</body></html>