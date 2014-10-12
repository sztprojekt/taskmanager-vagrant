class nodejs {

    Exec {
      path => '/usr/bin:/bin',
    }

    $once_lock = '/var/lock/.vagrant-node'

    package { 'nodejs':
      ensure  => installed,
      require => Class['ppa-load']
    }

    exec { 'node-install-proof':
      command => "touch $once_lock",
      creates => $once_lock,
      notify  => Exec['install-gulp-bower'],
    }

    exec { 'install-gulp-bower':
      command     => '/usr/bin/npm -g install bower gulp',
      require     => Package['nodejs'],
      refreshonly => true,
    }
}

