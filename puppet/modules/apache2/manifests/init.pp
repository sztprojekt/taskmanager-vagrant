class apache2 {

  package { 'apache2':
    ensure  => installed,
  }

  file { 'site-config':
    ensure  => file,
    path    => '/etc/apache2/sites-enabled/000-default.conf',
    source  => 'puppet:///modules/apache2/000-default',
    require => Package['apache2'],
  }

  file { '/var/www':
    ensure  => link,
    target  => '/vagrant/web',
    force   => true,
    replace => true,
  }

  service { 'apache2':
    ensure     => running,
    hasrestart => true,
    subscribe  => File['site-config'],
  }
}
