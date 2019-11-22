<?php
session_start();
if(!isset($_SESSION['admin']))
  {
      header("location:index.html");
  }
?>
<link rel="stylesheet" href="css/settings.css">

<center>
  <br>
  <b>Change Password</b>
  <br>
  <br>
        <div class="chng_password" id="chng_password">
        <br>
          <form method="post" action="validate.php">
            <input class="chng_txt" required name="id" type="text" placeholder="  Username">
            <input class="chng_txt" required name="password" type="password" placeholder="  Current Password">
            <input class="chng_txt" required name=new_pass type="password" placeholder="  New Password">
            <input type="hidden"  name="validation"  value="chng_pass" >
            <br>
            <input class="chng_submit" type="Submit" value="Submit">
          </form>
        </div>
</center>