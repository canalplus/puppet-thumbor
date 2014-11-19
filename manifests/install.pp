# = Class: thumbor::install
#
# This class handles thumbor package installation (thtough pip)
#
class thumbor::install {
  package{ ['thumbor']:
    ensure   => present,
    provider => pip,
    require  => [Package['python-pip'], Package['libcurl4-openssl-dev'], Package['python-dev']],
  }
}
