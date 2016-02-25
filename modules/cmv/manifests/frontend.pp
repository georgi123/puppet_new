class cmv::frontend {

#SYSTEM CONFIG
Exec { environment => [ "HOME=/var/www/cmv" ] }
class { 'limits':
  config => {
    '*' => {
      'nofile' => {
        soft => '2048',
        hard => '16384',
      },
    },
  },
  use_hiera => false,
}

#ADDITIONAL REPOSITORIES
include apt::backports
apt::source {'dotdeb':
	location => 'http://packages.dotdeb.org',
	release  => 'wheezy',
	repos    => 'all',
}

#PACKAGES
$pkgs = [ 
"nginx-common", 
"nginx-extras", 
"git", 
"ruby",
"php5",
"php5-cli",
"php5-common",
"php5-fpm",
"php5-intl",
"php5-mcrypt",
"php5-mysqlnd",
"openssl",
"redis-server",
"mysql-server",
"nodejs-legacy",
"php-guzzle",
"php5-redis",
"socat"]
package { $pkgs : ensure => "installed" }

exec { 'get-grunt':
    command => '/usr/bin/npm install -g grunt  grunt-cli'
} 
exec { 'get-bower':
    command => '/usr/bin/npm install -g bower'
}
class { 'nrpe':
    allowed_hosts => ['127.0.0.1', $::ipaddress , 'ipxx-apgxl02.gfk.com', 'ipxx-apgxl02' ],
 }

file { "/etc/nginx/sites-enabled/api.visualizer.gfk.com.conf":
  ensure  => 'file',
  mode    => '755',
  owner  => root,
  group  => root,
  source => [
    "puppet:///modules/cmv/api.visualizer.gfk.com.conf",
 ]
}
file { "/etc/nginx/sites-enabled/visualizer.gfk.com.conf":
  ensure  => 'file',
  mode    => '755',
  owner  => root,
  group  => root,
  source => [
    "puppet:///modules/cmv/visualizer.gfk.com.conf",
 ]
}
file { "/usr/local/bin/gitproxy":
  ensure  => 'file',
  mode    => '755',
  owner  => root,
  group  => root,
  source => [
    "puppet:///modules/cmv/gitproxy",
 ]
}
exec { 'gitproxy':
    command => '/usr/bin/git  config --global core.gitproxy gitproxy'
 }
file { "/etc/nginx/ssl":
  source  => "puppet:///modules/cmv/ssl",
  recurse => true,
 }
}
