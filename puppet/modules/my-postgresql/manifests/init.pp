class my-postgresql ( $db, $db_user, $db_pass = ''){

  class { 'postgresql::globals':
    version => '9.3',
    manage_package_repo => true,
    encoding => 'UTF8',
    locale  => 'en_US.utf8',
  }->
  class { 'postgresql::server':
    ensure => 'present',
    listen_addresses => '*',
    manage_firewall => true,
  }

  postgresql::server::db { $db :
    user     => $db_user,
    password => postgresql_password($db_user, $db_pass),
  }

  postgresql::server::pg_hba_rule { 'allow access from host machine':
    description => 'Open up postgresql for access on private network',
    type => 'host',
    database => 'all',
    user => 'all',
    address => '192.168.0.0/16',
    auth_method => 'md5',
  }

  postgresql::server::pg_hba_rule { 'allow access from host machine 2':
    description => 'Open up postgresql for access on private network',
    type => 'host',
    database => 'all',
    user => 'all',
    address => '10.0.0.0/8',
    auth_method => 'md5',
  }

  package { 'postgresql-server-dev-9.3':
    ensure  => present,
    require => Class['postgresql::server'],
  }
}
