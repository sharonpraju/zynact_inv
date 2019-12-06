<script src="js/angular.min.js"></script>
<script src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/typeahead.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/distribution_log.css">
<div class="manage_cat_div">
<form name='filterform' method='POST'>
     <select class='input_txt' name='category_type' id='autotype' onchange="this.form.submit()" >
     <option value=0 >Select</option>
         <option value=1>Bill Number</option>
         <option value=2>Date</option>
         <option value=3>Name</option>
         <option value=4>Branch</option>
     </select>
     <?php  
     include 'db_connection.php';
     $conn = OpenCon();
     session_start();
     if(!isset($_SESSION['admin']))
     {
         header("location:index.html");
     }
     else
     {
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
        echo "</select>
        <input type='button' class='input_txt_btn' value='Print' onclick='javascript:window.print()'>";

        

    if(isset($_POST['search_bill']))
     {
        $bill_no=$_POST['search_bill'];
        $sql="SELECT * FROM inv_distribution WHERE dist_bill_no='$bill_no' AND section='$section'";
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
                        echo "<td>".$row['sl_no']."</td>";
                        echo "<td>".$row['dist_bill_no']."</td>";
                        echo "<td>".$row['dist_user_id']."</td>";
                        echo "<td>".$row['department']."</td>";
                        echo "<td>".$row['dist_issued_to']."</td>";
                        echo "<td>".$row['dist_place']."</td>";
                        echo "<td>".$row['dist_issued_by']."</td>";
                        echo "<td>". substr($row['dist_issued_on'],0,10) ."</td>";
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
        $sql="SELECT * FROM inv_distribution WHERE DATE(dist_issued_on)='$search_date' AND section_id='$section'";
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
                        echo "<td>" . substr($row['dist_issued_on'],0,10) . "</td>";
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
        $sql="SELECT * FROM inv_distribution WHERE dist_user_id='$user_name' AND section_id='$section'";
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
                        echo "<td>" . substr($row['dist_issued_on'],0,10) . "</td>";
                    echo "</tr>";
                }
                echo "</table>";
                echo "<br><br>";
                mysqli_free_result($result);
            }
        }
        unset($user_name);
        unset($_POST['user_name']);
    }
    if(isset($_POST['user_department']))
    {
        $user_department=$_POST['user_department'];
        $sql="SELECT * FROM inv_distribution WHERE department='$user_department' AND section_id='$section'";
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
                        echo "<td>" . substr($row['dist_issued_on'],0,10) . "</td>";
                        echo "</tr>";
                }
                echo "</table>";
                echo "<br><br>";
                mysqli_free_result($result);
            }
        }
        unset($user_department);
        unset($_POST['user_department']);
    }
    $sql = "SELECT * FROM inv_distribution WHERE section_id='$section'";
    if(isset($_POST['sub_type']))
    {
         
         $sub_type=$_POST['sub_type'];
        $sql = "SELECT * FROM inv_distribution WHERE section_id='$section' and dist_issued_to ='$sub_type' ";

    }
   
    if(isset($_POST['category_type']))
    {
        if($_POST['category_type']==1)
        {
            echo "<form method='post' action='#'>
            <input  id='bill' class='input_txt' type='text' name='search_bill' placeholder='Bill No'>
            <input type='submit' class='input_txt_submit' value='Submit'>
            <button class='input_txt_submit' onclick='history.go(-1);'>Back </button>
            </form>";
        
        $sql = "SELECT * FROM inv_distribution WHERE section_id='$section'  ORDER by 'dist_bill_no'";
        
    
        }
        if($_POST['category_type']==2)
        {
            echo "<form method='post' action='#'>
            <input  id='bill' class='input_txt' type='date' name='search_date' placeholder='Date'>
            <input type='submit' class='input_txt_submit' value='Submit'>
            <button class='input_txt_submit' onclick='history.go(-1);'>Back </button>
            </form>";
            $sql = "SELECT * FROM inv_distribution WHERE section_id='$section'  ORDER by 'dist_bill_no'";
        }

        if($_POST['category_type']==3)
        {
            $sql = "SELECT * FROM inv_distribution WHERE section_id='$section' ORDER by 'dist_bill_no'  ";
            echo "<form method='post' action='#'>
            <input  id='search_name' class='input_txt' type='text' name='user_name' placeholder='Name'>
            <input type='submit' class='input_txt_submit' value='Submit'>
            <button class='input_txt_submit' onclick='history.go(-1);'>Back </button>
            </form>";
        
        }

        if($_POST['category_type']==4)
        {
            $sql = "SELECT * FROM inv_distribution WHERE section_id='$section' ORDER by 'dist_bill_no'  ";
            echo "<form method='post' action='#'>
            <input  id='search_department' class='input_txt' type='text' name='user_department' placeholder='Department'>
            <input type='submit' class='input_txt_submit' value='Submit'>
            <button class='input_txt_submit' onclick='history.go(-1);'>Back </button>
            </form>";
        
        }

        $sl_no=1;

        if($result = mysqli_query($conn, $sql)){
            if(mysqli_num_rows($result) > 0){
                echo "<table>";
                echo "<tr>";
                    echo "<th>Sl No</th>";
                    echo "<th>Bill Number</th>";
                    echo "<th>Name</th>";
                    echo "<th>Department</th>";
                    echo "<th>Location</th>";
                    echo "<th>Place</th>";
                    echo "<th>Issued By</th>";
                    echo "<th>Date</th>";
                echo "</tr>";
                while($row = mysqli_fetch_array($result))
                {
                echo "<tr>";
                    echo "<td>" . $sl_no . "</td>";
                    echo "<td>" . $row['dist_bill_no'] . "</td>";
                    echo "<td>" . $row['dist_user_id'] . "</td>";
                    echo "<td>" . $row['department'] . "</td>";
                    echo "<td>" . $row['dist_issued_to'] . "</td>";
                    echo "<td>" . $row['dist_place'] . "</td>";
                    echo "<td>" . $row['dist_issued_by'] . "</td>";
                    echo "<td>" . substr($row['dist_issued_on'],0,10) . "</td>";
                echo "</tr>";
                $sl_no++;
                }
            echo "</table>";
            mysqli_free_result($result);
            } 
        }
        else
        {
            echo "ERROR" . mysqli_error($conn);
        }
    }

}
?>

<style>
	.typeahead { border: 2px solid #FFF;border-radius: 4px;padding: 8px 12px;max-width: 300px;min-width: 290px;background: rgba(66, 52, 52, 0.5);color: #FFF;}
	.tt-menu { width:300px; }
	ul.typeahead{margin:0px;padding:10px 0px;}
	ul.typeahead.dropdown-menu li a {padding: 10px !important;	border-bottom:#CCC 1px solid;color:#FFF;}
	ul.typeahead.dropdown-menu li:last-child a { border-bottom:0px !important; }
	.bgcolor {max-width: 550px;min-width: 290px;max-height:340px;}
	.demo-label {font-size:1.5em;color: #686868;font-weight: 500;color:#FFF;}
	.dropdown-menu>.active>a, .dropdown-menu>.active>a:focus, .dropdown-menu>.active>a:hover {
		text-decoration: none;
		background-color: #1f3f41;
		outline: 0;
    }
    
    td,tr,th{
    text-align:center;
    width: 150px;
    }
</style>
    
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
                });
            }
        });
    });

    $(document).ready(function () {
        $('#search_department').typeahead({
            source: function (query, result) {
                $.ajax({
                    url: "search_item.php",
					data: {query:query, validation:4},
                    dataType: "json",
                    type: "POST",
                    success: function (data) {
						result($.map(data, function (item) {
							return item;
                        }));
                    },
                });
            }
        });
    });

</script> 