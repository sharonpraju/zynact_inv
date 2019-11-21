<link rel="stylesheet" href="css/distribution_log.css">
<script src="js/angular.min.js"></script>
<form name='filterform' method='POST'>
     <select class='input_txt' name='category_type' id='autotype' onchange="this.form.submit()" >
     <option value=0 >Select</option>
         <option value=1>Bill Number</option>
         <option value=2>Date</option>
         <option value=3>Name</option>
         <option value=3>Branch</option>

     </select>
     
    
     <?php  
     include 'db_connection.php';
     $conn = OpenCon();
     session_start();
     $section=$_SESSION['section'];
     echo " <select class='input_txt' name='sub_type' id='autotype'; onchange=this.form.submit() >
     <option value=0 >All</option>";
     
                $sql="SELECT cat_type FROM inv_type WHERE section='$section'";
                $result = mysqli_query($conn, $sql);
                $i=1;
                while($row = mysqli_fetch_array($result))
                {
                echo " <option value=".$row['cat_type'].">".$row['cat_type']."</option>"; 
                }
echo "</select><input type='button' class='input_txt_btn' value='Print' onclick='javascript:window.print()'>";
   


if(isset($_POST['search_bill']))
     {
        $bill_no=$_POST['search_bill'];
        $sql="SELECT * FROM inv_distribution where dist_bill_no='$bill_no' ";
        if($result = mysqli_query($conn, $sql)){
            if(mysqli_num_rows($result) > 0){
                echo "<table>";
                    echo "<tr>";
                        echo "<th>Sl No</th>";
                        echo "<th>Bill No</th>";
                        echo "<th>Name</th>";
                        echo "<th>Department</th>";
                        echo "<th>Location</th>";
                        echo "<th>Place</th>";
                        echo "<th>Issued By</th>";
                        echo "<th>Date</th>";
                    echo "</tr>";
                while($row = mysqli_fetch_array($result)){
                    echo "<tr>";
                        echo "<td>" . $row['sl_no'] . "</td>";
                        echo "<td>" . $row['dist_bill_no'] . "</td>";
                        echo "<td>" . $row['dist_user_id'] . "</td>";
                        echo "<td>" . $row['department'] . "</td>";
                        echo "<td>" . $row['dist_issued_to'] . "</td>";
                        echo "<td>" . $row['dist_place'] . "</td>";
                        echo "<td>" . $row['dist_issued_by'] . "</td>";
                        echo "<td>" . $row['dist_issued_on'] . "</td>";
                    echo "</tr>";
                }
                echo "</table>";
              
                mysqli_free_result($result);
            }
        }
        
        unset($bill_no);
        unset($_POST['search_date']);
     }

     if(isset($_POST['search_date']))
     {
        $search_date=$_POST['search_date'];
        $sql="SELECT * FROM inv_distribution where dist_issued_on='$search_date' ";
        if($result = mysqli_query($conn, $sql)){
            if(mysqli_num_rows($result) > 0){
                echo "<table>";
                    echo "<tr>";
                        echo "<th>Sl No</th>";
                        echo "<th>Bill No</th>";
                        echo "<th>Name</th>";
                        echo "<th>Department</th>";
                        echo "<th>Location</th>";
                        echo "<th>Place</th>";
                        echo "<th>Issued By</th>";
                        echo "<th>Date</th>";
                    echo "</tr>";
                while($row = mysqli_fetch_array($result)){
                    echo "<tr>";
                        echo "<td>" . $row['sl_no'] . "</td>";
                        echo "<td>" . $row['dist_bill_no'] . "</td>";
                        echo "<td>" . $row['dist_user_id'] . "</td>";
                        echo "<td>" . $row['department'] . "</td>";
                        echo "<td>" . $row['dist_issued_to'] . "</td>";
                        echo "<td>" . $row['dist_place'] . "</td>";
                        echo "<td>" . $row['dist_issued_by'] . "</td>";
                        echo "<td>" . $row['dist_issued_on'] . "</td>";
                    echo "</tr>";
                }
                echo "</table>";
              
                mysqli_free_result($result);
            }
        }
        
        unset($bill_no);
        unset($_POST['search_date']);
     }
if(isset($_POST['user_name']))
     {
        $user_name=$_POST['user_name'];
        if(strlen($user_name)==2)
        {
            $sql="SELECT * FROM inv_distribution where department='$user_name' AND section_id='$section'";

        }
        else{
       $sql="SELECT * FROM inv_distribution where dist_user_id='$user_name' AND section_id='$section'";
        }
        if($result = mysqli_query($conn, $sql)){
            if(mysqli_num_rows($result) > 0){
                echo "<table>";
                    echo "<tr>";
                        echo "<th>Sl No</th>";
                        echo "<th>Bill No</th>";
                        echo "<th>Name</th>";
                        echo "<th>Department</th>";
                        echo "<th>Location</th>";
                        echo "<th>Place</th>";
                        echo "<th>Issued By</th>";
                        echo "<th>Date</th>";
                    echo "</tr>";
                while($row = mysqli_fetch_array($result)){
                    echo "<tr>";
                        echo "<td>" . $row['sl_no'] . "</td>";
                        echo "<td>" . $row['dist_bill_no'] . "</td>";
                        echo "<td>" . $row['dist_user_id'] . "</td>";
                        echo "<td>" . $row['department'] . "</td>";
                        echo "<td>" . $row['dist_issued_to'] . "</td>";
                        echo "<td>" . $row['dist_place'] . "</td>";
                        echo "<td>" . $row['dist_issued_by'] . "</td>";
                        echo "<td>" . $row['dist_issued_on'] . "</td>";
                    echo "</tr>";
                }
                echo "</table>";
              
                mysqli_free_result($result);
            }
        }
        
     }
   
?>
     <?php
       $sql = "SELECT * FROM inv_distribution WHERE section_id='$section'";
     if(isset($_POST['sub_type']))
     {
         
         $p=$_POST['sub_type'];
        $sql = "SELECT * FROM inv_distribution where section_id='$section' and dist_issued_to ='$p' ";

     }
   
if(isset($_POST['category_type']))
{
    
   if($_POST['category_type']==3)
    {
        $sql = "SELECT * FROM inv_distribution where section_id='$section' ORDER by 'dist_bill_no'  ";
        echo "<form method='post' action='#'>
        <input  id='search_name' class='input_txt' type='text' name='user_name' placeholder='Name / Department'>
        <input type='submit' class='input_txt_btn' value='Submit'>
        </form>";
        
    }
    
    if($_POST['category_type']==1)
    {
        echo "<form method='post' action='#'>
        <input  id='bill' class='input_txt' type='text' name='search_bill' placeholder='Bill No'>
        <input type='submit' class='input_txt_btn' value='Submit'>
        </form>";
        
    $sql = "SELECT * FROM inv_distribution WHERE section_id='$section'  ORDER by 'dist_bill_no'";
        
    
    }
    if($_POST['category_type']==2)
    {
        echo "<form method='post' action='#'>
        <input  id='bill' class='input_txt' type='date' name='search_date' placeholder='Date'>
        <input type='submit' class='input_txt_btn' value='Submit'>
        </form>";
        
    $sql = "SELECT * FROM inv_distribution WHERE section_id='$section'  ORDER by 'dist_bill_no'";

    
}
if($result = mysqli_query($conn, $sql)){
    if(mysqli_num_rows($result) > 0){
        echo "<table>";
            echo "<tr>";
                echo "<th>&nbsp; &nbsp; &nbsp; &nbsp; Sl No</th>";
                echo "<th>&nbsp;Bill Number</th>";
                echo "<th>Name</th>";
                echo "<th>Department</th>";
                echo "<th>Location</th>";
                echo "<th>&nbsp; &nbsp; &nbsp; &nbsp;Place</th>";
                echo "<th>&nbsp; &nbsp; &nbsp; &nbsp;Issued By</th>";
                echo "<th>Date</th>";
            echo "</tr>";
        while($row = mysqli_fetch_array($result)){
            echo "<tr>";
                echo "<td>" . $row['sl_no'] . "</td>";
                echo "<td>" . $row['dist_bill_no'] . "</td>";
                echo "<td>" . $row['dist_user_id'] . "</td>";
                echo "<td>" . $row['department'] . "</td>";
                echo "<td>" . $row['dist_issued_to'] . "</td>";
                echo "<td>" . $row['dist_place'] . "</td>";
                echo "<td>" . $row['dist_issued_by'] . "</td>";
                echo "<td>" . $row['dist_issued_on'] . "</td>";
            echo "</tr>";
        }
        echo "</table>";
        mysqli_free_result($result);
    } 
} else{
    echo "ERROR" . mysqli_error($conn);
}
}
?>
 
 <script>
    $(document).ready(function () {
        $('#search_name').typeahead({
            source: function (query, result) {
                $.ajax({
                    url: "search_item.php",
					data: {query:query, validation:3},
                    dataType: "json",
                    type: "POST",
                    success: function (data) {
						result($.map(data, function (item) {
							return item;
                        }));
                    },
                    error: function (data) {
                        alert(data);
                    }
                });
            }
        });
    });

</script> 