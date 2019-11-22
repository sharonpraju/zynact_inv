<!--add category-->

<div class="manage_cat_div">
<?php
session_start();
if(!isset($_SESSION['section']))
{
header("location:index.html");
die();
}
?>


<link rel="stylesheet" href="css/settings.css">
<script  src="js/dashboard.js"></script>
<input type='button' class='add_btn' value='Add Main or Sub Category' onclick='hide_div()'>
<br><br><br>
<a href='manage_sub_category.php' class='sub_btn'>Manage Sub Category</a>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
<?php
// connect to the database
include('db_connection.php');
$conn = OpenCon();
$section=$_SESSION['section'];

// get the records from the database
if ($result = $conn->query("SELECT * FROM inv_category WHERE category_type='0' AND section_id='$section' AND category_status='1'"))
{
// display records if there are records to display
if ($result->num_rows > 0)
{
// display records in a table
echo "<br><br><center><table border='1' cellpadding='10'>";

echo "<tr><th colspan='10'>Main Categories</th></tr>";
echo "<tr><th>Name</th><th>Description</th><th>Remarks</th><th colspan='7'></th></tr>";

while ($row = $result->fetch_object())
{
// set up a row for each record
echo "<tr>";
echo "<td>" . $row->category_name . "</td>";
echo "<td>" . $row->category_description . "</td>";
echo "<td>" . $row->category_remarks . "</td>";
echo "<td></td>";
echo "<td></td>";
echo "<td></td>";
echo "<td></td>";
echo "<td></td>";
echo "<td><a class='tbl_btn' href='edit_contents.php?id=" . $row->category_name . "&page=category'><img class='img_btn' src='img/edit_icon.png'></a></td>";
echo "<td><a class='tbl_btn' href='delete_contents.php?id=" . $row->category_name . "&page=category'><img class='img_btn' src='img/delete_icon.ico'></a></td>";
/*echo "<td><a href='records.php?id=" . $row->category_name . "'>Edit</a></td>";
echo "<td><a href='delete_contents.php?id=" . $row->category_name . "'>Delete</a></td>";*/
echo "</tr>";
}

echo "</table></center>";
}
// if there are no records in the database, display an alert message
else
{
  echo "<center>Categories Not Found</center>";
}
}
// show an error if there is an issue with the database query
else
{
echo "Error: " . $conn->error;
}

// close database connection

echo '<div id="div_hidden" class="div_hidden">
<div id="add_category_div">
        <div id="main_category">
          
            <form class="cat_form" method="post"  action="validate.php">
              <input type="hidden" name="validation" value="add_category">
                <script src="js/jquery.min.js"></script>
                <select class="category_select" name=category_type id="AutoType">
                    <option value="0">Main Category</option>
                    <option value="1">Sub Category</option>

                </select>
                
                <select name=category_select class="category_select" id="Model" disabled>
                  <option>Parent Category</option>';
                     
                      
                  
                      $sql = "SELECT category_name From inv_category WHERE category_type='0' AND section_id='$section' AND category_status='1'";
                       $result=mysqli_query($conn,$sql);
                        while($row=mysqli_fetch_array($result))
                        {
                         echo "<option name=category_ref value='".$row['category_name']."'>" . $row['category_name']. "</option>";
                        
                      }
                            ?>
</select>

                    <script type="text/javascript">
                        $('#AutoType').change(function() {
                  $('#Model').prop('disabled', true);
                  if ($(this).val() == '1') {
                    $('#Model').prop('disabled', false);
                  }
                });
                    </script>
                
                
            <center>
                <br>
                <input name=category_name class="cat_txt" type="text" placeholder="  Name">
                <br><br>
                <input name=category_description class="cat_txt" type="text" placeholder="  Description">
                <br><br>
                <input name=category_remarks class="cat_txt" type="text" placeholder="  Remarks">
                <br><br>
                <select name=category_status class="status_select">
                  
                  <option value="1">Enabled</option>
                  <option value="0">Disabled</option>
                </select>
                <br><br>
                <input class="chng_submit" type="submit" value="Save">
              </center>
  
    
            </form>
        </div>
        <div id="sub_category">
        </div>
        </div>
 </div>
 <script>
        var x = document.getElementById("div_hidden");
        if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
    function hide_div() {
  var x = document.getElementById("div_hidden");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}


</script></div><script>