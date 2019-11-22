  <?php
  session_start();
  if(!isset($_SESSION['admin']))
  {
      header("location:index.html");
  }
  ?>
  <link rel="stylesheet" href="css/settings.css">
  <script src="js/modernizr.min.js" type="text/javascript"></script>
  <link rel="stylesheet" href="css/normalize.min.css">
  <link rel='stylesheet' href='css/bootstrap.min.css'>
  <link rel='stylesheet' href='css/jquery.minicolors.css'>
  <link rel='stylesheet' href='css/highlight-github.css'>
  <style>
    a{
      color:#ffffff;
    }
  </style>
  <div class="btn_div">
<div class="a_btn"><button onclick="go('user_credentials.php')">User Credentials</button></div>
<div class="a_btn"><button onclick="go('add_category.php')">Manage Category</button></div>
<div class="a_btn"><button onclick="go('manage_supplier.php')">Manage Supplier</button></div>
<div class="a_btn"><button onclick="go('add_item.php')">Add Item</button></div>
<div class="a_btn"><button onclick="go('reports.php')">Reports</button></div>
<div class="a_btn"><button onclick="go('department_sub_section.php')">Department Sub Section</button></div>
</div>
<iframe id="content_frame" src="inv_theme.php"></iframe>
</div>
<script>
  function go(url) {
    var iframe = document.getElementById('content_frame');
    iframe.src = url;
  }
  </script>
  <script src='js/jquery.min.js'></script>
  <script src='js/angular.min.js'></script>
  <script src='js/jquery.minicolors.js'></script>
  <script src='js/angular-minicolors.js'></script>
  <script src='js/ui-bootstrap-tpls.min.js'></script>
  <script src='js/sass.min.js'></script>
  <script src='js/highlight.pack.js'></script>
  <script src='js/angular-highlightjs.min.js'></script>
  <script  src="js/settings.js"></script>