# Puppet class to make
class puppet (
  $version = '3.7.3-1puppetlabs1',
) {
  ::apt::source { 'puppetlabs':
    location    => 'http://apt.puppetlabs.com',
    repos       => 'main',
    include_src => false,
    key         => '4BD6EC30',
    key_server  => 'pool.sks-keyservers.net',
  }

  ::apt::source { 'puppetlabs_dependencies':
    location    => 'http://apt.puppetlabs.com',
    repos       => 'dependencies',
    include_src => false,
    key         => '4BD6EC30',
    key_server  => 'pool.sks-keyservers.net',
  }

  package { 'puppet':
    ensure  => $version,
    notify  => Service['puppet'],
    require => [
      Apt::Source['puppetlabs'],
      Apt::Source['puppetlabs_dependencies'],
    ],
  }

  package { 'puppet-common':
    ensure  => $version,
    notify  => Service['puppet'],
    require => [
      Apt::Source['puppetlabs'],
      Apt::Source['puppetlabs_dependencies'],
    ],
  }

  augeas { 'puppet_default':
    context => '/files/etc/default/puppet',
    changes => [
      'set START yes',
    ],
    require => Package['puppet'],
  }

  augeas { 'puppet_set_runinterval':
    context => '/files/etc/puppet/puppet.conf/main',
    changes => 'set runinterval 900',
    notify  => Service['puppet'],
    require => Package['puppet'],
  }

  service { 'puppet':
    ensure  => running,
    enable  => true,
    require => Augeas['puppet_default'],
  }
}

