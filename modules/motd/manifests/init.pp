class motd {
  file { 'motd':
         path => '/etc/motd',
         ensure => file,
         content => "GXL big data cluster."
     }
}
