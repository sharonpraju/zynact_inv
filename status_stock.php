<?php
include 'db_connection.php';
$conn = OpenCon();
echo "<body bgcolor=white>";
$sql="SELECT * FROM inv_stock where status=1";
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