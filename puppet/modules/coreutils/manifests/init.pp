class coreutils ($vim = false) {

  package { 'wget':
    ensure => installed,
  }

  package { 'curl':
    ensure => installed,
  }

  package { 'git':
    ensure => installed,
  }

  if $vim {
    include coreutils::vim
  }
}
