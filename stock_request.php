<form method=POST action=validate.php>
<input type="text" name="validation" value="stock_request" hidden readonly>
        <input type="text" class="input_txt" name=item_name placeholder="Item Name :">
        <input type="text" class="input_txt" name="remarks" placeholder="Remarks :">
        <input type="submit" class="input_btn" value="Add">
</form>
<?php
include('db_connection.php');
$conn = OpenCon();
session_start();
$section=$_SESSION['section'];

echo '<link rel="stylesheet" href="css/settings.css">
<script  src="js/dashboard.js"></script>';

if ($result = $conn->query("SELECT * FROM inv_stock_request WHERE status='1' and section='$section'"))
{
    
if ($result->num_rows > 0)
{
    $i=1;
    echo "<br><br><center><table border='1' cellpadding='10'>";

echo "<tr><th>Sl</th><th>Item Name</th><th>Added By</th><th>Added On</th><th>Remarks</th><th colspan='7'></th></tr>";
while ($row = $result->fetch_object())
{
echo "<tr>";
echo "<td>" . $i++ . "</td>";
echo "<td>" . $row->item_name . "</td>";
echo "<td>" . $row->added_by . "</td>";
echo "<td>" . $row->added_on . "</td>";
echo "<td>" . $row->remarks . "</td>";
echo "<td><a class='tbl_btn' href='delete_contents.php?id=" . $row->item_name . "&page=request'><img class='img_btn' src='img/delete_icon.ico'></a></td>";
echo "</tr>";
}
}}
?>