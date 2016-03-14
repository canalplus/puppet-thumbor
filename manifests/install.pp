# = Class: thumbor::install
#
# This class handles thumbor package installation (thtough pip)
#
class thumbor::install (
    $venv = 'system',
    $user = 'root',
) {
    validate_string($venv)

    if ! defined(Package['libcurl4-openssl-dev']) {
        package { 'libcurl4-openssl-dev': }
    }

    python::pip { 'thumbor':
        ensure     => $thumbor::version,
        virtualenv => $venv,
        owner      => $user,
        require    => [Python::Virtualenv[$venv], Package['libcurl4-openssl-dev']],
    }
}
