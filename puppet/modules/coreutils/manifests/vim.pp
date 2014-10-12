class coreutils::vim {

  package { 'vim':
    ensure  => installed,
  }

  exec { 'dotfiles-install':
    command => '/usr/bin/git clone https://github.com/adamors/dotfiles.git /home/vagrant/dotfiles',
    require => Package['git'],
  }

  exec { 'dotfiles-symlink':
    command => '/bin/ln -s /home/vagrant/dotfiles/vim/vim /home/vagrant/.vim \
    && /bin/ln -s /home/vagrant/dotfiles/vim/vimrc /home/vagrant/.vimrc',
    require => Exec['dotfiles-install'],
  }

  exec { 'vundle':
    command => '/usr/bin/git clone https://github.com/gmarik/vundle.git \
    /home/vagrant/.vim/bundle/vundle && vim +BundleInstall +qall',
    require => Exec['dotfiles-symlink'],
  }
}
