class snow_xclient::package {
  $package_provider = $snow_xclient::params::package_provider
  $package_name = $snow_xclient::params::package_name
  $file_name = $snow_xclient::params::file_name
  $config_name = $snow_xclient::params::config_name
    
  file { "/tmp/$package_name":
    ensure => present,
    source => "puppet:///modules/snow_xclient/$file_name",
  }

  package { $::snow_xclient::params::os_package:
    ensure   => present,
    provider => $package_provider,
    source   => "/tmp/$package_name",
  }

  file { "/etc/$config_name":
    ensure => 'present',
    mode   => '0600',
    source => "puppet:///modules/snow_xclient/$config_name",
  }
}
