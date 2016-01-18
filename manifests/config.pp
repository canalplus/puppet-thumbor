# = Class: thumbor::config
#
# This class handles thumbor conf files creation
#
class thumbor::config {
    file { '/etc/default/thumbor':
        ensure  => present,
        owner   => root,
        group   => root,
        mode    => 0644,
        content => template('thumbor/default.erb'),
    }
    file { '/etc/thumbor.conf':
        ensure  => present,
        owner   => root,
        group   => root,
        mode    => 0644,
        content => template('thumbor/thumbor.conf.erb')
    }
    file { '/etc/thumbor.key':
        ensure  => present,
        owner   => root,
        group   => root,
        mode    => 0600,
        content => $thumbor::security_key,
    }
    file { '/etc/init.d/thumbor':
        ensure  => present,
        owner   => root,
        group   => root,
        mode    => 0744,
        content => template('thumbor/init.erb')
    }
}
