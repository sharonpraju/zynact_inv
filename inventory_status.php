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

$sql = "SELECT * FROM inv_stock WHERE section_id='$section' AND status='1'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);
$alert_level=0;

do{
    if($row['item_name']!=NULL)
    {
        $item_name=$row['item_name'];
        $total_units=$row['total_units'];
        $sql = "SELECT item_alert1 FROM inv_items WHERE item_name='$item_name' AND section_id='$section' AND status='1'";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);

        $alert_level_1=$row['item_alert1'];

        if($total_units<$alert_level_1)
        {
            $alert_level++;
        }
    }

}while ($row = $result->fetch_assoc());

echo'
Stocks Under Warning Limit :'.$alert_level.'
<br><br>
Out Of Stock :'.$out_of_stock.'
<br><br>
Stock Requests :';
?>
</div>
<script src="js/chart.min.js"></script>
<script src="js/inventory_status.js"></script>
</body></html>