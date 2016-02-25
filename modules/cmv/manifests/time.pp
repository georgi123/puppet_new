class cmv::time {
file { '/etc/timezone':
ensure => present,
content => "Etc/UTC\n",
}
 
exec { 'reconfigure-tzdata':
user => root,
group => root,
command => '/usr/sbin/dpkg-reconfigure --frontend noninteractive tzdata',
}
 
notify { 'timezone-changed':
message => 'Timezone was updated to Etc/UTC',
}
 
File['/etc/timezone'] -> Exec['reconfigure-tzdata'] -> Notify['timezone-changed']


}
