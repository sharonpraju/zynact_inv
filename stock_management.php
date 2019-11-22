<link rel="stylesheet" href="css/manage_supplier.css">
<script src="js/jquery-2.1.4.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/typeahead.js"></script>
<div class="manage_cat_div">
    
        <span class="top_span">
            <center>
          <form action="#" method="post">
            <input type="text" id="search" class="search_txt_1" name="search" placeholder=" Search">
            <input type="submit" class="btn_search" value="Search">
          </form>
        <div class="bottom_line"></div>
        </center>
        </span>
        <script>

        $(document).ready(function () {
          $('#search').typeahead({
            source: function (query, result) {
                $.ajax({
                    url: "search_item.php",
					          data: 'query=' + query,            
                    dataType: "json",
                    type: "POST",
                    success: function (data) {
						result($.map(data, function (item) {
							return item;
                        }));
                    }
                });
            }
          });
        });

        </script>

        <br><br><br><br><br><br>

<?php
session_start();
if(!isset($_SESSION['admin']))
{
  header("location:index.html");
}
else
{
$section=$_SESSION['section'];
include 'db_connection.php';
$conn = OpenCon();
if(isset($_POST['search']))
{
  $item_name=$_POST['search'];
  $sql = "SELECT * FROM inv_stock WHERE item_name='$item_name' AND section_id='$section' AND status='1'";
  $result = mysqli_query($conn, $sql);
  $row = mysqli_fetch_assoc($result);
}
else
{
  $sql = "SELECT * FROM inv_stock WHERE section_id='$section' AND status='1'";
  $result = mysqli_query($conn, $sql);
  $row = mysqli_fetch_assoc($result);
}

$id=0;
do{
  $id++;
  $name=$row['item_name'];
  $sql_1="SELECT item_alert1, item_alert2, max_expected FROM inv_items WHERE Item_name ='$name'AND section_id='$section' AND status='1'";
  $result_1 = mysqli_query($conn, $sql_1);
  $row_1 = mysqli_fetch_assoc($result_1);
  echo'<div id="add_category_div">
            <div id="main_category">
                <form method="post" action="validate.php">
          
                  Item Code<input class="category_select" type="text" id="'.$row['item_code'].' name="item_name'.$id.'" value="'.$row['item_code'].'"  placeholder="" readonly>
                  Item Name<input class="cat_txt"type="text" id="'.$row['item_code'].' name="item_name'.$id.'" value="'.$row['item_name'].'" placeholder="" style="margin-left:10px;" readonly>
                  <input type="button" class="div_hidden_'.$id.'" value="Show Details" name="div_hidden_'.$id.'" onclick="hide_div(this.name)">
                  <a href="edit_contents.php?id='.$row['item_code'].'&page=stock"><img class="img_btn" src="img/edit_icon.png"></a>
                  <a href="delete_contents.php?id='.$row['item_code'].'&page=stock"><img class="img_btn" src="img/delete_icon.ico"></a>
                  <br><br><br>
                  <div id="div_hidden_'.$id.'" class="div_hidden">
                  Description<input class="discription_txt" type="text" id="'.$row['item_code'].' name="item_name'.$id.'" value="'.$row['item_description'].'"  placeholder="" readonly>
                  <br><br>
                  Category<input class="cat_txt" type="text" id="'.$row['item_code'].' name="item_name'.$id.'" value="'.$row['category_id'].'"  placeholder="" style="margin-left:37px;" readonly>
                  Sub-Categorys<input class="cat_txt" type="text" id="'.$row['item_code'].' name="item_name'.$id.'" value="'.$row['sub_category_id'].'"  placeholder="" style="margin-left:10px;" readonly>
                  Unit<input type="text" class="cat_txt" name="item_unit" id="'.$row['item_code'].' name="item_name'.$id.'" value="'.$row['unit'].'"  placeholder="" style="margin-left:25px;" readonly>
                  <br><br>
                  Alert Level 1<input class="cat_txt" type="text" id="'.$row['item_code'].' name="item_alert_level_1'.$id.'" value="'.$row_1['item_alert1'].'"  placeholder="" style="margin-left:10px;" readonly>
                  Alert Level 2  <input class="cat_txt" type="text" id="'.$row['item_code'].' name="item_alert_level_2'.$id.'" value="'.$row_1['item_alert2'].'"  placeholder="" style="margin-left:15px;" readonly>
                  Max Expected<input class="cat_txt" type="text" id="'.$row['item_code'].' name="item_name'.$id.'" value="'.$row_1['max_expected'].'"  placeholder="" style="margin-left:10px; width:130px;" readonly>
                  <br><br>
                  Supplied By<input type="text" class="cat_txt" name="item_supplier" id="'.$row['item_code'].' name="item_name'.$id.'" value="'.$row['supplier'].'"  placeholder="" style="margin-left:17px;" readonly>
                  Order No<input type="text" class="cat_txt" name="order_no" id="'.$row['item_code'].' name="item_name'.$id.'" value="'.$row['order_no'].'"  placeholder="" style="margin-left:47px;" readonly>
                  Order Date<input type="date" class="cat_txt" name="order_date" id="'.$row['item_code'].' name="item_name'.$id.'" value="'.$row['order_date'].'"  placeholder="" style="margin-left:10px; width:157px;" readonly>
                  <br><br>
                  Total Units<input type="text" class="cat_txt" name="total_units" id="'.$row['item_code'].' name="item_name'.$id.'" value="'.$row['total_units'].'"  placeholder="" style="margin-left:25px;" readonly>
                  Total Cost (including tax)<input type="text" class="cat_txt" name="total_cost" id="'.$row['item_code'].' name="item_name'.$id.'" value="'.$row['total_cost'].'"  placeholder="" style="margin-left:10px; width:107px;" readonly>
                  MRP<input type="text" class="cat_txt" name="item_price" id="'.$row['item_code'].' name="item_name'.$id.'" value="'.$row['mrp'].'"  placeholder="" style="margin-left:20px;" readonly>
                  <br><br>
                  Selling Price<input type="text" class="cat_txt" name="item_selling_price" id="'.$row['item_code'].' name="item_name'.$id.'" value="'.$row['selling_price'].'"  placeholder="" style="margin-left:15px;" readonly>
                  Tax Amount<input type="text" class="cat_txt" name="item_tax" id="'.$row['item_code'].' name="item_name'.$id.'" value="'.$row['tax_percent'].'"  placeholder="" style="margin-left:20px;" readonly>
                  Invoice No<input type="text" class="cat_txt" name="invoice_no" id="'.$row['item_code'].' name="item_name'.$id.'" value="'.$row['invoice_no'].'"  placeholder="" style="margin-left:10px; width:155px;" readonly>
                  <br><br>
                  Invoice Date<input type="date" class="cat_txt" name="invoice_date" id="'.$row['item_code'].' name="item_name'.$id.'" value="'.$row['invoice_date'].'"  placeholder="" style="margin-left:15px;" readonly>
                  Transportation Cost<input type="text" class="cat_txt" name="transportation_cost" id="'.$row['item_code'].' name="item_name'.$id.'" value="'.$row['transportation_cost'].'"  placeholder="" style="margin-left:10px; width:145px;" readonly>
                  <br><br>
                  Status<input class="cat_txt" type="text" id="'.$row['item_code'].' name="item_name'.$id.'" value="'.$row['status'].'"  placeholder="" style="margin-left:55px;" readonly>
                  Remarks<input class="cat_txt" type="text" id="'.$row['item_code'].' name="item_name'.$id.'" value="'.$row['remarks'].'"  placeholder="" style="margin-left:50px;" readonly>
               
                  <br><br>
                  </div>
                  <div class="bottom_div"></div>
                  <br>
                </form>
            </div>
            </div>';
  }while($row = mysqli_fetch_array($result));
  echo '<input id="total_items" value="'.$id.'" type="text" readonly hidden>';
  echo'</div>';
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
</style>
<script>

    window.onload = function(){
      var x = document.getElementById("total_items");
      var total = x.value;
      window.total_items(total);
    }
      function total_items(total){
        var i;
        for(i=1;i<=total;i++)
        {
          var div="div_hidden_"+i;
          var x = document.getElementById(div);
          if (x.style.display === "none")
          {
          x.style.display = "block";
          } else {
          x.style.display = "none";
          }
        }
      }
      function hide_div(id) {
        var x = document.getElementById(id);
        if (x.style.display === "none") {
          x.style.display = "block";
        } else {
          x.style.display = "none";
        }
      }
</script>