class ufw {
  
       file { '/root/ufw.sh':
  path => '/root/ufw.sh',
  ensure => file,
  owner  => 'root',
  group  => 'root',
  mode   => '0777',
  source => '/root/ufw.sh',
}

     exec { 'ufw.sh':
  command => '/root/ufw.sh',
  user    => 'root',
  group   => 'root',
 }
}

