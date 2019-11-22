<?php
	session_start();
	if(!isset($_SESSION['section']))
	header("location:index.html");
	$section=$_SESSION['section'];	
	$keyword = strval($_POST['query']);
	$search_param = "{$keyword}%";
	$dbhost = "localhost";
 	$dbuser = "root";
 	$dbpass = "";
	 $db = "mbc_db";
 	$conn = new mysqli($dbhost, $dbuser, $dbpass,$db) or die("Connect failed: %s\n". $conn -> error);

	 
	$sql = $conn->prepare("SELECT item_name FROM inv_stock WHERE  item_name LIKE '$search_param' OR barcode LIKE '$search_param' OR item_code LIKE '$search_param' AND section_id='$section' AND status='1'");			
	$sql->execute();
	$result = $sql->get_result();
	if ($result->num_rows > 0) {
		while($row = $result->fetch_assoc()) {
		$countryResult[] = $row["item_name"];
		}
		echo json_encode($countryResult);
	}
	$conn->close();
?>

