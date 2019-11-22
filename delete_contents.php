<?php

// connect to the database
include('db_connection.php');
session_start();
if(!isset($_SESSION['section']))
header("location:index.html");
$admin=$_SESSION['admin'];
$section=$_SESSION['section'];

$conn = OpenCon();

// confirm that the 'id' variable has been set
if (isset($_GET['id']))
{

// get the 'id' variable from the URL
$id = $_GET['id'];
$id=preg_replace('/[^A-Za-z0-9_\-]/', '', $id);
$page=$_GET['page'];
preg_replace('/[^A-Za-z0-9\-]/', '', $page);
if($page=='supplier')
{
    $sql = "SELECT supplier_id FROM inv_supplier WHERE supplier_name = '$id' AND section_id='$section' AND supplier_status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);

    $supplier_id=$row['supplier_id'];

    $sql="UPDATE inv_supplier
    SET supplier_status=0,reference_no='$supplier_id',supplier_id=NULL
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
    header("Location: add_supplier.php");
}
if($page=='category')
{
    $sql = "SELECT category_id FROM inv_category WHERE category_name = '$id' AND section_id='$section' AND category_status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);

    $category_id=$row['category_id'];

    $sql="UPDATE inv_category
    SET category_id=NULL,category_status='0',reference_no='$category_id'
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
    SET category_id=NULL,category_status='0',reference_no='$category_id'
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

}
$conn->close();
?>