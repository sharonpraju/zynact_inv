<link rel="stylesheet" href="css/add_supplier.css">
<link rel="stylesheet" href="css/settings.css">


<div class="manage_cat_div">
    <input type='button' class='add_btn' value='Add Supplier' onclick='hide_div()'>
    <?php
// connect to the database
include('db_connection.php');
$conn = OpenCon();
session_start();
$section=$_SESSION['section'];

// get the records from the database
if ($result = $conn->query("SELECT * FROM inv_supplier WHERE section_id='$section' AND supplier_status='1'"))
{
// display records if there are records to display
if ($result->num_rows > 0)
{
// display records in a table
echo "<br><br><center><table border='1' cellpadding='10'>";
echo "<tr><th>Supplier Name</th>
<th>Address</th>
<th colspan='7'></th></tr>";

while ($row = $result->fetch_object())
{
// set up a row for each record
echo "<tr>";
echo "<td>" . $row->supplier_name . "</td>";
echo "<td>" . $row->supplier_address . "</td>";
echo "<td><a class='btn_link' href='view_supplier.php'>View</a></td>";
echo "<td><a class='tbl_btn' href='edit_contents.php?id=" . $row->supplier_name . "&page=supplier'><img class='img_btn' src='img/edit_icon.png'></a></td>";
echo "<td><a class='tbl_btn' href='delete_contents.php?id=" . $row->supplier_name . "&page=supplier'><img class='img_btn' src='img/delete_icon.ico'></a></td>";
/*echo "<td><a href='records.php?id=" . $row->category_name . "'>Edit</a></td>";
echo "<td><a href='delete_contents.php?id=" . $row->category_name . "'>Delete</a></td>";*/
echo "</tr>";
}

echo "</table></center>";
}
// if there are no records in the database, display an alert message
else
{
  echo "<center>Suppliers Not Found</center>";
}
}
// show an error if there is an issue with the database query
else
{
echo "Error: " . $conn->error;
}
?>
    <center><div id="div_hidden" class="div_hidden">
    <div id="add_category_div">
        <br>
            <div id="main_category">
                <form method="post" action="validate.php">
                    <input type="hidden" name="validation" value="add_supplier">
                    <br><br>
                  <input name=supplier_name class="supplier_txt" type="text" placeholder="  Supplier Name">
                  <textarea name=supplier_address class="input_txt_address" placeholder="  Address"></textarea>
                  <br><br>
                  <input name=supplier_phone_no class="supplier_txt" type="text" placeholder="  Phone">
                  <input name=supplier_email class="supplier_txt" type="text" placeholder="  Email">
                  <br><br>
                  <input name=supplier_contact_name class="supplier_txt" type="text" placeholder="  Contact Person Name">
                  <input name=supplier_gst_no class="supplier_txt" type="text" placeholder="  GST Number">
                  <br><br>
                  <input name=supplier_account_no class="supplier_txt" type="text" placeholder="  A/C Number">
                  <input name=supplier_bank class="supplier_txt" type="text" placeholder="  Bank">
                  <br><br>
                  <input name=supplier_branch class="supplier_txt" type="text" placeholder="  Branch">
                  <input name=supplier_ifsc_no class="supplier_txt" type="text" placeholder="  IFSC Code">
                  <br><br>
                  <input name=supplier_remarks class="supplier_txt" type="text" placeholder="  Remarks">
                  <br><br>
                  <center>
                  <input class="btn_back_input" type="submit" value="Save">
                  </center>
                </form>
            </div>
            <div id="sub_category">
            </div>
            </div>
    </div>
    </div>
</center>
    <script>
        var x = document.getElementById("div_hidden");
        if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
    function hide_div() {
  var x = document.getElementById("div_hidden");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}


</script>