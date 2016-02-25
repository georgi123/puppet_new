class gxl::icinga {

file { '/usr/lib/nagios/plugins/genhdfsreport.sh':
  ensure  => 'file',
  mode    => '644',
  owner  => root,
  group  => root,
  source => "puppet:///modules/gxl/genhdfsreport.sh",
}

file { '/usr/lib/nagios/plugins/check_hadoop-datanodes.sh':
  ensure  => 'file',
  mode    => '644',
  owner  => root,
  group  => root,
  source => "puppet:///modules/gxl/check_hadoop-datanodes.sh",
}
file { '/usr/lib/nagios/plugins/check_hadoop-deadnodes.sh':
  ensure  => 'file',
  mode    => '644',
  owner  => root,
  group  => root,
  source => "puppet:///modules/gxl/check_hadoop-deadnodes.sh",
}
file { '/usr/lib/nagios/plugins/check_hadoop-dfs.sh':
  ensure  => 'file',
  mode    => '644',
  owner  => root,
  group  => root,
  source => "puppet:///modules/gxl/check_hadoop-dfs.sh",
}

sudo::conf { 'nagios':
  priority => 30,
  content  => 'nagios  ALL=(ALL) NOPASSWD: /usr/lib/nagios/plugins/genhdfsreport.sh',
}

 class { 'nrpe':
    allowed_hosts => ['127.0.0.1', $::ipaddress , 'ipxx-apgxl02.gfk.com', 'ipxx-apgxl02' ],
  }
}
