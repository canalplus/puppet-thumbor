# = Class: thumbor
#
# This module manages thumbor
#
# == Parameters:
#   [*security_key*]
#     Thumbor security_key (used for hash): you should edit this value ASAP.
#     Default: MY_SECURE_KEY
#
#   [*port*]
#     Thumbor port.
#     Default: 8888
#
#   [*ip*]
#     Thumbor ip.
#     Default: 0.0.0.0
#
#   [*config*]
#     Thumbor config hash.
#     Default: {}
#
#   [*service*]
#     Should we declare a service?
#     Default: false
#
# == Actions:
#
# == Requires:
#
# == Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class thumbor (
    $security_key = 'MY_SECURE_KEY',
    $port         = '8888',
    $ip           = '0.0.0.0',
    $config       = { },
    $service      = false,
) {
    class { thumbor::install: }
    ->
    class { thumbor::config: }

    if $service {
        class { thumbor::service:
            require => Class['thumbor::config']
        }
    }
}
