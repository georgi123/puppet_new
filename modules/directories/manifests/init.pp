 class directories {  
       exec  { 'mkdir  /home/plamen.ivanov':
       command => 'mkdir  /home/plamen.ivanov', 
  }
       file { '/home/plamen.ivanov':
    path => '/home/plamen.ivanov',
    ensure => 'directory',
    owner  => 'plamen.ivanov',
    group  => 'plamen.ivanov',
    mode   => '0750',
    recurse => true,
  }
}
