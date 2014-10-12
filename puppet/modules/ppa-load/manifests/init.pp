class ppa-load {

  Exec {
    path => '/usr/bin:/bin',
  }

  $once_lock = '/var/lock/.vagrant-ppa'

  include apt
  apt::ppa { 'ppa:ondrej/php5': }
  apt::ppa { 'ppa:chris-lea/node.js': }


  exec { 'ppa-install-proof':
    command => "touch $once_lock",
    creates => $once_lock,
    notify  => Exec['apt-update'],
  }

  exec { 'apt-update':
      command     => '/usr/bin/apt-get update',
      refreshonly => true,
  }
}
