class ubuntu {

  Exec {
    path => '/usr/bin:/bin',
  }

  $once_lock = '/var/lock/.vagrant-locale'

  exec { 'locale-install-proof':
    command => "touch $once_lock",
    creates => $once_lock,
    notify  => Exec['language-pack-UTF-8'],
  }

  exec { 'language-pack-UTF-8':
    command     => '/usr/sbin/locale-gen UTF-8',
    refreshonly => true,
  }
}
