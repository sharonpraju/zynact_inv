<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/typeahead.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
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
    session_start();
    if(!isset($_SESSION['admin']))
    {
    header("location:index.html");
    }
    
    include 'db_connection.php';
    $conn = OpenCon();
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
        echo'<select class="input_txt_top" data-toggle="tooltip" title="Supplier" name="item_supplier" required>
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
            <input type="text" class="input_txt_top" data-toggle="tooltip" title="Order No" name="order_no" value="'.$row['order_no'].'">
            <input type="text" class="input_txt_top" data-toggle="tooltip" title="Invoice No" name="invoice_no" value="'.$row['invoice_no'].'">
            <input type="text" class="input_txt_top" data-toggle="tooltip" title="Transportation Cost" name="transportation_cost" value="'.$row['transportation_cost'].'">
            <input type="date" class="input_txt_top" data-toggle="tooltip" title="Order Date" name="order_date" value="'.$row['order_date'].'">
            <input type="date" class="input_txt_top" data-toggle="tooltip" title="Invoice Date" name="invoice_date" value="'.$row['invoice_date'].'">';
            $invoice_no=$row['invoice_no'];
            $sql = "SELECT total_cost, total_tax, remarks FROM inv_purchase_log WHERE invoice_no='$invoice_no' AND section_id='$section'";
            $result = mysqli_query($conn, $sql);
            $row = mysqli_fetch_assoc($result);
            echo'
            <input type="text" class="input_txt_top" data-toggle="tooltip" title="Total Bill Cost" name="total_bill_cost" value="'.$row['total_cost'].'">
            <input type="text" class="input_txt_top" data-toggle="tooltip" title="Total Tax" name="total_tax" value="'.$row['total_tax'].'">
            <input type="text" class="input_txt_top" data-toggle="tooltip" title="Remarks" name="bill_remarks" value="'.$row['remarks'].'">';
            
    }
    else
    {

        echo'<select class="input_txt_top" name="item_supplier" data-toggle="tooltip" title="Supplier" required>
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
            <input type="text" class="input_txt_top" name="order_no" placeholder=" Oder No" data-toggle="tooltip" title="Order No">
            <input type="text" class="input_txt_top" name="invoice_no" placeholder=" Invoice No" data-toggle="tooltip" title="Invoice No">
            <input type="text" class="input_txt_top" name="transportation_cost" placeholder=" Transportation Cost" data-toggle="tooltip" title="Transportation Cost">
            <input type="date" class="input_txt_top" name="order_date" placeholder=" Oder Date" data-toggle="tooltip" title="Order date">
            <input type="date" class="input_txt_top" name="invoice_date" placeholder=" Invoice Date" data-toggle="tooltip" title="Invoice Date">
            <input type="text" class="input_txt_top" name="total_bill_cost" placeholder="Total Bill Cost" data-toggle="tooltip" title="Total Bill Cost">
            <input type="text" class="input_txt_top" name="total_tax" placeholder="Total Tax" data-toggle="tooltip" title="Total Tax">
            <input type="text" class="input_txt_top" name="bill_remarks" placeholder="Bill Remarks" data-toggle="tooltip" title="Bill Remarks">
            ';
    }

?>


<input type="submit" class="submit" value=" Add / Update">
</div>
<br><br>
<input type="text" class="input_txt" id="search_item" name="item_name" placeholder=" Name" data-toggle="tooltip" title="Item Name" autocomplete="off" required onchange='update(this.value)'>
<select class="input_txt" name="item_category" data-toggle="tooltip" title="Category" required>
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
<select class="input_txt" name="item_sub_category" data-toggle="tooltip" title="Sub Category" required>
    <option value="">Select a Sub Category</option>
    <?php 
        $sql = "SELECT category_name FROM inv_category WHERE category_type='1' AND section_id='$section' AND category_status='1'";
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
<input type="text" class="input_txt" name="total_units" placeholder=" Total Units" data-toggle="tooltip" title="Total Units" autocomplete="off">
<br><br>
<input type="text" class="input_txt" name="total_cost" placeholder=" Total Cost (including tax)" data-toggle="tooltip" title="Total Cost" autocomplete="off">
<select class="input_txt" name="item_unit" data-toggle="tooltip" title="Unit" required>
<option value="">Select Unit</option>
<option value="No">No</option>
<option value="Kg">Kg</option>
<option value="Mg">Mg</option>
<option value="Lbs">Lbs</option>
<option value="Pounds">Pounds</option>
<option value="Pcs">Pcs</option>
<option value="Ltr">Ltr</option>
<option value="Ml">Ml</option>
</select>
<br><br>
<input type="text" class="input_txt" name="item_price" placeholder=" MRP" data-toggle="tooltip" title="MRP" autocomplete="off">
<input type="text" class="input_txt" name="item_selling_price" placeholder=" Selling Price" data-toggle="tooltip" title="Selling Price" autocomplete="off">
<br><br>
<input type="text" class="input_txt" name="item_tax" placeholder=" Tax Amount" data-toggle="tooltip" title="Tax Amount" autocomplete="off">
<input type="text" class="input_txt" name="remarks" placeholder=" Remarks" data-toggle="tooltip" title="Remarks" autocomplete="off">
<br><br>
<input type="text" class="input_txt" name="barcode" placeholder=" barcode" data-toggle="tooltip" title="Barcode" autocomplete="off">
<input id="item_code" class="input_item_code" type="text" name="item_code"placeholder=" Item Code" autocomplete="off" readonly>
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

    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();   
    });

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