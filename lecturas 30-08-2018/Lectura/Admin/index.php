<?php
//habilitar short tags php 
//short_open_tag=On
include_once("controllers/home.php");
$show = New home();
$show->init();
?>