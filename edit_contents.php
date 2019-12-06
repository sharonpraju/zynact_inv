<link rel="stylesheet" href="css/settings.css">
<link rel="stylesheet" href="css/manage_supplier.css">
<?php
include('db_connection.php');
$conn = OpenCon();
session_start();
if(!isset($_SESSION['admin']))
{
    header("location:index.html");
}
else
{
$section=$_SESSION['section'];
$id=$_GET['id'];
$id=preg_replace('/[^A-Za-z0-9_\-]/', '', $id);
$page=$_GET['page'];
preg_replace('/[^A-Za-z0-9\-]/', '', $page);
if($page=="supplier")
{
        $sql="SELECT * FROM inv_supplier WHERE supplier_id='$id' AND section_id='$section' AND supplier_status='1'";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);
        echo "<br><br><center><form action=validate.php method=post> 
        <input type=hidden name=validation value='edit_supplier'>
        <input type=hidden name=backup value=".$row['supplier_name'].">
        <input type=hidden name=supplier_phone_no value=".$row['supplier_phone_no'].">
        Supplier Name: <input type=text name=supplier_name value=".$row['supplier_name'].">
        Supplier Address: <input name=supplier_address type=text value=".$row['supplier_address'].">
        <br><br>
        Supplier Email: <input name=supplier_email type=text value=".$row['supplier_email'].">
        Supplier Contact Name: <input name=supplier_contact_name type=text value=".$row['supplier_contact_name'].">
        <br><br>
        Supplier Phone Number: <input name=supplier_phone_no type=text value=".$row['supplier_phone_no'].">
        <br><br>
        Supplier Remarks: <input name=supplier_remarks type=text value=".$row['supplier_remarks'].">
        <br><br>
        Supplier GST Number: <input name=supplier_gst_no type=text value=".$row['supplier_gst_no'].">
        <br><br>
        Supplier Account Number: <input name=supplier_account_no type=text value=".$row['supplier_account_no'].">
        <br><br>
        Supplier Bank: <input name=supplier_bank type=text value=".$row['supplier_bank'].">
        <br><br>
        Supplier Branch: <input name=supplier_branch type=text value=".$row['supplier_branch'].">
        <br><br>
        Supplier IFSC Number: <input name=supplier_ifsc_no type=text value=".$row['supplier_ifsc_no'].">
        <br><br><input class=chng_submit type=submit class='chng_submit'>
        </form></center>";
}
if($page=="category")
{
$sql="SELECT * FROM inv_category WHERE category_name = '$id' AND section_id='$section' AND category_status='1'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);
echo "<br><br><br><br><center><form action=validate.php method=post>
        Category Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=hidden name=validation value='edit_category'><input name=edit_name type=text value=".$row['category_name']."><br><br>
        Category Description:&nbsp;&nbsp;&nbsp;&nbsp;<input type=hidden value=".$row['category_id']." name=sl><input name=edit_description type=text value=".$row['category_description']."><br><br>
        Remarks:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name=edit_remarks type=text value=".$row['category_remarks'].">
        <br><br>
        <input type=submit class='chng_submit'>
        </form></center>";
}

if($page=="sub_category")
{
$sql="SELECT * FROM inv_category WHERE category_name = '$id' AND section_id='$section' AND category_status='1'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);
echo "<br><br><br><br><center><form action=validate.php method=post>
        Category Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=hidden name=validation value='edit_sub_category'><input name=edit_name type=text value=".$row['category_name']."><br><br>
        Category Description:&nbsp;&nbsp;&nbsp;&nbsp;<input type=hidden value=".$row['category_id']." name=sl><input name=edit_description type=text value=".$row['category_description']."><br><br>
        Remarks:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name=edit_remarks type=text value=".$row['category_remarks'].">
        <br><br>
        <input type=submit class='chng_submit'>
        </form></center>";
}

if($page=="stock")
{
echo'
        <form method="post" action="validate.php">
        <select class="cat_txt" name="item_category" required>
        <option value="">Select a Category</option>';
        $sql = "SELECT * FROM inv_category WHERE category_type='0' AND section_id='1' AND category_status='1'";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);
        if($row['category_name']!=NULL)
        {
        echo "<option value='".$row['category_name']."'>".$row['category_name']."</option>";
        }
        while($row=mysqli_fetch_assoc($result)){
            echo "<option value='".$row['category_name']."'>".$row['category_name']."</option>";
        }
        echo'
        </select>
        <select class="cat_txt" name="item_sub_category" required>
        <option value="">Select a Sub Category</option>';
        $sql = "SELECT category_name FROM inv_category WHERE category_type=1 AND section_id='$section' AND category_status='1'";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);
        if($row['category_name']!=NULL)
        {
        echo "<option value='".$row['category_name']."'>".$row['category_name']."</option>";
        }
        while($row=mysqli_fetch_assoc($result))
        {
        echo "<option value='".$row['category_name']."'>".$row['category_name']."</option>";
        }
        echo'</select>';

        echo'<select class="cat_txt" name="item_supplier" name="item_category" required>
        <option value="">Select a Supplier</option>';

        $sql = "SELECT supplier_name FROM inv_supplier WHERE section_id='$section' AND supplier_status='1'";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);
        if($row['supplier_name']!=NULL)
        {
            echo "<option value='".$row['supplier_name']."'>".$row['supplier_name']."</option>";
        }
        while($row=mysqli_fetch_assoc($result))
        {
            echo "<option value='".$row['supplier_name']."'>".$row['supplier_name']."</option>";
        }
        echo'</select>';

        $sql="SELECT * FROM inv_stock WHERE item_code = '$id' AND section_id='$section' AND status='1'";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);

        $name=$row['item_name'];
        
        $sql_1="SELECT item_alert1, item_alert2, max_expected FROM inv_items WHERE Item_name ='$name'AND section_id='$section' AND status='1'";
        $result_1 = mysqli_query($conn, $sql_1);
        $row_1 = mysqli_fetch_assoc($result_1);
        echo'
        <br><br>
        <input type="text" name="validation" value="edit_stock" hidden readonly>
        Item Code<input class="category_select" type="text"  name="item_code_new"  value="'.$row['item_code'].'"  placeholder="" readonly>
        <input type="text"  name="item_code"  value="'.$row['item_code'].'" readonly hidden>
        Item Name<input class="cat_txt" type="text"  name="item_name_new" value="'.$row['item_name'].'" placeholder="" style="margin-left:10px;">
        <input type="text"  name="item_name" value="'.$row['item_name'].'" readonly hidden>
        <br><br><br>
        <div id="div_hidden_'.$id.'" class="div_hidden">
        Description<input class="discription_txt" name="item_description" type="text"  value="'.$row['item_description'].'"  placeholder="">
        <br><br>
        Alert Level 1<input class="cat_txt" type="text" id="'.$row['item_code'].'" name="item_alert_level_1" value="'.$row_1['item_alert1'].'"  placeholder="" style="margin-left:10px;">
        Alert Level 2  <input class="cat_txt" type="text" id="'.$row['item_code'].'" name="item_alert_level_2" value="'.$row_1['item_alert2'].'"  placeholder="" style="margin-left:15px;">
        Max Expected<input class="cat_txt" type="text"  name="item_max_expected" value="'.$row_1['max_expected'].'"  placeholder="" style="margin-left:10px; width:130px;">
        <br><br>
        Order No<input type="text" class="cat_txt" name="order_no" value="'.$row['order_no'].'"  placeholder="" style="margin-left:47px;">
        Order Date<input type="date" class="cat_txt" name="order_date"value="'.$row['order_date'].'"  placeholder="" style="margin-left:10px; width:157px;">
        Unit<input type="text" class="cat_txt" name="item_unit" value="'.$row['unit'].'"  placeholder="" style="margin-left:25px;">
        <br><br>
        Total Units<input type="text" class="cat_txt" name="total_units" value="'.$row['total_units'].'"  placeholder="" style="margin-left:25px;">
        Total Cost (including tax)<input type="text" class="cat_txt" name="total_cost" value="'.$row['total_cost'].'"  placeholder="" style="margin-left:10px; width:107px;">
        MRP<input type="text" class="cat_txt" name="item_price" value="'.$row['mrp'].'"  placeholder="" style="margin-left:20px;">
        <br><br>
        Selling Price<input type="text" class="cat_txt" name="item_selling_price" value="'.$row['selling_price'].'"  placeholder="" style="margin-left:15px;">
        Tax Amount<input type="text" class="cat_txt" name="item_tax" value="'.$row['tax_percent'].'"  placeholder="" style="margin-left:20px;">
        Invoice No<input type="text" class="cat_txt" name="invoice_no" value="'.$row['invoice_no'].'"  placeholder="" style="margin-left:10px; width:155px;">
        <br><br>
        Invoice Date<input type="date" class="cat_txt" name="invoice_date" value="'.$row['invoice_date'].'"  placeholder="" style="margin-left:15px;">
        Transportation Cost<input type="text" class="cat_txt" name="transportation_cost" value="'.$row['transportation_cost'].'"  placeholder="" style="margin-left:10px; width:145px;">
        Barcode<input type="text" class="cat_txt" name="item_barcode" value="'.$row['barcode'].'"  placeholder="" style="margin-left:10px; width:145px;">
        <br><br>
        Remarks<input class="cat_txt" type="text"  name="item_remarks" value="'.$row['remarks'].'"  placeholder="" style="margin-left:50px;">
        <input type="submit" class="btn_submit" value="Submit">
        <br><br>
        </div>
        <div class="bottom_div"></div>
        <br>
        </form>
        </div>
        </div>';
}
}
?>