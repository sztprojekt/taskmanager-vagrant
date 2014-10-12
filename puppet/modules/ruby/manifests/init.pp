class ruby {
  include rvm

  file { '/home/vagrant/rvmrc':
    content => 'umask u=rwx,g=rwx,o=rx
                export rvm_max_time_flag=20',
    mode    => '0664',
    before  => Class['rvm'],
  }

  rvm::system_user { vagrant: ; }

  rvm_system_ruby {
    'ruby-2.1.3':
      ensure      => 'present',
      default_use => true,
      require     => Class['rvm'],
  }

  rvm_gem {
    'rails':
      name         => 'rails',
      ruby_version => 'ruby-2.1.3',
      ensure       => latest,
      require      => Rvm_system_ruby['ruby-2.1.3'],
  }
}
