include motd
class { 'coreutils': vim => false }
include 'ppa-load'
include nodejs
include ruby
class { 'my-postgresql':
  db      => 'vagrant',
  db_user => 'vagrant',
  db_pass => 'vagrant',
}
include ubuntu
