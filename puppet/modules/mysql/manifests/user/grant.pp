define mysql::user::grant ($user = $title, $host, $database, $table = '*', $privileges = 'ALL PRIVILEGES') {
  exec { "mysql_user_grant_${user}@${host}_${database}.${table}_${privileges}":
    command => "mysql -uroot -p${mysql::root_password} -e \"GRANT ${privileges} ON ${database}.${table} TO '${user}'@'${host}'; FLUSH PRIVILEGES;\"",
    path    => $mysql::bin,
    require => [ Exec['mysql_set_root'], Exec["mysql_db_create_${database}"] ],
  }
}

