# = Class: thumbor
#
# This module manages thumbor
#
# == Parameters:
#
# == Actions:
#
# == Requires:
#
# == Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class thumbor ( 
  $security_key='MY_SECURE_KEY', 
  $port='8888', 
  $ip='0.0.0.0', 
  $config = {}, 
  $conffile = '/dev/null'
) {

    ## Modules
    include thumbor::install
    include thumbor::config
    include thumbor::service

    ## Ordering
    Class['thumbor::install']
    -> Class['thumbor::config']
    -> Class['thumbor::service']
}
