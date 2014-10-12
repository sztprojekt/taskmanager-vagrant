define mysql::user::create ($user = $title, $password, $host) {
  exec { "mysql_user_create_${user}@${host}":
    command => "mysql -uroot -p${mysql::root_password} -e \"CREATE USER '${user}'@'${host}' IDENTIFIED BY '${password}'\"",
    onlyif  => "mysql -uroot -p${mysql::root_password} -e \"SELECT EXISTS(SELECT `user` FROM `mysql`.`user` WHERE `user` = '${user}' AND `host` = '${host}');\"",
    path    => $mysql::bin,
    require => Exec['mysql_set_root'],
  }
}

