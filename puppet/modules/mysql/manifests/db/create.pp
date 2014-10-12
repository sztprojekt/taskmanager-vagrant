define mysql::db::create ($dbname = $title) {
  exec { "mysql_db_create_${dbname}":
    command => "mysql -uroot -p${mysql::root_password} -e \"CREATE DATABASE IF NOT EXISTS ${dbname} CHARACTER SET utf8 COLLATE utf8_general_ci\"",
    path    => $mysql::bin,
    require => Exec['mysql_set_root'],
  }
}

