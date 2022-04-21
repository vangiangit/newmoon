<?php
/**
 * @final 19/04/2013
 */
  
class Mysql_DB
{
    var $conn_id;
    var $query_id;
    var $record;
    var $db;
    var $port;
    function Mysql_DB()
    {
        global $dbDefault;
        $this->db = $dbDefault;
        if (empty($dbDefault['hostport']))
            $this->port = 3306;
        else
            $this->port = $dbDefault['hostport'];
    }
    function connect()
    {
        global $dbDefault;
        $this->conn_id = @mysql_pconnect($dbDefault['hostname'] . ":" . $this->port, $dbDefault['username'],
            $dbDefault['password']);
        if ($this->conn_id === false)
            $this->sql_error("Connection Error");
        if (!@mysql_select_db($dbDefault['database'], $this->conn_id))
            $this->sql_error("Database Error");
        return $this->conn_id;
    }
    function close()
    {
        return mysql_close($this->conn_id);
    }
    function query($query_string)
    {
        $this->connect();
        mysql_query("SET NAMES 'utf8'");
        $this->query_id = @mysql_query($query_string, $this->conn_id);
        if (!$this->query_id)
        {
            $this->sql_error("Query Error", $query_string);
        }
        return $this->query_id;
        $this->close();
    }
    function query_limit($query_string, $limit, $page = 0)
    {
        if (!$page)
            $page = 1;
        if ($page < 0)
            $page = 1;
        $start = ($page - 1) * $limit;
        $query_string = $query_string . " LIMIT $start,$limit ";
        $this->connect();
        mysql_query("SET NAMES 'utf8'");
        $this->query_id = @mysql_query($query_string, $this->conn_id);
        if (!$this->query_id)
        {
            $this->sql_error("Query Error", $query_string);
        }
        return $this->query_id;
        $this->close();
    }
    function query_limit_export($query_string, $start, $end)
    {
        $start = $start;
        $query_string = $query_string . " LIMIT $start,$end ";
        $this->connect();
        mysql_query("SET NAMES 'utf8'");
        $this->query_id = @mysql_query($query_string, $this->conn_id);
        if (!$this->query_id)
        {
            $this->sql_error("Query Error", $query_string);
        }
        return $this->query_id;
        $this->close();
    }
    function insert_id()
    {
        return mysql_insert_id();
    }
    function escape_string($str)
    {
        return mysql_real_escape_string($str, $this->conn_id);
    }
    /*
    * Return one record
    */
    function fetch_row($query_id = -1)
    {
        if ($query_id != -1)
            $this->query_id = $query_id;
        $this->record = @mysql_fetch_row($this->query_id);
        return $this->record;
    }
    /*
    * get result as Object list
    */
    function getObjectList($query_id = -1)
    {
        $data = array();
        if ($query_id != -1)
            $this->query_id = $query_id;
        while ($row = @mysql_fetch_object($this->query_id))
        {
            $data[] = $row;
        }
        return $data;
    }
    function resultArray($query_id = -1)
    {
        $data = array();
        if ($query_id != -1)
            $this->query_id = $query_id;
        while ($row = @mysql_fetch_array($this->query_id))
        {
            $data[] = $row;
        }
        return $data;
    }
    function getObjectListByKey($key, $query_id = -1)
    {
        $data = array();
        if (!$key)
            $key = 'id';
        if ($query_id != -1)
            $this->query_id = $query_id;
        while ($row = @mysql_fetch_object($this->query_id))
        {
            $data[$row->$key] = $row;
        }
        return $data;
    }
    /*
    * get result as Object. 
    */
    function getObject($query_id = -1)
    {
        if ($query_id != -1)
            $this->query_id = $query_id;
        $row = @mysql_fetch_object($this->query_id);
        return $row;
    }
    /*
    * get result when select one field in 1 record. 
    */
    function getResult($query_id = -1)
    {
        if ($query_id != -1)
            $this->query_id = $query_id;
        $result = mysql_fetch_row($this->query_id);
        return $result[0];
    }
    function fetch_array($query_id = -1)
    {
        if ($query_id != -1)
            $this->query_id = $query_id;
        $this->record = @mysql_fetch_array($this->query_id);
        return $this->record;
    }
    function dump($query_string)
    {
        $this->record = array();
        $data = array();
        $this->query_id = $this->query($query_string);
        while ($row = @mysql_fetch_array($this->query_id))
        {
            $data[] = $row;
            $this->record = $data;
        }
        return $this->record;
    }
    function selectoptionfromsql($query_string, $value, $name)
    {
        $this->record = array();
        $query_id = $this->query($query_string);
        while ($row = @mysql_fetch_array($query_id))
        {
            $data = array($row[$value] => $row[$name]);
            $data = implode(',', $data);
            $this->record[$row[$value]] = $data;
        }
        return $this->record;
    }
    function query_first($query_string)
    {
        $this->query($query_string);
        $returnarray = $this->fetch_array($this->query_id);
        $this->free_result($this->query_id);
        return $returnarray;
    }
    function getTotal($query_id = -1)
    {
        if ($query_id != -1)
            $this->query_id = $query_id;
        return @mysql_num_rows($this->query_id);
    }
    /*
    * Return the NUMBER of affected rows by the last INSERT, UPDATE, REPLACE or DELETE
    */
    function affected_rows($query_id = -1)
    {
        if ($query_id != -1)
            $this->query_id = $query_id;
        $result = @mysql_affected_rows();
        return $result;
    }
    /*
    * Return the Id of affected rows by the last INSERT
    */
    function insert($query_id = -1)
    {
        if ($query_id != -1)
            $this->query_id = $query_id;
        $result = @mysql_insert_id();
        return $result;
    }
    function free_result($query_id = -1)
    {
        if ($query_id != -1)
            $this->query_id = $query_id;
        return @mysql_free_result($this->query_id);
    }
    function deleteSQL($table_name, $where = '')
    {
        $query_string = "delete from " . $table_name . " $where";
        $this->query($query_string);
    }
    
    /**
     * If language not default : tablename = tablename + lang 
     */ 
    function getTablename($table_name)
    {
        $lang = $this->hasLang();
        if (!$lang)
            return $table_name;
        else
        {
            if ($this->checkExistTable($table_name . "_" . $lang))
                return $table_name . "_" . $lang;
            else
                return $table_name;
        }
    }

    /**
     * Kiểm tra xem có đa ngôn ngữ không
     * @return Bool : language: default OR not exist
     */ 
    function hasLang(){
        if (!isset($_SESSION['lang']))
            return false;
        else{
            $sql = "SELECT id,`default` 
    				FROM fs_languages 
    				WHERE lang_sort = '" . $_SESSION['lang'] . "'	";
            $db = new Mysql_DB();
            $db->query($sql);
            $rs = $db->getObject();
            if (!$rs){
                return false;
            }else{
                if ($rs->default == 1)
                    return false;
            }
        }
        return $_SESSION['lang'];
    }
    
    /**
     * Kiểm tra có tồn tại table không
     * @param String
     * @return Bool
     */  
    function checkExistTable($tablename){
        global $dbDefault;
        $sql = 'SELECT  TABLE_NAME  
                FROM INFORMATION_SCHEMA.TABLES 
                WHERE TABLE_TYPE=\'BASE TABLE\' AND TABLE_NAME=\''.$tablename.'\' AND TABLE_SCHEMA = \'' . $dbDefault['database'] .'\'';
        $db = new Mysql_DB();
        $db->query($sql);
        $rs = $db->getResult();
        if($rs)
            return true;
        return false;
    }
    
    function get_records($where = '', $table_name = '', $select = '*', $ordering = '', $limit = '', $field_key = '') {
		$sql_where = " ";
		if ($where) {
			$sql_where .= ' WHERE ' . $where;
		}
		if (! $table_name)
			$table_name = $this->table_name;
		$query = " SELECT " . $select . "
					  FROM " . $table_name . $sql_where;
		if ($ordering)
			$query .= ' ORDER BY ' . $ordering;
		if ($limit)
			$query .= ' LIMIT ' . $limit;
		
		$db = new Mysql_DB();
		$sql = $db->query ( $query );
		if (! $field_key)
			$result = $db->getObjectList ();
		else
			$result = $db->getObjectListByKey ( $field_key );
		return $result;
	}
    
    /**
     * Hiển thị lỗi Database
     * @return String
     */ 
    function sql_error($message, $query = ""){
        $msgbox_title = $message;
        echo $msgbox_title;
        $sqlerror = "<table width='100%' border='1' cellpadding='0' cellspacing='0'>";
        $sqlerror .= "<tr><th colspan='2'>SQL SYNTAX ERROR</th></tr>";
        $sqlerror .= ($query != "") ? "<tr><td nowrap> Query SQL</td><td nowrap>: " . $query ."</td></tr>\n" : "";
        $sqlerror .= "<tr><td nowrap> Error Number</td><td nowrap>: " . mysql_errno() ." " . mysql_error() . "</td></tr>\n";
        $sqlerror .= "<tr><td nowrap> Date</td><td nowrap>: " . date("D, F j, Y H:i:s") ."</td></tr>\n";
        $sqlerror .= "<tr><td nowrap> IP</td><td>: " . getenv("REMOTE_ADDR") ."</td></tr>\n";
        $sqlerror .= "<tr><td nowrap> Browser</td><td nowrap>: " . getenv("HTTP_USER_AGENT") ."</td></tr>\n";
        $sqlerror .= "<tr><td nowrap> Script</td><td nowrap>: " . getenv("REQUEST_URI") ."</td></tr>\n";
        $sqlerror .= "<tr><td nowrap> Referer</td><td nowrap>: " . getenv("HTTP_REFERER") ."</td></tr>\n";
        $sqlerror .= "<tr><td nowrap> PHP Version </td><td>: " . PHP_VERSION ."</td></tr>\n";
        $sqlerror .= "<tr><td nowrap> OS</td><td>: " . PHP_OS . "</td></tr>\n";
        $sqlerror .= "<tr><td nowrap> Server</td><td>: " . getenv("SERVER_SOFTWARE") ."</td></tr>\n";
        $sqlerror .= "<tr><td nowrap> Server Name</td><td>: " . getenv("SERVER_NAME") ."</td></tr>\n";
        $sqlerror .= "</table>";
        $msgbox_messages = "<meta http-equiv=\"refresh\" content=\"9999\">\n<table class='smallgrey' cellspacing=1 cellpadding=0>" .
        $sqlerror . "</table>";
        $msg_header = "header_listred.gif";
        $msg_icon = "msg_error.gif";
        $imagesdir = "images";
        $redirecturl = '';
        $lang['gallery_back'] = "Back to the last request";
        if (!$templatefolder)
            $templatefolder = "templates";
        print $msgbox_messages;
        exit;
    }
}
?>