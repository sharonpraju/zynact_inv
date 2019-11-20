<?php
session_start();
$admin=$_SESSION['admin'];
$section=$_SESSION['section'];
$_SESSION['admin']=$admin;
$_SESSION['section']=$section;
?>