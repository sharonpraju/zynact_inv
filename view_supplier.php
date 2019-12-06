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
echo '<br><br><h4><center>';
while ($row = $result->fetch_object())
{
// set up a row for each record
echo 'Supplier Name :<input type="text" class="input_txt" value="'.$row->supplier_name.'">';
echo 'Contact Name :<input type="text" class="input_txt" value="' . $row->supplier_contact_name.'">';
echo'<br><br>';
echo 'Address :<input type="text" class="input_txt" value=" ' . $row->supplier_address.'">';
echo 'E-mail :<input type="text" class="input_txt" value=" ' . $row->supplier_email.'">';
echo'<br><br>';
echo 'Supplier Bank :<input type="text" class="input_txt" value=" ' . $row->supplier_bank.'">';
echo 'Account No :<input type="text" class="input_txt" value=" ' . $row->supplier_account_no.'">';
echo'<br><br>';
echo 'Branch :<input type="text" class="input_txt"value=" ' . $row->supplier_branch.'">';
echo 'IFSC No :<input type="text" class="input_txt" value=" ' . $row->supplier_ifsc_no.'">';
echo'<br><br>';
echo 'Phone No :<input type="text" class="input_txt" value=" ' . $row->supplier_phone_no.'">';
echo'<br><br>';
echo 'GST No :<input type="text" class="input_txt" value=" ' . $row->supplier_gst_no.'">';
echo 'Supplier Remarks :<input type="text" class="input_txt" value=" ' . $row->supplier_remarks.'">';
}
echo "</h4></center>";
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