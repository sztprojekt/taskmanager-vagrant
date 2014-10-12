include motd
class { 'coreutils': vim => false }
include 'ppa-load'
include nodejs
include ruby
include ubuntu
