# = Class: thumbor::service
#
# This class declares the service to handle thumbor
#
class thumbor::service {
    service { 'thumbor':
        ensure    => running,
        require   => File['/etc/thumbor.conf',
            '/etc/thumbor.key',
            '/etc/default/thumbor',
            '/etc/init.d/thumbor'],
        subscribe => File['/etc/thumbor.conf',
            '/etc/thumbor.key',
            '/etc/default/thumbor',
            '/etc/init.d/thumbor'],
    }
}
