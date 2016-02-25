class gxl::hadoop {

file { '/usr/lib/nagios/plugins/genhdfsreport.sh':
  ensure  => 'file',
  mode    => '644',
  owner  => root,
  group  => root,
  source => "puppet:///modules/cmv/genhdfsreport.sh",
}

file { '/usr/lib/nagios/plugins/check_hadoop-datanodes.sh':
  ensure  => 'file',
  mode    => '644',
  owner  => root,
  group  => root,
  source => "puppet:///modules/cmv/check_hadoop-datanodes.sh",
}
file { '/usr/lib/nagios/plugins/check_hadoop-deadnodes.sh':
  ensure  => 'file',
  mode    => '644',
  owner  => root,
  group  => root,
  source => "puppet:///modules/cmv/check_hadoop-deadnodes.sh",
}
file { '/usr/lib/nagios/plugins/check_hadoop-dfs.sh':
  ensure  => 'file',
  mode    => '644',
  owner  => root,
  group  => root,
  source => "puppet:///modules/cmv/check_hadoop-dfs.sh",
}

sudo::conf { 'nagios':
  priority => 30,
  content  => 'nagios  ALL=(ALL) NOPASSWD: /usr/lib/nagios/plugins/genhdfsreport.sh',
}
}
