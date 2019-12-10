<link rel="stylesheet" href="css/add_supplier.css">
<link rel="stylesheet" href="css/settings.css">
<div class="manage_cat_div">

<?php
session_start();
if(!isset($_SESSION['admin']))
{
    header("location:index.html");
}
else
{
include('db_connection.php');
$conn = OpenCon();
$section=$_SESSION['section'];
$id = $_GET['id'];
// get the records from the database
if ($result = $conn->query("SELECT * FROM inv_supplier WHERE supplier_id='$id' AND section_id='$section' AND supplier_status='1'"))
{
// display records if there are records to display
if ($result->num_rows > 0)
{
// display records in a table
echo '<br><br><center><table>';
while ($row = $result->fetch_object())
{
// set up a row for each record
echo '<tr><td>Supplier Name :</td><td>'.$row->supplier_name.'</td></tr>';
echo '<tr><td>Contact Name :</td><td>' . $row->supplier_contact_name.'</td></tr>';
echo '<tr><td>Address :</td><td> ' . $row->supplier_address.'</td></tr>';
echo '<tr><td>E-mail :</td><td> ' . $row->supplier_email.'</td></tr>';
echo '<tr><td>Supplier Bank :</td><td> ' . $row->supplier_bank.'</td></tr>';
echo '<tr><td>Account No :</td><td> ' . $row->supplier_account_no.'</td></tr>';
echo '<tr><td>Branch :</td><td>' . $row->supplier_branch.'</td></tr>';
echo '<tr><td>IFSC No :</td><td> ' . $row->supplier_ifsc_no.'</td></tr>';
echo '<tr><td>Phone No :</td><td> ' . $row->supplier_phone_no.'</td></tr>';
echo '<tr><td>GST No :</td><td> ' . $row->supplier_gst_no.'</td></tr>';
echo '<tr><td>Supplier Remarks :</td><td> ' . $row->supplier_remarks.'</td></tr>';
}
echo "</table></center>";
}
else
{
  echo "<center>Supplier Not Found</center>";
}
}
else
{
echo "Error: " . $conn->error;
}
echo"<center><br><button class='btn_submit' onclick='history.go(-1);'>Back</button></center>";
}
?>