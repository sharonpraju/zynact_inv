<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/typeahead.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/add_stock.css">

 <br><br>
 <!--<center>-->
        <div class="right">
        </div>
 <div class="left">
<form method="post" action="validate.php">
<div class="top_div">
<input type="text" name="validation" value="add_stock" hidden readonly>

    <?php 
        include 'db_connection.php';
        $conn = OpenCon();
        session_start();
        $section=$_SESSION['section'];

    $sql = "SELECT MAX(sl_no) FROM inv_stock WHERE section_id='$section' AND status='1'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    $max=$row['MAX(sl_no)'];

    if($row['MAX(sl_no)']!=NULL)
    {

        $sql = "SELECT * FROM inv_stock WHERE section_id='$section' AND sl_no='$max' AND status='1'";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);
        $current_supplier=$row['supplier'];
        echo'<select class="input_txt_top" name="item_supplier" name="item_category" required>
        <option value="'.$current_supplier.'">'.$current_supplier.'</option>';

        $sql = "SELECT supplier_name FROM inv_supplier WHERE section_id='$section' AND supplier_status='1'";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);
        while($row=mysqli_fetch_assoc($result)){
            echo "<option value='".$row['supplier_name']."'>".$row['supplier_name']."</option>";
        }
        echo"</select>";


        $sql = "SELECT * FROM inv_stock WHERE sl_no='$max' AND section_id='$section' AND status='1'";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);
        echo '
            <input type="text" class="input_txt_top" name="order_no" value="'.$row['order_no'].'">
            <input type="text" class="input_txt_top" name="invoice_no" value="'.$row['invoice_no'].'">
            <input type="text" class="input_txt_top" name="transportation_cost" value="'.$row['transportation_cost'].'">
            <input type="date" class="input_txt_top" name="order_date" value="'.$row['order_date'].'">
            <input type="date" class="input_txt_top" name="invoice_date" value="'.$row['invoice_date'].'">';
    }
    else
    {

        echo'<select class="input_txt_top" name="item_supplier" name="item_category" required>
        <option value="">Select a Supplier</option>';

        $sql = "SELECT supplier_name FROM inv_supplier WHERE section_id='$section' AND supplier_status='1'";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);
        if($row['supplier_name']!=NULL)
        {
            echo "<option value='".$row['supplier_name']."'>".$row['supplier_name']."</option>";
        }
        while($row=mysqli_fetch_assoc($result)){
            echo "<option value='".$row['supplier_name']."'>".$row['supplier_name']."</option>";
        }
        echo"</select>";

        echo '
            <input type="text" class="input_txt_top" name="order_no" placeholder=" Oder No">
            <input type="text" class="input_txt_top" name="invoice_no" placeholder=" Invoice No">
            <input type="text" class="input_txt_top" name="transportation_cost" placeholder=" Transportation Cost">
            <input type="date" class="input_txt_top" name="order_date" placeholder=" Oder Date">
            <input type="date" class="input_txt_top" name="invoice_date" placeholder=" Invoice Date">
            ';
    }

?>


<input type="submit" class="submit" value=" Add / Update">
</div>
<br><br>
<input type="text" class="input_txt" id="search_item" name="item_name" placeholder=" Name" required onchange='update(this.value)'>
<select class="input_txt" name="item_category" required>
    <option value="">Select a Category</option>
    <?php
        $sql = "SELECT * FROM inv_category WHERE category_type='0' AND section_id='1' AND category_status='1'";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);
        if($row['category_name']!=NULL)
        {
        echo "<option value='".$row['category_name']."'>".$row['category_name']."</option>";
        }
        while($row=mysqli_fetch_assoc($result)){
            echo "<option value='".$row['category_name']."'>".$row['category_name']."</option>";
        }
    ?>
</select>
<br><br>
<select class="input_txt" name="item_sub_category" required>
    <option value="">Select a Sub Category</option>
    <?php 
        $sql = "SELECT category_name FROM inv_category WHERE category_type=1 AND section_id='$section' AND category_status='1'";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);
        if($row['category_name']!=NULL)
        {
        echo "<option value='".$row['category_name']."'>".$row['category_name']."</option>";
        }
        while($row=mysqli_fetch_assoc($result)){
            echo "<option value='".$row['category_name']."'>".$row['category_name']."</option>";
        }
        CloseCon($conn);
    ?>
</select>
<input type="text" class="input_txt" name="total_units" placeholder=" Total Units">
<br><br>
<input type="text" class="input_txt" name="total_cost" placeholder=" Total Cost (including tax)">
<input type="text" class="input_txt" name="item_unit" placeholder=" Unit">
<br><br>
<input type="text" class="input_txt" name="item_price" placeholder=" MRP">
<input type="text" class="input_txt" name="item_selling_price" placeholder=" Selling Price">
<br><br>
<input type="text" class="input_txt" name="item_tax" placeholder=" Tax Amount">
<input type="text" class="input_txt" name="remarks" placeholder=" Remarks">
<br><br>
<input type="text" class="input_txt" name="barcode" placeholder=" barcode">
<input id="item_code" class="input_txt" type="text" name="item_code"placeholder=" Item Code">
<br><br>
</form>
</div>

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

    $(document).ready(function () {
        $('#search_item').typeahead({
            source: function (item_name, result) {
                $.ajax({
                    url: "search_item.php",
					data: {query:item_name, validation:1},
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

    function update(item_name) {
        $.ajax({
                    url: "search_item.php",
					data: {query:item_name, validation:2},
                    type: "POST",
                    success: function (data,status) {
                        document.getElementById("item_code").value=data;
                    }
                });
    }
</script>