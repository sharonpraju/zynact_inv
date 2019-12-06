<?php
include 'db_connection.php';
$conn = OpenCon();
session_start();
$validation = $_POST['validation'];
echo"<link rel='stylesheet' href='css/validate.css'>";
if($validation=="login")
{
    $id = $_POST['admin'];
    $pass = $_POST['password'];
    $sql = "SELECT * FROM inv_admins where id = '$id'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    if($row['password']==md5($pass) AND $row['admin_status']==1)
    {
        $_SESSION['section']=$row['section_id'];
        $_SESSION['admin_type']=$row['admin_type'];
        $_SESSION['admin']=$row['id'];
        header("location:dashboard.php");
    }
    else
    {
        echo"Invalid Username/Password";
    }
}
if(!isset($_SESSION['admin']))
{
    header("location:index.html");
}
else
{   
$section=$_SESSION['section'];
$admin=$_SESSION['admin'];
if($validation=="chng_color")
{
    $primary_color=$_POST['primary_color'];
    $secondary_color=$_POST['secondary_color'];
    $component_color=$_POST['component_color'];
    $sql="UPDATE inv_config 
    SET primary_clr='$primary_color',secondary_clr='$secondary_color',component_color='$component_color'"; 
    $conn->query($sql);
}
if($validation=="add_supplier")
{

    $supplier_name=$_POST['supplier_name'];
    $supplier_address=$_POST['supplier_address'];
    $supplier_phone_no=$_POST['supplier_phone_no'];
    $supplier_email=$_POST['supplier_email'];
    $supplier_contact_name=$_POST['supplier_contact_name'];
    $supplier_status=1;
    $supplier_remarks=$_POST['supplier_remarks'];
    $supplier_gst_no=$_POST['supplier_gst_no'];
    $supplier_account_no=$_POST['supplier_account_no'];
    $supplier_bank=$_POST['supplier_bank'];
    $supplier_branch=$_POST['supplier_branch'];
    $supplier_ifsc_no=$_POST['supplier_ifsc_no'];
    $sql="INSERT INTO inv_supplier (supplier_name,supplier_address,supplier_phone_no,supplier_email,supplier_contact_name,supplier_status,supplier_remarks,supplier_gst_no,supplier_account_no,supplier_bank,supplier_branch,supplier_ifsc_no,section_id)
        VALUES ('$supplier_name','$supplier_address','$supplier_phone_no','$supplier_email','$supplier_contact_name','$supplier_status','$supplier_remarks','$supplier_gst_no','$supplier_account_no','$supplier_bank','$supplier_branch','$supplier_ifsc_no','$section')";
    if ($conn->query($sql) === TRUE) {
        echo "<script>alert('Added Successfully')</script>";
    } else {
        echo "<script>alert('Error In Adding supplier')</script>";
    }
    $sql="SELECT sl_no FROM inv_supplier WHERE supplier_name='$supplier_name' AND section_id='$section' AND supplier_status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);

    $supplier_id=$row['sl_no'];

    $sql="UPDATE inv_supplier
    SET supplier_id=$supplier_id
    WHERE supplier_name='$supplier_name' AND section_id='$section' AND supplier_status='1'"; 
    $conn->query($sql);

    if ($conn->query($sql) === TRUE) {
        echo "<center><br><br><br><br><br><br><br><br>New Item Added Successfully</center>";
        header("location:manage_supplier.php");
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
if($validation=="chng_pass")
{
    
    $id = $_POST['id'];
    $pass = $_POST['password'];
    $new_pass=$_POST['new_pass'];
    $pass_hash=md5($new_pass);
    $sql = "SELECT * FROM inv_admins WHERE id = '$id'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    if($row['password']==md5($pass))
    {
        $sql="UPDATE inv_admins 
        SET password='$pass_hash' WHERE id='$id'"; 
        $conn->query($sql);
        echo "<script>alert('Password Changed Successfully')</script>";
    }
    else{
        echo "<script>alert('Invalid Password or UserName')</script>";
    }
}
if($validation=="add_stock")
{
    $item_name = $_POST['item_name'];
    $sql = "SELECT item_name FROM inv_items WHERE item_name='$item_name'AND section_id='$section' AND status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    if($result->num_rows > 0)
    {

    $conformation=0;
    add_stock:

    $_SESSION['item_name']= $_POST['item_name'];
    $_SESSION['item_category']= $_POST['item_category'];
    $_SESSION['item_supplier'] = $_POST['item_supplier'];
    $_SESSION['item_sub_category']=$_POST['item_sub_category'];
    $_SESSION['item_supplier']=$_POST['item_supplier'];
    $_SESSION['order_no']=$_POST['order_no'];
    $_SESSION['order_date']=$_POST['order_date'];
    $_SESSION['total_tax']=$_POST['total_tax'];
    $_SESSION['bill_remarks']=$_POST['bill_remarks'];
    $_SESSION['total_bill_cost']=$_POST['total_bill_cost'];
    $_SESSION['total_cost']=$_POST['total_cost'];
    $_SESSION['item_unit']=$_POST['item_unit'];
    $_SESSION['item_price']=$_POST['item_price'];
    $_SESSION['item_selling_price']=$_POST['item_selling_price'];
    $_SESSION['total_units']=$_POST['total_units'];
    $_SESSION['item_tax']= $_POST['item_tax'];
    $_SESSION['invoice_no']=$_POST['invoice_no'];
    $_SESSION['invoice_date']=$_POST['invoice_date'];
    $_SESSION['invoice_no']=$_POST['invoice_no'];
    $_SESSION['transportation_cost']=$_POST['transportation_cost'];
    $_SESSION['remarks']=$_POST['remarks'];
    $_SESSION['item_code']=$_POST['item_code'];
    $_SESSION['barcode']=$_POST['barcode'];
    $item_name = $_SESSION['item_name'];
    $item_category = $_SESSION['item_category'];
    $item_supplier = $_SESSION['item_supplier'];
    $sub_category=$_SESSION['item_sub_category'];
    $item_supplier=$_SESSION['item_supplier'];
    $order_no=$_SESSION['order_no'];
    $order_date=$_SESSION['order_date'];
    $total_tax=$_SESSION['total_tax'];
    $bill_remarks=$_SESSION['bill_remarks'];
    $total_bill_cost=$_SESSION['total_bill_cost'];
    $total_cost=$_SESSION['total_cost'];
    $item_unit=$_SESSION['item_unit'];
    $item_price=$_SESSION['item_price'];
    $item_selling_price=$_SESSION['item_selling_price'];
    $total_units=$_SESSION['total_units'];
    $item_tax = $_SESSION['item_tax'];
    $invoice_no=$_SESSION['invoice_no'];
    $invoice_date=$_SESSION['invoice_date'];
    $invoice_no=$_SESSION['invoice_no'];
    $transportation_cost=$_SESSION['transportation_cost'];
    $remarks=$_SESSION['remarks'];
    $item_code=$_SESSION['item_code'];
    $barcode=$_SESSION['barcode'];
    if($conformation==1)
    {
        goto update;
    }
    $sql = "SELECT category_id FROM inv_category WHERE category_name='$item_category' AND section_id='$section' AND category_status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    $item_category=$row['category_id'];
    $sql = "SELECT category_id FROM inv_category WHERE category_name='$sub_category' AND section_id='$section' AND category_status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    $sub_category=$row['category_id'];
    $sql = "SELECT item_name, total_units, item_code, barcode FROM inv_stock WHERE item_name='$item_name' AND section_id='$section' AND status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    if($result->num_rows > 0)
    {
        $conformation=0;
        echo"<div class='error_div'><center>Item With Same Item Name Already Exist<br> Do you want to update the item.</div>
        <br><br><br><br><br><br>
        <center>
        <form method='post' action='validate.php'>
        <input type='text' name='validation' value='conformation' hidden readonly>
        <br>
        <input type='submit' class='submit_btn' value='Yes'></form>
        <button onclick='history.go(-1);'>Back </button></center>";
    }
    else
    {
        $sql = "SELECT item_name, total_units, item_code, barcode FROM inv_stock WHERE item_name='$item_name' AND section_id='$section' AND status='1'";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);
        if($row['item_name']==$item_name OR ($row['barcode']==$barcode AND $row['barcode']!=NULL))
        {
            
            if($row['item_name']==$item_name){echo"<center><div class='error_div'>Item With Same Item Name Already Exist</div><br><br><br><br><button onclick='history.go(-1);'>Back </button></center>";}
            if($row['barcode']==$barcode){echo"<center><div class='error_div'>Item With Same Barcode Already Exist</div><br><br><br><br><button onclick='history.go(-1);'>Back </button></center>";}
        }
        else
        {
        //Adding New Stocks
        $sql="INSERT INTO inv_stock (item_name,category_id,sub_category_id,total_cost,unit,mrp,selling_price,total_units,tax_percent,transportation_cost,invoice_no,status,remarks,barcode,section_id,supplier,order_no,order_date,invoice_date)
        VALUES ('$item_name','$item_category','$sub_category','$total_cost','$item_unit','$item_price','$item_selling_price','$total_units','$item_tax','$transportation_cost','$invoice_no','1','$remarks','$barcode','$section','$item_supplier','$order_no','$order_date','$invoice_date')";
        $conn->query($sql);
        $sql = "SELECT sl_no FROM inv_stock WHERE item_name='$item_name' AND section_id='$section' AND status='1'";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);
        $sl_no=$row['sl_no'];
        $sql="UPDATE inv_stock
        SET item_code='$sl_no' WHERE item_name='$item_name' AND section_id='$section' AND status='1'";
        $conn->query($sql);
        $sql = "SELECT invoice_no FROM inv_purchase_log WHERE invoice_no='$invoice_no' AND section_id='$section'";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);
        if($result->num_rows == 0)
        {
            $sql="INSERT INTO inv_purchase_log (invoice_no,total_cost,total_tax,supplier,section_id,remarks)
            VALUES ('$invoice_no','$total_bill_cost','$total_tax','$item_supplier','$section','$bill_remarks')";
            $conn->query($sql);
        }
        header("location:add_stock.php");
    }
    }
    }
    else
    {
        echo "<center><br><br><br><br>Item Does Not Exist!<br>Go To Settings And Create New Item</center>";
    }
}
if($validation=="conformation")
{
    //Updating Stocks
    $conformation=1;
    update:
    $item_name = $_SESSION['item_name'];
    $item_category = $_SESSION['item_category'];
    $item_supplier = $_SESSION['item_supplier'];
    $sub_category=$_SESSION['item_sub_category'];
    $item_supplier=$_SESSION['item_supplier'];
    $order_no=$_SESSION['order_no'];
    $order_date=$_SESSION['order_date'];
    $total_tax=$_SESSION['total_tax'];
    $bill_remarks=$_SESSION['bill_remarks'];
    $total_bill_cost=$_SESSION['total_bill_cost'];
    $total_cost=$_SESSION['total_cost'];
    $item_unit=$_SESSION['item_unit'];
    $item_price=$_SESSION['item_price'];
    $item_selling_price=$_SESSION['item_selling_price'];
    $total_units=$_SESSION['total_units'];
    $item_tax = $_SESSION['item_tax'];
    $invoice_no=$_SESSION['invoice_no'];
    $invoice_date=$_SESSION['invoice_date'];
    $invoice_no=$_SESSION['invoice_no'];
    $transportation_cost=$_SESSION['transportation_cost'];
    $remarks=$_SESSION['remarks'];
    $item_code=$_SESSION['item_code'];
    $barcode=$_SESSION['barcode'];
    $sql = "SELECT category_id FROM inv_category WHERE category_name='$item_category' AND section_id='$section' AND category_status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    $item_category=$row['category_id'];
    $sql = "SELECT category_id FROM inv_category WHERE category_name='$sub_category' AND section_id='$section' AND category_status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    $sub_category=$row['category_id'];
    $sql = "SELECT total_units FROM inv_stock WHERE (item_code='$item_code' OR item_name='$item_name') AND section_id='$section' AND status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    $new_units=$row['total_units']+$total_units;
    $sql="UPDATE inv_stock
    SET item_name='$item_name', category_id='$item_category',sub_category_id='$sub_category', total_units='$new_units',total_cost='$total_cost', barcode='$barcode', unit='$item_unit', mrp='$item_price', selling_price='$item_selling_price', tax_percent='$item_tax', transportation_cost='$transportation_cost',section_id='$section',supplier='$item_supplier',order_no='$order_no',order_date='$order_date',invoice_no='$invoice_no',invoice_date='$invoice_date',status='1',reference_no=NULL,remarks='$remarks'
    WHERE item_code='$item_code' AND section_id='$section' AND status='1'";
    $conn->query($sql);
    $sql = "SELECT invoice_no FROM inv_purchase_log WHERE invoice_no='$invoice_no' AND section_id='$section'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    if($result->num_rows == 0)
    {
        $sql="INSERT INTO inv_purchase_log (invoice_no,total_cost,total_tax,supplier,section_id,remarks)
        VALUES ('$invoice_no','$total_bill_cost','$total_tax','$item_supplier','$section','$bill_remarks')";
        $conn->query($sql);
    }
    header("location:add_stock.php");
}
if($validation=="add_category")
{  
$category_name=$_POST['category_name'];
$category_description=$_POST['category_description'];
$category_remarks=$_POST['category_remarks'];
$category_status=1;
$category_type=$_POST['category_type'];
    $sql = "SELECT * FROM inv_category WHERE category_name = '$category_name' AND section_id='$section' AND category_status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    if($result->num_rows > 0)
    {
        echo"<script>alert('Category Already Exists')</script>";
        echo"<center><br><br><br><br><button onclick='history.go(-1);'>Back </button></center>";
    }
    else
    {
    if($category_type==0)
    {
        $sql="INSERT INTO inv_category (category_name,category_description,category_remarks,category_status,category_type,section_id) VALUES ('$category_name','$category_description','$category_remarks','$category_status','$category_type','$section')";
        $conn->query($sql);
        $sql="UPDATE inv_category
        SET category_id = sl_no
        WHERE category_name = '$category_name' AND section_id='$section' AND category_status='1'";
        $conn->query($sql);
    }
    else
    {
        $category_select=$_POST['category_select'];
        $sql = "SELECT * FROM inv_category WHERE category_name = '$category_select' AND section_id='$section' AND category_status='1'";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);
        $category_prefix=$row['category_id'];
        $sql="INSERT INTO inv_category (category_name,category_description,category_remarks,category_status,category_type,category_prefix,section_id) VALUES ('$category_name','$category_description','$category_remarks','$category_status','$category_type','$category_prefix','$section')";
        $conn->query($sql);
        $sql="UPDATE inv_category
        SET category_id = sl_no
        WHERE category_name = '$category_name' AND section_id='$section' AND category_status='1'";
        $conn->query($sql);
    }
    if ($conn->query($sql) === TRUE) {
        echo "<script>alert('Added Successfully')</script>";
        header("location:add_category.php");
    }
    else
    {
        echo "<script>alert('Category Not Added')</script>";
        header("location:add_category.php");
    }
    }
}
if($validation=="edit_category")
{
    $edit_name=$_POST['edit_name'];
    $edit_category_id=$_POST['sl'];
    $edit_description=$_POST['edit_description'];
    $edit_remarks=$_POST['edit_remarks'];
    $sql = "SELECT category_type, category_prefix FROM inv_category
    WHERE category_id = '$edit_category_id' AND section_id='$section' AND category_status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    $category_type=$row['category_type'];
    $category_prefix=$row['category_prefix'];
    $sql="INSERT INTO inv_category (category_name,category_description,category_remarks,category_status,category_type,section_id)
    VALUES ('$edit_name','$edit_description','$edit_remarks','1','$category_type','$section')";
    $conn->query($sql);
    $sql="UPDATE inv_category
    SET category_id=NULL, reference_no='$edit_category_id', category_status='0'
    WHERE category_id='$edit_category_id' AND section_id='$section' AND category_status='1'";
    $conn->query($sql);
    $sql="UPDATE inv_category
    SET category_id = sl_no
    WHERE category_name = '$edit_name' AND section_id='$section' AND category_status='1'";
    $conn->query($sql);
    if($category_type==1)
    {
        $sql="UPDATE inv_category
        SET category_prefix = $category_prefix
        WHERE category_name = '$edit_name' AND section_id='$section' AND category_status='1'";
        $conn->query($sql);
    }
    $sql="INSERT INTO inv_history (reference_no,changed_from,changed_by,section_id,remarks) VALUES ('$edit_category_id','inv_category','$admin','$section','edited')";
    $conn->query($sql);
    header("location:add_category.php");
}
if($validation=="edit_sub_category")
{
    $edit_name=$_POST['edit_name'];
    $edit_category_id=$_POST['sl'];
    $edit_description=$_POST['edit_description'];
    $edit_remarks=$_POST['edit_remarks'];
    $sql = "SELECT category_type, category_prefix FROM inv_category
    WHERE category_id = '$edit_category_id' AND section_id='$section' AND category_status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    $category_type=$row['category_type'];
    $category_prefix=$row['category_prefix'];
    $sql="INSERT INTO inv_category (category_name,category_description,category_remarks,category_status,category_type,section_id)
    VALUES ('$edit_name','$edit_description','$edit_remarks','1','$category_type','$section')";
    $conn->query($sql);
    $sql="UPDATE inv_category
    SET category_id=NULL, reference_no='$edit_category_id', category_status='0'
    WHERE category_id='$edit_category_id' AND section_id='$section' AND category_status='1'";
    $conn->query($sql);
    $sql="UPDATE inv_category
    SET category_id = sl_no
    WHERE category_name = '$edit_name' AND section_id='$section' AND category_status='1'";
    $conn->query($sql);
    if($category_type==1)
    {
        $sql="UPDATE inv_category
        SET category_prefix = $category_prefix
        WHERE category_name = '$edit_name' AND section_id='$section' AND category_status='1'";
        $conn->query($sql);
    }
    $sql="INSERT INTO inv_history (reference_no,changed_from,changed_by,section_id,remarks) VALUES ('$edit_category_id','inv_category','$admin','$section','edited')";
    $conn->query($sql);
    header("location:manage_sub_category.php");
}
if($validation=="edit_supplier")
{
    $supplier_name_new=$_POST['supplier_name'];
    $supplier_name=$_POST['backup'];
    $supplier_address=$_POST['supplier_address'];
    $supplier_email=$_POST['supplier_email'];
    $supplier_contact_name=$_POST['supplier_contact_name'];
    $supplier_phone_no=$_POST['supplier_phone_no'];
    $supplier_mob_no=$_POST['supplier_mob_no'];
    $supplier_remarks=$_POST['supplier_remarks'];
    $supplier_gst_no=$_POST['supplier_gst_no'];
    $supplier_account_no=$_POST['supplier_account_no'];
    $supplier_bank=$_POST['supplier_bank'];
    $supplier_branch=$_POST['supplier_branch'];
    $supplier_ifsc_no=$_POST['supplier_ifsc_no'];
    $sql="INSERT INTO inv_supplier (supplier_name,supplier_address,supplier_email,supplier_contact_name,supplier_mob_no,section_id,supplier_status,supplier_remarks)
    VALUES ('$supplier_name_new','$supplier_address','$supplier_email','$supplier_contact_name','$supplier_mob_no','$section','1','$supplier_remarks')";
    $conn->query($sql);
    $sql="UPDATE inv_supplier
    SET supplier_id= sl_no
    WHERE supplier_name='$supplier_name_new' AND section_id='$section' AND supplier_status='1'"; 
    $conn->query($sql);
    $sql = "SELECT supplier_id FROM inv_supplier
    WHERE supplier_name='$supplier_name' AND section_id='$section' AND supplier_status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    $supplier_id=$row['supplier_id'];
    $sql="UPDATE inv_supplier
    SET supplier_id=NULL, reference_no='$supplier_id', supplier_status='0'
    WHERE supplier_name='$supplier_name' AND section_id='$section' AND supplier_status='1'";
    $conn->query($sql);
    $sql="INSERT INTO inv_history (reference_no,changed_from,changed_by,section_id,remarks) VALUES ('$supplier_id','inv_supplier','$admin','$section','edited')";
    $conn->query($sql);
    header("location:add_supplier.php");
}
if($validation=="item_distribution")
{
    $item_name = $_POST['search'];
    $sql = "SELECT * FROM inv_stock WHERE section_id='$section' AND item_name='$item_name' AND status='1' LIMIT 1";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    $item_name=$row['item_name'];
    $item_code=$row['item_code'];
    $item_mrp=$row['mrp'];
    $item_selling_price=$row['selling_price'];
    $item_discount=$item_mrp-$item_selling_price;
    $stock_quantity=$row['total_units'];
    $sql = "SELECT item_quantity FROM inv_current_bill WHERE item_name = '$item_name' AND item_code='$item_code' AND admin_id='$admin' AND section_id='$section'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    if($row['item_quantity']!=NULL)
    {
        $sql="UPDATE inv_current_bill
        SET item_quantity = item_quantity + 1
        WHERE item_name = '$item_name' AND item_code='$item_code' AND admin_id='$admin' AND section_id='$section'";
        $conn->query($sql);
        header( "location:distribution.php" );
    }
    else
    {
        if($stock_quantity>0)
        {
            $sql="INSERT INTO inv_current_bill (item_name,item_code,item_mrp,item_selling_price,item_discount,admin_id,section_id)
            VALUES ('$item_name','$item_code','$item_mrp','$item_selling_price','$item_discount','$admin','$section')";
            if ($conn->query($sql) === TRUE) {
                header( "location:distribution.php" );
            }
            else
            {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }
        }
        else
        {
                echo "<center>Item quantity is empty in stock<br><br>
                <input type='submit' class='back_btn' value='Back' onclick=location.href='distribution.php'></center>";
        }
    }
}
if($validation=="bill_update_name")
{
    $item_name = $_POST['item_name'];
    $item_code = $_POST['item_code'];
    $sql="UPDATE inv_current_bill
    SET item_name='$item_name' WHERE item_code='$item_code' AND admin_id='$admin' AND section_id='$section'";
    $conn->query($sql);  
}
if($validation=="bill_update_code")
{
    $item_code = $_POST['item_code'];
    $item_code_new = $_POST['item_code_new'];
    $sql="UPDATE inv_current_bill
    SET item_code='$item_code_new' WHERE item_code='$item_code' AND admin_id='$admin' AND section_id='$section'";
    $conn->query($sql);  
}
if($validation=="bill_update_quantity")
{
    $item_quantity = $_POST['item_quantity'];
    $item_code = $_POST['item_code'];
    $sql="UPDATE inv_current_bill
    SET item_quantity='$item_quantity' WHERE item_code='$item_code' AND admin_id='$admin' AND section_id='$section'";
    $conn->query($sql);  
}
if($validation=="bill_update_mrp")
{
    $item_mrp = $_POST['item_mrp'];
    $item_code = $_POST['item_code'];
    $sql="UPDATE inv_current_bill
    SET item_mrp='$item_mrp' WHERE item_code='$item_code' AND admin_id='$admin' AND section_id='$section'";
    $conn->query($sql);  
}
if($validation=="bill_update_selling_price")
{
    $item_selling_price = $_POST['item_selling_price'];
    $item_code = $_POST['item_code'];
    $sql="UPDATE inv_current_bill
    SET item_selling_price='$item_selling_price' WHERE item_code='$item_code' AND admin_id='$admin' AND section_id='$section'";
    $conn->query($sql);  
}

if($validation=="bill_update_remarks")
{
    $remarks = $_POST['remarks'];
    $item_code = $_POST['item_code'];
    $sql="UPDATE inv_current_bill
    SET remarks='$remarks' WHERE item_code='$item_code' AND admin_id='$admin' AND section_id='$section'";
    $conn->query($sql);  
}
if($validation=="bill_item_delete")
{
    $item_code = $_POST['item_code'];
    $sql="DELETE FROM inv_current_bill WHERE item_code='$item_code' AND admin_id='$admin' AND section_id='$section'";
    $conn->query($sql);  
}
if($validation=="sales_purchase_report")
{
    $sql = "SELECT * FROM inv_sales_log"; 
    $result = mysqli_query($conn, $sql);
    $row = mysqli_num_rows($result); 
    $sql = "SELECT SUM(`total_cost`) AS value_sum FROM inv_sales_log";
    $result = mysqli_query($conn, $sql); 
   //Total cost
    while ($row1 = $result->fetch_assoc()) {
        $total=(int)$row1['value_sum']."<br>";
        $avg=(int)$total/12;
        $avg_sale=number_format((float)$avg, 2, '.', '');
    }
    //Profit
    $query = "SELECT SUM(`total_cost`) AS value_sum FROM inv_sales_log";
    $result = mysqli_query($conn, $query); 
    while ($row1 = $result->fetch_assoc()) {
        $profit=$row1['value_sum']."<br>";
    }
    ///Total purchased items
    $sql = "SELECT * FROM inv_purchase_log"; 
    $result = mysqli_query($conn, $sql);
    $row_purchase = mysqli_num_rows($result);
    $sql = "SELECT SUM(`total_cost`) AS value_sum FROM inv_purchase_log";
    $result = mysqli_query($conn, $sql); 
    while ($row1 = $result->fetch_assoc()) {
        $total_purchase=$row1['value_sum']."<br>";
        $avg_purchase=(int)$total_purchase/12;
        $avg_purchase=number_format((float)$avg_purchase, 2, '.', '');
    }
    $total_profit=(int)$total-(int)$total_purchase;
    echo"
        <div class='report_div'>
        <table class='div_sales_report'>
        <th>Sales <br></th>
        <tr>
            <td><br>No Of Sales : <br></td>
            <td><br>$row<br></td>
        </tr>
        <!--<tr>
            <td>Total Sales : </td>
            <td><br>".$total."<br></td>
        </tr>
        <tr></tr>
        <tr></tr>
        <tr>
            <td>Total Profit : </td>
            <td> $total_profit</td>
        </tr>-->
        </table>
        
        <table class='div_purchase_report'>
        <th>Purchase</th>
        <tr>
            <td><br>No Of Purchase :<br></td>
            <td><br>$row_purchase <br></td>
        </tr>
        <tr>
            <td>Total Purchase Cost : </td>
            <td><br>$total_purchase<br></td>
        </tr>
        </table>
        <br>
        <br><center><input type='button' class='print_btn' value='Print' onclick='javascript:window.print()'></center>
        </div>";
}
if($validation=="add_item")
{
    $item_name=$_POST['item_name'];
    $item_added_by=$_SESSION['admin'];
    $item_remarks=$_POST['item_remarks'];
    $item_alert1=$_POST['item_alert1'];
    $item_alert2=$_POST['item_alert2'];
    $max_expected=$_POST['max_expected'];
    if (is_numeric($item_alert1)&&is_numeric($item_alert2))
    {
        if($item_alert1<$item_alert2)
        {
            echo "<script>alert('Alert Level 1 Must be Greater than Alert Level2')</script>";
            echo"<br><br><br><br<br><br><br><br>><center><input type='submit' class='back_btn' value='Back' onclick='history.go(-1);'></center>";
        }
        else
        {
    $sql = "SELECT item_name FROM inv_items where item_name='$item_name' AND section_id='$section' AND status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);

    if($result->num_rows > 0)
    {
        echo "<center><br><br><br><br>Item already exist.<br><br>
                <input type='submit' class='back_btn' value='Back' onclick=location.href='add_item.php'></center>";
    }
    else
    {
    $sql="INSERT INTO inv_items (item_name,section_id,added_by,item_alert1,item_alert2,max_expected,status,remarks)
    VALUES ('$item_name','$section','$item_added_by','$item_alert1','$item_alert2','$max_expected','1','$item_remarks')";
    if ($conn->query($sql) === TRUE) {
       
        $sql="UPDATE inv_items
        SET item_id = sl_no
        WHERE section_id='$section'";
        $conn->query($sql);
        
        header( "location:add_item.php" );
    }
    else
    {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    }
        }
}
else
{
    echo "<script>alert('Alert Level Must be an integer')</script>";
    echo"<br><br><br><br><br><br><br><br><center><br><br><br><br><button onclick='history.go(-1);'>Back </button></center>"; 
}
}
if($validation=="edit_stock")
{
    $item_name = $_POST['item_name'];
    $item_name_new = $_POST['item_name_new'];
    $item_description=$_POST['item_description'];
    $item_category = $_POST['item_category'];
    $sub_category=$_POST['item_sub_category'];
    $item_supplier=$_POST['item_supplier'];
    $order_no=$_POST['order_no'];
    $order_date=$_POST['order_date'];
    $total_cost=$_POST['total_cost'];
    $item_unit=$_POST['item_unit'];
    $item_price=$_POST['item_price'];
    $item_selling_price=$_POST['item_selling_price'];
    $total_units=$_POST['total_units'];
    $item_tax = $_POST['item_tax'];
    $invoice_no=$_POST['invoice_no'];
    $invoice_date=$_POST['invoice_date'];
    $transportation_cost=$_POST['transportation_cost'];
    $remarks=$_POST['item_remarks'];
    $item_code=$_POST['item_code'];
    $item_code_new=$_POST['item_code_new'];
    $barcode=$_POST['item_barcode'];
    $alert_level_1=$_POST['item_alert_level_1'];
    $alert_level_2=$_POST['item_alert_level_2'];
    $max_expected=$_POST['item_max_expected'];
    if($alert_level_1<$alert_level_2){
        echo "<center><br><br><br><br><br><br><br><br>Alert 1 must be greater than Alert 2<br><br><br><br><button onclick='history.go(-1);'>Back </button></center>";
    }
    else{
    $sql = "SELECT category_id FROM inv_category WHERE category_name='$item_category' AND section_id='$section' AND category_status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    $item_category=$row['category_id'];
    $sql = "SELECT category_id FROM inv_category WHERE category_name='$sub_category' AND section_id='$section' AND category_status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    $sub_category=$row['category_id'];
    $sql="UPDATE inv_stock
    SET item_code=NULL, reference_no='$item_code', status='0'
    WHERE item_code='$item_code' AND section_id='$section' AND status='1'";
    $conn->query($sql);
    $sql="UPDATE inv_items
    SET item_name='$item_name_new'
    WHERE item_name='$item_name' AND section_id='$section' AND status='1'";
    $conn->query($sql);
    $sql="UPDATE inv_items
    SET item_alert1=$alert_level_1, item_alert2=$alert_level_2, max_expected='$max_expected'
    WHERE item_name='$item_name' AND section_id='$section' AND status='1'";
    $conn->query($sql);
    $sql="INSERT INTO inv_stock (item_name,item_code,category_id,sub_category_id,item_description,total_cost,unit,mrp,selling_price,total_units,tax_percent,transportation_cost,invoice_no,status,remarks,barcode,section_id,supplier,order_no,order_date,invoice_date)
    VALUES ('$item_name_new','$item_code_new','$item_category','$sub_category','$item_description','$total_cost','$item_unit','$item_price','$item_selling_price','$total_units','$item_tax','$transportation_cost','$invoice_no','1','$remarks','$barcode','$section','$item_supplier','$order_no','$order_date','$invoice_date')";
    $conn->query($sql);
    $sql="INSERT INTO inv_history (reference_no,changed_from,changed_by,section_id,remarks) VALUES ('$item_code','inv_stock','$admin','$section','edited')";
    $conn->query($sql);
    header( "location:stock_management.php");
}
}
if($validation=='alert_level')
{
    $sql = "SELECT * FROM inv_items WHERE section_id='$section' AND status='1'";
    $result = $conn->query($sql);
    if ($result->num_rows > 0)
    {
    echo "<br><br><br><br><div class='alert_level_1_div'>Below Alert level 1: <br><br><br><br>";
    while($row = $result->fetch_assoc()) 
    {
       $item_check=$row['Item_name'];
       $alert_level_1=$row['item_alert1'];
       $alert_level_2=$row['item_alert2'];
       $sql = "SELECT * FROM inv_stock WHERE item_name='$item_check' AND section_id='$section' AND status='1'";
        $result1 = $conn->query($sql);
            $row1 = $result1->fetch_assoc();
               if($row1['total_units']<$alert_level_1)
               {   
                 echo $row1['item_name']."<br>";
               }
    }
    echo "</div>";
    }
    $sql = "SELECT * FROM inv_items WHERE section_id='$section' AND status='1'";
    $result = $conn->query($sql);
    if ($result->num_rows > 0)
    {
    echo "<div class='alert_level_2_div'>Below Alert level 2: <br><br><br><br>";
    while($row = $result->fetch_assoc()) 
    {
       $item_check=$row['Item_name'];
       $alert_level_2=$row['item_alert2'];
       $sql = "SELECT * FROM inv_stock where item_name='$item_check' AND section_id='$section' AND status='1'";
        $result1 = $conn->query($sql);
            $row1 = $result1->fetch_assoc();
               if($row1['total_units']<$alert_level_2)
               {   
                 echo $row1['item_name']."<br>";
               }
    }
    echo"</div>";
    }
}
if($validation=='dict_log')
{
$user_name=$_POST['user_name'];
$sql="INSERT INTO inv_distribution (dist_user_id)
VALUES ('$user_name')";
if ($conn->query($sql) === TRUE) {
    header( "location:distribution.php" );
}
else
{
    echo "Error: " . $sql . "<br>" . $conn->error;
}
}
if($validation=='dist_settings')
{
    $type=$_POST['type'];
    $sql= "SELECT * FROM inv_admins where id='$admin'";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    $value=$row['admin_type'];
    if($value==0)
    {
    $sql = "SELECT * FROM inv_type where cat_type='$type'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
        if($result->num_rows > 0)
        {
            echo "<center><br><br><br><br>Item already exist.<br><br>
                    <input type='submit' class='back_btn' value='Back' onclick=location.href='Dist_settings.php'></center>";
        }
        else
        {
            $sql="INSERT INTO inv_type (cat_type,section)
            VALUES ('$type','$section')";
            if ($conn->query($sql) === TRUE)
            {
                header( "location:department_sub_section.php" );
            }
            else
            {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }
        }
}
else
{
    echo "<center><br><br><br><br>Permission Denied</center>";
}
}
if($validation=='stock_report')
{
    echo"<input type='button' class='print_btn' value='Print' onclick='javascript:window.print()'><br><br><br><br>";
    $sql="SELECT * FROM inv_stock where section_id='$section' and status=1 ";
        if($result = mysqli_query($conn, $sql))
        {
            if(mysqli_num_rows($result) > 0)
            {
                $sl_no=1;
                echo "<table>";
                echo "<tr>";
                echo "<th>Sl No</th>";
                echo "<th>Item Name</th>";
                echo "<th>Item Code</th>";
                echo "<th>Invoice No</th>";
                echo "<th>Date Updated</th>";
                echo "<th>Units</th>";
                echo "</tr>";
                while($row = mysqli_fetch_array($result))
                {
                    echo "<tr>";
                    echo "<td>" .$sl_no. "</td>";
                    echo "<td>" . $row['item_name'] . "</td>";
                    echo "<td>" . $row['item_code'] . "</td>";
                    echo "<td>" . $row['invoice_no'] . "</td>";
                    echo "<td>" . substr($row['date_updated'],0,10) . "</td>";
                    echo "<td>" . $row['total_units'] . "</td>";
                    echo "</tr>";
                    $sl_no++;
                }
                echo "</table>";
                mysqli_free_result($result);
            }
        }
}
if($validation=='purchase_report')
{
    echo"<input type='button' class='print_btn' value='Print' onclick='javascript:window.print()'><br><br><br><br>";
    $sql="SELECT * FROM inv_purchase_log where section_id='$section'";
        if($result = mysqli_query($conn, $sql)){
            if(mysqli_num_rows($result) > 0){
                echo "<table>";
                    echo "<tr>";
                        echo "<th>Sl No</th>";
                        echo "<th>Invoice no</th>";
                        echo "<th>Date</th>";
                        echo "<th>Supplier</th>";
                        echo "<th>Total Cost (Including tax)</th>";
                        echo "<th>Total Tax</th>";
                        echo "<th>Remarks</th>";
                    echo "</tr>";
                while($row = mysqli_fetch_array($result)){
                    echo "<tr>";
                    $date=date("Y-m-d",strtotime($row['date']));
                        echo "<td>" . $row['sl_no'] . "</td>";
                        echo "<td>" . $row['invoice_no'] . "</td>";
                        echo "<td>" . $date . "</td>";
                        echo "<td>" . $row['supplier'] . "</td>";
                        echo "<td>" . $row['total_cost'] . "</td>";
                        echo "<td>" . $row['total_tax'] . "</td>";
                        echo "<td>" . $row['remarks'] . "</td>";
                    echo "</tr>";
                }
                echo "</table>";
                mysqli_free_result($result);
            }
        }
     }
     if($validation=='stock_request')
     {
        $item_name=$_POST['item_name'];
        $remarks=$_POST['remarks'];
        $sql1= "SELECT * FROM inv_admins where id='$admin'";
        $result1 = $conn->query($sql1);
        $row1 = $result1->fetch_assoc();
        $added_by=$row1['id'];
        
        $sql="INSERT INTO inv_stock_request (item_name,remarks,added_by,section) VALUES ('$item_name','$remarks','$added_by','$section')";
        
      $conn->query($sql);
        header("Location: stock_request.php");
     }
CloseCon($conn);
function conformation($conformation)
{
    $conformation=1;
    return $conformation;
}
}
?>