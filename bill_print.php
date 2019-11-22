<?php
session_start();
if(!isset($_SESSION['section']))
header("location:index.html");
die();
$section=$_SESSION['section'];
$admin=$_SESSION['admin'];
include 'db_connection.php';
$conn = OpenCon();
$sql = "SELECT * FROM inv_config";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);
$name=$row['organisation'];
$address=$row['address'];
$phone=$row['phone_number'];
$email=$row['email'];
$gst_in=$row['gst_in'];
$dist_user_id=$_POST['dist_user_id'];
$dist_issued_to=$_POST['dist_issued_to'];
$dist_place=$_POST['dist_place'];
$dist_issued_on=$_POST['invoice_date'];
$dist_remarks=$_POST['Remarks'];
$indent=$_POST['intent'];
$stock_no=$_POST['stock_no'];

$sql="SELECT branch FROM user_details WHERE user_name='$dist_user_id'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);
$department=$row['branch'];

echo"
<link rel='stylesheet' href='css/bill_print.css'>
<br><br><br><br><br><br>
<div class='main_div' id='main_div'>
<center>
<table>
        <tr class='bill_title'>
            <th class='bill_title'><img src='img/mbc_logo.png' alt='logo'></th>
            <th colspan='5' >".$name."<br></th>
        </tr>
        <tr>
            <td class='bill_title' colspan='6'>
            ".$address."<br>
            <b>Phone No:</b>&nbsp;".$phone."<br>
            <b>Email:</b>&nbsp;".$email."<br>
            <b>GST IN:</b>&nbsp;".$gst_in."<br>
            <b>Invoice No:</b> xxxxxx
            </td>
        </tr>
        <tr> 

        </tr>

        <tr>
            <th>Sl No</th>
            <th>Item Name</th>
            <th>Qty</th>
            <th>MRP</th>
            <th>Rate</th>
            <th>Total</th>
        </tr>";
?>
<?php
$sql = "SELECT * FROM inv_current_bill WHERE section_id='$section'";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);
$id=0;
$item_discount=0;
$total=0;
    do{
        $item_name=$row['item_name'];
        $item_code=$row['item_code'];
        $item_mrp=$row['item_mrp'];
        $item_quantity=$row['item_quantity'];
        $item_selling_price=$row['item_selling_price'];
        $total_cost=$item_selling_price*$item_quantity;
        $item_discount=$item_discount+(($item_mrp-$item_selling_price)*$item_quantity);
    

            $sql = "UPDATE inv_stock
            SET total_units = total_units-$item_quantity
            WHERE item_name ='$item_name' AND item_code='$item_code' AND section_id='$section'";
            $conn->query($sql);
        $id++;
        echo"
        <tr>
            <td>".$id."</td>
            <td class='item_name'>".$row['item_name']."</td>
            <td>".$row['item_quantity']."</td>
            <td>".$row['item_mrp']."</td>
            <td>".$row['item_selling_price']."</td>
            <td>".$total_cost."</td>
        </tr>
        <span></span>";

        $sql="INSERT INTO inv_sales_log (item_name,item_code,unit_mrp,unit_price,total_units,total_cost,admin_id,section_id)
    VALUES ('$item_name','$item_code','$item_mrp','$item_selling_price','$item_quantity','$total_cost','$admin','$section')";
    if ($conn->query($sql) === TRUE) {
    }
    else
    {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    $total=$total+$total_cost;
    }while($row = mysqli_fetch_array($result));
    $sql="SELECT bill_no FROM inv_sales_log WHERE section_id='$section' ORDER BY bill_no DESC LIMIT 1";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    $bill_no=$row['bill_no'];


    $sql="INSERT INTO inv_distribution (dist_user_id,dist_bill_no,section_id,dist_issued_to,dist_place,dist_issued_by,dist_issued_on,place,remarks,department,dist_indent_no,stock_no)
    VALUES ('$dist_user_id','$bill_no','$section','$dist_issued_to','$dist_place','$admin','$dist_issued_on','$dist_place','$dist_remarks','$department','$indent','$stock_no')";
    $conn->query($sql);

    $sql = "TRUNCATE TABLE inv_current_bill";
    $result = mysqli_query($conn, $sql);
   

    ?>

        <tr>
            <td colspan='2'><br><br>Discount</td>
            <td colspan='4'><br><br><?php echo $item_discount; ?></td>
        </tr>
        <tr>
            <td colspan='2'>Tax Amount</td>
            <td colspan='4'>#demo</td>
        </tr>
        <tr>
            <td colspan='2'>Total</td>
            <td colspan='4'><?php echo $total; ?></td>
        </tr>
        <tr>
            <td colspan='6'>..Thanks for shopping..<br>.Visit Again.</td>
        </tr>
        </center>
</div>
        <input type='button' class='submit_dist' value='Print' onclick="javascript:window.print()">
        <br>
        <input type='submit' class='submit_dist1' value='Back' onclick="window.location.href='distribution.php'">