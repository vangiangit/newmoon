<?php
//Get Seccsion
$value = "";
if(isset($_SESSION["visit"])) $value = $_SESSION["visit"];
//Write hits count
if($value != 1){
	$db->query("UPDATE fs_visited SET vis_count = vis_count + 1 WHERE vis_id = 1");
	unset($db_hit);
	$_SESSION["visit"] = 1;
}
$visited_timeout = 15 * 60; //
$last_visited_time = getdate();
$last_visited_time = $last_visited_time[0];
//Kiem tra co session_id hay ko, neu co
if (session_id() != ""){
	$query = "	REPLACE INTO fs_users_online(au_session_id,au_last_visit) 
				VALUES('" . session_id() . "'," . $last_visited_time . ")";
	$db->query($query);		  
}
// Delete timeout
$query = "	DELETE FROM fs_users_online
			WHERE au_last_visit < " . ($last_visited_time - $visited_timeout);
$db->query($query);	