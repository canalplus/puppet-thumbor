# = Class: thumbor::service
#
# This class declares the service to handle thumbor
#
class thumbor::service {
  service { thumbor:
    require   => File['/etc/thumbor.conf',
                    '/etc/thumbor.key',
                    '/etc/default/thumbor',
                    '/etc/init.d/thumbor'],
    ensure    => running,
    subscribe => File['/etc/thumbor.conf',
                    '/etc/thumbor.key',
                    '/etc/default/thumbor',
                    '/etc/init.d/thumbor'],
  }
}
