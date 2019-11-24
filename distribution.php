<?php
session_start();
if(!isset($_SESSION['admin']))
{
    header("location:index.html");
}
$section=$_SESSION['section'];
include 'db_connection.php';
$conn = OpenCon();
?>
<link href="css/bootstrap.min.css" rel="stylesheet">
 <link rel="stylesheet" href="css/add_stock.css">
 <script src="js/jquery.min.js"></script>
 <script src="js/angular.min.js"></script>
 <div class="bottom_div"></div>
 <div class='title_div'>
    <div class='bill_txt_title1'>Sl No</div>
    <div class='bill_txt_title2'>Item Name</div>
    <div class='bill_txt_title3'>Item Code</div>
    <div class='bill_txt_title4'>&nbsp;Quantity</div>
    <div class='bill_txt_title5'>&nbsp;MRP</div>
    <div class='bill_txt_title6'>Selling Price</div>
    <div class='bill_txt_title7'>Total</div><br><br>
    </div>
 <br><br>
<div class='background'>
</div>
 <div>
<br>
    <div class="search_div_dist">
    
        <form method="post" action="validate.php">
            <input type="text" name="validation" value="item_distribution" hidden readonly>
           
            <input type="text" name="search" id="search" class="search_input_bill" placeholder="Search" required autofocus autocomplete="off">
            <br> <br>
            
                
            <input type="submit" class="search_submit_dist" value="Search">
            <br>
        </form>
    </div>
        <form method="post" action="bill_print_a4.php">
        <input type="text" class="user_txt" id="search_name" name="dist_user_id" placeholder="Name" onchange='update(this.value)' required>
        <br>
        <div class="customer">
        <input type="text" class="input_txt_distribution_1" id="department_txt" name="department" placeholder="Department" readonly>
        <input type="text" class="input_txt_distribution_2" name="dist_place" placeholder="Place" id="Place" class="ui-autocomplete-input">
        <input type="text" class="input_txt_distribution_3" name="Remarks" placeholder="Remarks" id="Remarks" class="ui-autocomplete-input">
        
        <script src="js/jquery.min.js"></script>
        <select class="input_txt_distribution_4" name=dist_issued_to id="AutoType" required>
        <option value="">Select Sub Section</option>

        <?php
        $sql="SELECT cat_type FROM inv_type where section=$section";
        $result = mysqli_query($conn, $sql);
        echo "<option value=".$row['cat_type'].">".$row['cat_type']."</option>";
        while($row = mysqli_fetch_array($result))
        {
            echo "<option value=".$row['cat_type'].">".$row['cat_type']."</option>";
        }
        ?>
        </select>
        <br><br>
        <span class="span_date">Issued Date</span><input type="date" class="input_txt_distribution_5" name="invoice_date" value="<?php echo date("Y-m-d"); ?>" require placeholder="" style="margin-left:15px;">
        <?php
        $sql = "SELECT MAX(bill_no) FROM inv_sales_log WHERE section_id='$section'";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);
        $max=$row['MAX(bill_no)'];
        $max++;
        echo'
        <span class="span_1">Indent No</span><input type="text" class="input_txt_distribution_6" name="indent" placeholder="Indent No" value="'.$max.'" class="ui-autocomplete-input"><br>
        <span class="span_2">Stock No</span><input type="text" class="input_txt_distribution_7" name="stock_no" placeholder="Stock No" value="'.$max.'" class="ui-autocomplete-input">';
        ?>
        <input type=submit class="link_submit" value="Save and Print">
        </form>
</div>
</div>
<br><br>
<?php
$sql = "SELECT * FROM inv_current_bill";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);
$id=0;
echo"
<span></span>
    <form method='post' action='validate.php' style='overflow:hidden' ng-app=''>
    <br>";
    do{
        $item_code=$row['item_code'];
        $sql_1 = "SELECT total_units FROM inv_stock WHERE item_code='$item_code'";
        $result_1 = mysqli_query($conn, $sql_1);
        $row_1 = mysqli_fetch_assoc($result_1);
        $max_quantity=$row_1['total_units'];

        $id++;
        $total=$row['item_selling_price']*$row['item_quantity'];
        echo"<br>
        <input type='text' id='sl_no' class='bill_txt_sl_no' value='".$id."'>
        <input type='text' id='".$row['item_code']."' class='bill_txt_name' name='item_name' value='".$row['item_name']."' onchange='change_name(this.value,this.id)'>
        <input type='text' id='".$row['item_code']."' class='bill_txt' name='item_code' value='".$row['item_code']."' onchange='change_code(this.value,this.id)' readonly>
        <input type='number' id='".$row['item_code']."' class='bill_txt_qty' name='".$max_quantity."' ng-model='quantity".$id."' ng-init='quantity".$id."=".$row['item_quantity']."' onchange='change_quantity(this.value,this.id)'>
        <input type='text' id='".$row['item_code']."' class='bill_txt' name='item_mrp' value='".$row['item_mrp']."' onchange='change_mrp(this.value,this.id)' readonly>
        <input type='number' id='".$row['item_code']."' class='bill_txt' name='item_seling_price' ng-model='selling_price".$id."' ng-init='selling_price".$id."=".$row['item_selling_price']."' onchange='change_selling_price(this.value,this.id)'>
        <input type='number' id='total".$id."' class='bill_txt_total' name='item_total' value='{{selling_price".$id."*quantity".$id."}}'> <input type='button' id='".$row['item_code']."' class='bill_btn' value='X'>
        <span></span>";
    }while($row = mysqli_fetch_array($result));
    echo "<input type='text' id='id' name='id' value='".$id."' hidden readonly>";
    ?>
    <!--<span class='total_txt'><b>Total</b></span>
    <input type='number'  id='total_price' class="input_total">
    <input type='number' class="input_cash" onfocus='show_toast()' onchange='change_output_cash(this.value)'>
    <input type='number'class="output_cash" id="output_cash" readonly>
    <input type='text' name='validation' value='bill_save' hidden readonly>
    <input type=hidden value='dict_log' name='validation' >-->
    </form>
<br><br>
<br><br>
</div>
<div id="toast"><div id="img">INFO</div><div id="desc">Press Enter To Get Balance Amount</div></div>
<script src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/typeahead.js"></script>
</head>
<script>
    window.onload = function(){
        window.total_price();
    }
    function change_name(val,code) { 
        $.post("validate.php",
       {validation: 'bill_update_name',item_name: val, item_code: code},
       function(response){
           console.log(response);
       }
    );
}
function change_code(val,code) {
    $.post("validate.php",
       {validation: 'bill_update_code',item_code_new: val, item_code: code},
       function(response){
           console.log(response);
       }
    );
}
function change_quantity(val,code) {
    $.post("validate.php",
       {validation: 'bill_update_quantity',item_quantity: val, item_code: code},
       function(response){
           console.log(response);
       }
    );

    window.total_price();
}
function change_mrp(val,code) {
    $.post("validate.php",
       {validation: 'bill_update_mrp',item_mrp: val, item_code: code},
       function(response){
           console.log(response);
       }
    );
}
function change_selling_price(val,code) {
    $.post("validate.php",
       {validation: 'bill_update_selling_price',item_selling_price: val, item_code: code},
       function(response){
           console.log(response);
       }
    );

    window.total_price();
}
function total_price() {
    var i,x,total=0;
    var id=document.getElementById('id').value;
    for(i=1;i<=id;i++)
    {
        total_price_id='total'+i;
        x=document.getElementById(total_price_id).value;
        total=(total+x*1);
    }
    var x=document.getElementById('total_price');
    x.value=total;
    
    
}
function change_output_cash(value){
    var x=document.getElementById('total_price').value;
    sum=value-x;
    x = document.getElementById('output_cash');
    x.value=sum;
}
function show_toast(){
    var x = document.getElementById("toast")
    x.className = "show";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 10000);
}
function update(user_name) {
        $.ajax({
                    url: "search_item.php",
					data: {query:user_name, validation:4},
                    type: "POST",
                    success: function (data,status) {
                        document.getElementById("department_txt").value=data;
                    }
                });
    }

</script>
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
    $(document).ready(function(){
    $('.bill_btn').click(function(){
        var item_code = $(this).attr('id');
        var ajaxurl = 'validate.php',
        data =  {'validation': 'bill_item_delete', 'item_code': item_code};
        $.post(ajaxurl, data, function (response) {
            // Response div goes here.
            window.location.href='distribution.php';
        });
    });
});
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
                    }
                });
            }
        });
    });
$( ".bill_txt_qty" ).on('input', function() {
    var max=parseInt($(this).attr('name'));
    if ($(this).val()>parseInt($(this).attr('name'))){
        alert('Maximum Available Stock Is : '+ max);       
    }
});

</script>