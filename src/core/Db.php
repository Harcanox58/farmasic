<?php

class Db
{
    private static $instance;
    public static $db, $pdo, $sql;
    private function __construct()
    {
        self::$db = new PDO("mysql:host=" . _DB_HOST_ .
            ";dbname=" . _DB_NAME_, _DB_USER_, _DB_PASSWD_, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES ' . _DB_CHARSET_, PDO::MYSQL_ATTR_USE_BUFFERED_QUERY => false));
        self::$pdo = 'PDO::FETCH_ASSOC';
    }
    public static function getInstance()
    {
        if (!self::$instance instanceof self) {
            try {
                self::$instance = new self;
            } catch (PDOException $err) {
                echo $err->getMessage();
            }
        }
        return self::$instance;
    }
    public function Execute($sql, $statement = null)
    {
        $r = self::$db->prepare($sql);
        $r->execute($statement);
        return $r->fetch();
    }
    public function ExecuteS($sql)
    {
        $r = self::$db->prepare($sql);
        $r->execute();
        return $r->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Initiates a transaction
     *
     * @return bool
     */
    public function beginTransaction()
    {
        return self::$db->beginTransaction();
    }

    /**
     * Commits a transaction
     *
     * @return bool
     */
    public function commit()
    {
        return self::$db->commit();
    }

    /**
     * Fetch the SQLSTATE associated with the last operation on the database handle
     * 
     * @return string 
     */
    public function errorCode()
    {
        return self::$db->errorCode();
    }

    /**
     * Fetch extended error information associated with the last operation on the database handle
     *
     * @return array
     */
    public function errorInfo()
    {
        return self::$db->errorInfo();
    }
    public function select($sql, $statement = null)
    {
        $r = self::$db->prepare($sql);
        $r->execute($statement);
        return $r->fetchAll(self::$pdo);
    }
    public function test()
    {
    }
    public function where($sql, $statement = null)
    {
        $r = self::$db->prepare($sql);
        $r->execute($statement);
        return $r->fetch(self::$pdo);
    }
    public function insert($table, $data)
    {
        $sql = "INSERT INTO " . _DB_PREFIX_ . $table . " (";
        $sql .= implode(',', array_keys($data));
        $sql .= ") VALUES ('";
        $sql .= implode("','", array_values($data));
        $sql .= "')";
        $res = Db::getInstance()->Execute($sql);
        if (!empty($res)) {
            return true;
        } else {
            return false;
        }
    }
    public function update($table, $data, $where)
    {
        $sql = "UPDATE " . _DB_PREFIX_ . $table . " SET ";
        $sql .= implode("=?, ", array_keys($data));
        $sql .= "=? WHERE " . $where;
        $res = Db::getInstance()->Execute($sql, array_values($data));
        if (!empty($res)) {
            return true;
        } else {
            return false;
        }
    }
    /**
     * Execute an SQL statement and return the number of affected rows
     *
     * @param string $statement
     */
    public function exec($statement)
    {
        return self::$db->exec($statement);
    }

    /**
     * Retrieve a database connection attribute
     *
     * @param int $attribute
     * @return mixed
     */
    public function getAttribute($attribute)
    {
        return self::$db->getAttribute($attribute);
    }

    /**
     * Prepares a statement for execution and returns a statement object 
     *
     * @param string $statement A valid SQL statement for the target database server
     * @param array $driver_options Array of one or more key=>value pairs to set attribute values for the PDOStatement obj 
returned  
     * @return PDOStatement
     */
    public function prepare($statement, $driver_options = false)
    {
        if (!$driver_options) $driver_options = array();
        return self::$db->prepare($statement, $driver_options);
    }

    /**
     * Executes an SQL statement, returning a result set as a PDOStatement object
     *
     * @param string $statement
     * @return PDOStatement
     */
    public function runQuery($statement)
    {
        return self::$db->query($statement);
    }

    /**
     * Execute query and return all rows in assoc array
     *
     * @param string $statement
     * @return array
     */
    public function queryFetchAllAssoc($statement)
    {
        return self::$db->query($statement)->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Execute query and return one row in assoc array
     *
     * @param string $statement
     * @return array
     */
    public function queryFetchRowAssoc($statement)
    {
        return self::$db->query($statement)->fetch(PDO::FETCH_ASSOC);
    }

    /**
     * Execute query and select one column only 
     *
     * @param string $statement
     * @return mixed
     */
    public function queryFetchColAssoc($statement)
    {
        return self::$db->query($statement)->fetchColumn();
    }

    /**
     * Quotes a string for use in a query
     *
     * @param string $input
     * @param int $parameter_type
     * @return string
     */
    public function quote($input, $parameter_type = 0)
    {
        return self::$db->quote($input, $parameter_type);
    }

    /**
     * Rolls back a transaction
     *
     * @return bool
     */
    public function rollBack()
    {
        return self::$db->rollBack();
    }

    /**
     * Set an attribute
     *
     * @param int $attribute
     * @param mixed $value
     * @return bool
     */
    public function setAttribute($attribute, $value)
    {
        return self::$db->setAttribute($attribute, $value);
    }
}
