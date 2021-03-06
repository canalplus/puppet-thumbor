puppet-thumbor
==============

Puppet module to deploy Thumbor http://github.com/globocom/thumbor

This is a fork of https://github.com/viadeo/puppet-thumbor but allowing installation through pip instead of apt.

To test it with vagrant http://www.vagrantup.com/

```
mkdir modules
git clone git://github.com/Bladrak/puppet-thumbor.git modules/thumbor
cd modules/thumbor/tests
vagrant up
```

Now go on your favorite browser and open http://127.0.0.1:8888/unsafe/200x200/http://farm9.staticflickr.com/8145/7474160854_1f963b155d_o.jpg (as an example)

How to use it in your manifest
------------------------------

Default configuration of your instance of Thumbor:
```
include thumbor
```

or

```
class { thumbor: }
```

is equivalent to

```
class { 'thumbor':
  security_key => 'MY_SECURE_KEY',
  port         => '8888',
  ip           => '0.0.0.0',
  config       => {},
  service      => false,
}
```

This module install the packages `python-pip`, `libcurl4-openssl-dev` and `python-dev` if they are not installed before.

Configuration
-------------

  * `security_key` to use thumbor signed API ( cf. https://github.com/globocom/thumbor/wiki/Security )
  * `port` to set listening ports of thumbor instances (multiple ports can be precises separated by coma: 1 port = 1 thumbor instance)
  * `ip` to set the listening ip for all thumbor instances
  * `config` a hash to set config parameters ( Ex. : config => { 'MAX_WIDTH' => 800, 'MAX_HEIGHT' => 800, 'STORAGE'=> 'thumbor.storage.no_storage' } ). You can refer to Thumbor wiki for configuration options https://github.com/globocom/thumbor/wiki/Configuration 
  * `service` : set to true to create a linux service
