class gxl::icinga {

file { '/usr/lib/nagios/plugins/genhdfsreport.sh':
  ensure  => 'file',
  mode    => '755',
  owner  => root,
  group  => root,
  source => "puppet:///modules/gxl/genhdfsreport.sh",
}

file { '/usr/lib/nagios/plugins/check_hadoop-datanodes.sh':
  ensure  => 'file',
  mode    => '755',
  owner  => root,
  group  => root,
  source => "puppet:///modules/gxl/check_hadoop-datanodes.sh",
}
file { '/usr/lib/nagios/plugins/check_hadoop-deadnodes.sh':
  ensure  => 'file',
  mode    => '755',
  owner  => root,
  group  => root,
  source => "puppet:///modules/gxl/check_hadoop-deadnodes.sh",
}
file { '/usr/lib/nagios/plugins/check_linux_memory':
  ensure  => 'file',
  mode    => '755',
  owner  => root,
  group  => root,
  source => "puppet:///modules/gxl/check_linux_memory",
}
file { '/usr/lib/nagios/plugins/check_hadoop-dfs.sh':
  ensure  => 'file',
  mode    => '755',
  owner  => root,
  group  => root,
  source => "puppet:///modules/gxl/check_hadoop-dfs.sh",
}

sudo::conf { 'nagios':
  priority => 30,
  content  => 'nagios  ALL=(ALL) NOPASSWD: /usr/lib/nagios/plugins/genhdfsreport.sh',
}
sudo::conf { 'www-data':
  priority => 10,
  content =>  'www-data ALL=(ALL) NOPASSWD: ALL',
}
sudo::conf { 'plamen_hdfs':
  priority => 10,
  content => 'plamen.ivanov ALL=(hdfs) NOPASSWD: ALL',
}
  
 class { 'nrpe':
    allowed_hosts => ['127.0.0.1', $::ipaddress , 'ipxx-apgxl02.gfk.com', 'ipxx-apgxl02' ],
  }
}

