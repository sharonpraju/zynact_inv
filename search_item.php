<?php
session_start();
if(!isset($_SESSION['admin']))
{
    header("location:index.html");
}
else
{
include 'db_connection.php';
$conn = OpenCon();

$section=$_SESSION['section'];

if(isset($_POST['validation']))
{
    $validation=$_POST['validation'];
    if($validation==1){
        $keyword = strval($_POST['query']);
        $search_param = "{$keyword}%";
    
        $sql = $conn->prepare("SELECT item_name FROM inv_items WHERE  item_name LIKE '$search_param' AND section_id='$section' AND status='1'");			
        $sql->execute();
        $result = $sql->get_result();
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
            $countryResult[] = $row["item_name"];
            }
            echo json_encode($countryResult);
        }
    
    }

    if($validation==2){
        $item_name=$_POST['query'];
    
        $sql ="SELECT item_code FROM inv_stock WHERE  item_name='$item_name' AND section_id='$section' AND status='1'";			
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);
        echo $row['item_code'];
    
    }

    if($validation==3){
        $keyword = strval($_POST['query']);
        $search_param = "{$keyword}%";
    
        $sql = $conn->prepare("SELECT user_name FROM user_details WHERE  user_name LIKE '$search_param'");			
        $sql->execute();
        $result = $sql->get_result();
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
            $countryResult[] = $row["user_name"];
            }
            echo json_encode($countryResult);
        }
    
    }

    if($validation==4){
        $user_name=$_POST['query'];
        $sql ="SELECT branch FROM user_details WHERE user_name='$user_name' AND (user_status='working' OR user_status='studying') LIMIT 1";			
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);
        echo $row['branch'];
    
    }
}
else
{
    $keyword = strval($_POST['query']);
    $search_param = "{$keyword}%";

    $sql = $conn->prepare("SELECT item_name FROM inv_stock WHERE  item_name LIKE '$search_param' AND section_id='$section' AND status='1'");			
	$sql->execute();
	$result = $sql->get_result();
	if ($result->num_rows > 0) {
		while($row = $result->fetch_assoc()) {
		$countryResult[] = $row["item_name"];
		}
		echo json_encode($countryResult);
	}
}
CloseCon($conn);
}
?>