<link rel="stylesheet" href="css/add_supplier.css">
<link rel="stylesheet" href="css/settings.css">


<div class="manage_cat_div">
    <?php
// connect to the database
include('db_connection.php');
$conn = OpenCon();
session_start();
$section=$_SESSION['section'];
if(!isset($_SESSION['section']))
header("location:index.html");

// get the records from the database
if ($result = $conn->query("SELECT * FROM inv_supplier WHERE section_id='$section' AND supplier_status='1'"))
{
// display records if there are records to display
if ($result->num_rows > 0)
{
// display records in a table
echo '<br><br><h4><center>';
while ($row = $result->fetch_object())
{
// set up a row for each record
echo '<input type="text" class="input_txt" value=" Supplier Name : '.$row->supplier_name.'">';
echo '<input type="text" class="input_txt" value=" Contact Name :' . $row->supplier_contact_name.'">';
echo'<br><br>';
echo '<input type="text" class="input_txt" value=" Address :' . $row->supplier_address.'">';
echo '<input type="text" class="input_txt" value=" E-mail :' . $row->supplier_email.'">';
echo'<br><br>';
echo '<input type="text" class="input_txt" value=" Supplier Bank :' . $row->supplier_bank.'">';
echo '<input type="text" class="input_txt" value=" Account No :' . $row->supplier_account_no.'">';
echo'<br><br>';
echo '<input type="text" class="input_txt"value=" Branch :' . $row->supplier_branch.'">';
echo '<input type="text" class="input_txt" value=" IFSC No :' . $row->supplier_ifsc_no.'">';
echo'<br><br>';
echo '<input type="text" class="input_txt" value=" Phone No :' . $row->supplier_phone_no.'">';
echo '<input type="text" class="input_txt" value=" Mobile No :' . $row->supplier_mob_no.'">';
echo'<br><br>';
echo '<input type="text" class="input_txt" value=" GST No :' . $row->supplier_gst_no.'">';
echo '<input type="text" class="input_txt" value=" Supplier Remarks :' . $row->supplier_remarks.'">';
}
echo "</h4></center>";
}
// if there are no records in the database, display an alert message
else
{
  echo "<center>Supplier Not Found</center>";
}
}
// show an error if there is an issue with the database query
else
{
echo "Error: " . $conn->error;
}
echo"<center><br><button class='btn_submit' onclick='history.go(-1);'>Back</button></center>";
?>