node 'ipxx-apgxl03', 'ipxx-apgxl04', 'ipxx-apgxl05', 'ipxx-apgxl06', 'ipxx-apgxl07', 'ipxx-apgxl08', 'ipxx-apgxl09', 'ipxx-apgxl10', 'ipxx-apgxl11', 'ipxx-apgxl12', 'ipxx-apgxl13', 'ipxx-apgxl14', 'ipxx-apgxl15', 'ipxx-apgxl16', 'ipxx-apgxl17', 'ipxx-apgxl31', 'ipxx-apgxl32', 'ipxx-apgxl33', 'ipxx-apgxl34', 'ipxx-apgxl35', 'ipxx-apgxl36', 'ipxx-apgxl37', 'ipxx-apgxl38', 'ipxx-apgxl39', 'ipxx-apgxl40', 'ipxx-apgxl41', 'ipxx-apgxl42', 'ipxx-apgxl43', 'ipxx-apgxl44', 'ipxx-apgxl45', 'ipxx-apgxl46', 'ipxx-apgxl47', 'ipxx-apgxl48', 'ipxx-apgxl49', 'ipxx-apgxl50','ipxx-apgxl70', 'ipxx-apgxl71', 'ipxx-apgxl72', 'ipxx-apgxl73', 'ipxx-apgxl74', 'ipxx-apgxl75', 'ipxx-apgxl76', 'ipxx-apgxl77', 'ipxx-apgxl78', 'ipxx-apgxl79', 'ipxx-apgxl80', 'ipxx-apgxl82', 'ipxx-apgxl83', 'ipxx-apgxl84', 'ipxx-apgxl85', 'ipxx-apgxl86', 'ipxx-apgxl87', 'ipxx-apgxl88', 'ipxx-apgxl89', 'ipxx-apgxl90', 'ipxx-apgxl91', 'ipxx-apgxl92', 'ipxx-apgxl93', 'ipxx-apgxl94', 'ipxx-apgxl95', 'ipxx-apgxl96', 'ipxx-apgxl97', 'ipxx-apgxl98', 'ipxx-apgxl99', 'ipxx-apgxl81', 'ipxx-apgxl100' , 'ipxx-apgxl101', 'ipxx-apgxl102', 'ipxx-apgxl103' , 'ipxx-apgxl104' , 'ipxx-apgxl105' , 'ipxx-apgxl106' , 'ipxx-apgxl107' , 'ipxx-apgxl108' , 'ipxx-apgxl109' , 'ipxx-apgxl110' , 'ipxx-apgxl111' , 'ipxx-apgxl112' , 'ipxx-apgxl113' , 'ipxx-apgxl114' , 'ipxx-apgxl115' , 'ipxx-apgxl116' , 'ipxx-apgxl117' , 'ipxx-apgxl118' , 'ipxx-apgxl119' , 'ipxx-apgxl120' , 'ipxx-apgxl121' , 'ipxx-apgxl122' , 'ipxx-apgxl123' , 'ipxx-apgxl124' , 'ipxx-apgxl125' , 'ipxx-apgxl126' , 'ipxx-apgxl127' , 'ipxx-apgxl128' , 'ipxx-apgxl129' {
  include gxl
  include snow_xclient
  include packages
  include sshkeys
  include ssh_confd
  include usergroup
  class { '::r': version => '3.2.3-1~wheezycran.0' }

  r::package { 'codetools': }
  r::package { 'corpcor': }
  r::package { 'iterators': }
  r::package { 'foreach': }
  r::package { 'doMC': }
  r::package { 'yaml': }
  class { '::ntp':
  servers => [ 'ipxx-apgxl02.gfk.com' ],
 } 
}

node 'ipxx-apgxl01', 'ipxx-apgxl011'{
  include sshkeys
  include packages
  include ssh_confd
  include '::usergroup'
}

node 'ipxx-apgxl02.gfk.com' {
  include snow_xclient    
  include sshkeys
  include packages
  include ssh_confd
  include 'puppet::master'
  include '::usergroup'
}

node 'ipxx-apgxl51.gfk.com' {
  include packages
  include sshkeys
  include gxl::icinga
  include ssh_confd
  include snow_xclient
  include '::usergroup'
}

node 'ipxx-apgxl61.gfk.com' {
  include packages
  include sshkeys
  include snow_xclient
  include '::usergroup'
}

node 'visualizer.gfk.com' {
    include cmv
    include ssh_confd
}

node 'ipxx-wwgxl02.gfk.com' {
    include cc
    include sshkeys
    include ssh_confd
}

node 'ipxx-wwgxl05.gfk.com' {
     include packages
     include sshkeys
     include ssh_confd
}

node 'ipxx-wwgxl04.gfk.com' {
#	class { 'graphite': 
#   gr_web_server => 'nginx',    
#   gr_storage_schemas        => [
#    {
#      name       => 'default',
 #     pattern = '.*',  
 #     retentions => '1s:30m,1m:1d,5m:2y'
 #   } ]
 #  }
	include sshkeys
        include ssh_confd
	include snow_xclient
        include ssh_confd
}

