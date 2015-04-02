# = Class: thumbor::install
#
# This class handles thumbor package installation (thtough pip)
#
class thumbor::install {

  # Check required package for Thumbor install
  if ! defined(Package['python-pip']) {
    package { 'python-pip': }
  }

  if ! defined(Package['libcurl4-openssl-dev']) {
    package { 'libcurl4-openssl-dev': }
  }

  if ! defined(Package['python-dev']) {
    package { 'python-dev': }
  }

  package{ 'thumbor':
    ensure   => present,
    provider => pip,
    require  => [Package['python-pip'], Package['libcurl4-openssl-dev'], Package['python-dev']],
  }
}
