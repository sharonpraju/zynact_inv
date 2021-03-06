<?php
include('db_connection.php');
$conn = OpenCon();
session_start();
if(!isset($_SESSION['admin']))
{
    header("location:index.html");
}
?>
<link rel="stylesheet" href="css/settings.css">
  <script src="js/modernizr.min.js" type="text/javascript"></script>
  <link rel="stylesheet" href="css/normalize.min.css">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/jquery.minicolors.css">
  <link rel="stylesheet" href="css/highlight-github.css">
  
  <style>
    a{
      color:#ffffff;
    }
  </style>
  <div id="settings_div">
    <br><br><br><br><br><br><br><br>
    <form method="POST" action="validate.php">
    <div ng-app="app" ng-controller="ColorCtrl" ng-init="updateColors()" class="container">
    <div class="color-select">
      <div class="color_code">
          <strong>Primary Color</strong>
          <input minicolors ng-model="colorInput" name="primary_color" class="form-control" type="text">
      </div>
      <div class="color_code">
          <strong>Secondary Color</strong>
          <input minicolors ng-model="colorInput_1" name="secondary_color" class="form-control" type="text">
      </div>
      <div class="color_code">
          <strong>Component Color</strong>
          <input minicolors ng-model="colorInput_2" name="component_color" class="form-control" type="text">
      </div>
      <input type=hidden name=validation value=chng_color>
    </div>
  </div>
  <input class="clr_submit" type="submit" value="Save">
  </form>
  <div class="styles"></div>
  <br>
  <br>
  </div>
  <script src="js/jquery.min.js"></script>
  <script src="js/angular.min.js"></script>
  <script src="js/jquery.minicolors.js"></script>
  <script src="js/angular-minicolors.js"></script>
  <script src="js/ui-bootstrap-tpls.min.js"></script>
  <script src="js/sass.min.js"></script>
  <script src="js/highlight.pack.js"></script>
  <script src="js/angular-highlightjs.min.js"></script>
  <script  src="js/settings.js"></script>