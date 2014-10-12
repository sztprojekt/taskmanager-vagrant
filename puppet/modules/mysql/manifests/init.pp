class mysql ( $root_password = 'root', $db_name = 'vagrant_db') {
  $bin = '/usr/bin:/usr/sbin'

  package { ['mysql-server', 'mysql-client']:
    ensure => 'present',
  }

  service { 'mysql':
    enable  => 'true',
    ensure  => 'running',
    require => Package['mysql-server'],
  }

  # Set the root password.
  exec { 'mysql_set_root':
    unless  => "mysqladmin -uroot -p${root_password} status",
    command => "mysqladmin -uroot password ${root_password}",
    path    => $bin,
    require => Service['mysql'],
  }

  # Delete the anonymous accounts.
  mysql::user::drop { 'anonymous':
    user => '',
  }

  mysql::db::create { $db_name : }

  # Override default MySQL settings.
  file { '/etc/mysql/conf.d/vagrant.cnf':
    owner   => 'mysql',
    group   => 'mysql',
    source  => 'puppet:///modules/mysql/vagrant.cnf',
    notify  => Service['mysql'],
    require => Package['mysql-server'],
  }
}

