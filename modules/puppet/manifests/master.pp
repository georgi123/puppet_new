# == Class: puppet::master
#
# Central configuration for puppet master
#
class puppet::master {
  file { '/usr/local/bin/puppet_reports_cleanup.sh':
    ensure => file,
    source => 'puppet:///modules/puppet/usr/local/bin/puppet_reports_cleanup.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }

  cron { 'puppet_reports_cleanup':
    command => '/usr/local/bin/puppet_reports_cleanup.sh',
    user    => 'root',
    hour    => 1,
    minute  => 57,
  }
}

