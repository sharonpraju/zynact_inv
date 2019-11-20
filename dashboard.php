<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>MBC Inventory</title>
  
  <link rel='stylesheet' href='css/line-awesome-font-awesome.min.css'>
  <link rel="stylesheet" href="css/dashboard.css">
  
</head>
<body>
<center>
  <div class="search_div"> 
<div class="page">
<b>
  <div id="home-news">
    <div class="home_header">
      <strong>MBC</strong>
      <span> College of Engineering</span>
    </div>
    <div class="home_header">
      <strong> Worship. Study.</strong>
      <span> Service</span>
    </div>
    <div class="home_header">
      <span>   Kuttikkanam </span>
      <strong>Peermade</strong>
    </div>
  </div>
</b>
</div>
</div>
</center>
<script>
  window.console = window.console || function(t) {};
</script>
<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>
<script src='js/jquery.min.js'></script>
<script id="rendered-js">
      function switchClass(i) {
  var lis = $('#home-news > div');
  lis.eq(i).removeClass('home_header_on');
  lis.eq(i).removeClass('home_header_out');
  lis.eq(i = ++i % lis.length).addClass('home_header_on');
  lis.eq(i = ++i % lis.length).addClass('home_header_out');
  setTimeout(function () {
    switchClass(i);
  }, 3500);
}
$(window).load(function () {
  switchClass(-1);
});
      //# sourceURL=pen.js
</script>
<div class="left">
    <br>
    <br>
    <img src="img/mbc_logo.png" class="logo">
    <br>
    <br>
    <br>
	  <form method="post">
      <div><a class="left_btn" onclick="go('inventory_status.php')"> <img class="icon" src="img/dashboard.png"> <b> <div class="btn_div"><br>Dashboard </div></b></a></div>
      <br>
      <br>
      <br>
      <div><a class="left_btn" onclick="go('add_stock.php')"> <img class="icon" src="img/add_item.png"> <b> <br><div class="btn_div"> Add Stock </div></b></a></div>
      <br>
      <br>
      <br>
      <div><a class="left_btn" onclick="go('stock_management.php')"> <img class="icon" src="img/stock.png"> <b> <br><div class="btn_div"> Stock Management </div></b></a></div>
      <br>
      <br>
      <br>
      <div><a class="left_btn" onclick="go('distribution.php')"> <img class="icon" src="img/sale.png"> <b> <div class="btn_div"> Product Distribution </div></b> </a></div>
      <br>
      <br>
      <br>
      <div><a class="left_btn" onclick="go('settings.php')"> <img class="icon" src="img/settings.png"> <b> <div class="btn_div"><br>Settings </div></b></a></div>
  </form>
</div>
<div class="right">
<iframe id="content_frame" src="inventory_status.php"></iframe>
</div>
<script>
  function go(url) {
    var iframe = document.getElementById('content_frame');
    iframe.src = url;
  }

  setInterval(function()
  {
    $.ajax({
              url: "session_reload.php",
					    data: '',            
              dataType: "json",
              type: "POST",
              success: function (data) {
              }
            });
  }, 10000);

  </script>

  <script src='js/jquery.min.js'></script>
    <script  src="js/dashboard.js"></script>
    <script src='js/jquery-2.2.4.min.js'></script>
<script src='js/angular.min.js'></script>
<script src='js/highcharts.js'></script>
<script src='js/ui-bootstrap-tpls.js'></script>
</body>
</html>
