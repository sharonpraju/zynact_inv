<?php
include('db_connection.php');
session_start();
if(!isset($_SESSION['admin']))
{
    header("location:index.html");
}
else
{
$admin=$_SESSION['admin'];
$section=$_SESSION['section'];
$conn = OpenCon();
if (isset($_GET['id']))
{
$id = $_GET['id'];
$id=preg_replace('/[^A-Za-z0-9_\-]/', '', $id);
$page=$_GET['page'];
preg_replace('/[^A-Za-z0-9\-]/', '', $page);
if($page=='supplier')
{
    $sql = "SELECT supplier_id FROM inv_supplier WHERE supplier_id='$id' AND section_id='$section' AND supplier_status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    $supplier_id=$row['supplier_id'];
    $sql="UPDATE inv_supplier
    SET supplier_status='9',reference_no='$supplier_id'
    WHERE supplier_id = '$supplier_id' AND section_id='$section' AND supplier_status='1'";
    $conn->query($sql);
    if ($conn->query($sql) === TRUE) {
    }
    else
    {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    $sql="INSERT INTO inv_history (reference_no,changed_from,changed_by,section_id,remarks) VALUES ('$supplier_id','inv_supplier','$admin','$section','deleted')";
    $conn->query($sql);
    header("Location: manage_supplier.php");
}
if($page=='category')
{
    $sql = "SELECT category_id FROM inv_category WHERE category_name = '$id' AND section_id='$section' AND category_status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    $category_id=$row['category_id'];
    $sql="UPDATE inv_category
    SET category_status='9',reference_no='$category_id'
    WHERE category_id = '$category_id' AND section_id='$section' AND category_status='1'";
    $conn->query($sql);
    $sql="INSERT INTO inv_history (reference_no,changed_from,changed_by,section_id,remarks) VALUES ('$category_id','inv_category','$admin','$section','deleted')";
    $conn->query($sql);
    header("Location: add_category.php");
}
if($page=='sub_category')
{
    $sql = "SELECT category_id FROM inv_category WHERE category_name = '$id' AND section_id='$section' AND category_status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    $category_id=$row['category_id'];
    $sql="UPDATE inv_category
    SET category_status='0',reference_no='$category_id'
    WHERE category_id = '$category_id' AND section_id='$section' AND category_status='1'";
    $conn->query($sql);
    $sql="INSERT INTO inv_history (reference_no,changed_from,changed_by,section_id,remarks) VALUES ('$category_id','inv_category','$admin','$section','deleted')";
    $conn->query($sql);
    header("Location: manage_sub_category.php");
}
if($page=='stock')
{
    $item_code=$id;
    $sql="UPDATE inv_stock
    SET item_code=NULL,status='0',reference_no='$item_code'
    WHERE item_code = '$item_code' AND section_id='$section' AND status='1'";
    $conn->query($sql);
    $sql="INSERT INTO inv_history (reference_no,changed_from,changed_by,section_id,remarks) VALUES ('$item_code','inv_stock','$admin','$section','deleted')";
    $conn->query($sql);
    header("Location: stock_management.php");
}
if($page=="request")
{
    $item_name=$id;
    $sql="UPDATE inv_stock_request
    SET status='0' where item_name='$item_name'";
    $conn->query($sql);
    header("Location: stock_request.php");
}
}
$conn->close();
}
?>