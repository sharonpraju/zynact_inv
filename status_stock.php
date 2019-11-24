<?php
include 'db_connection.php';
$conn = OpenCon();
session_start();
$section=$_SESSION['section'];

echo "<body bgcolor=white>";
$sql="SELECT * FROM inv_stock where status=1 and section_id='$section' ";
if($result = mysqli_query($conn, $sql))
{
        while($row = mysqli_fetch_array($result))
        {
                if($row['total_units']<=0) 
                {
                   echo $row['item_name'];
                }
        }
        
      
        mysqli_free_result($result);
    }

?>