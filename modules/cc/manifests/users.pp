class cc::users {

#USERACCOUNT / GROUP
group { 'ccadmin':
  ensure => 'present',
  gid    => '1001',
}

user { 'ccadmin':
  ensure           => 'present',
  comment          => 'iccadmin user',
  gid              => 'ccadmin',
  home             => '/home/ccadmin',
  shell            => '/bin/bash',
  uid              => '1001',
  managehome       => true,
  require          => Group["ccadmin"],
}
ssh_authorized_key {
'ccadmin': 
	ensure => present,
	key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAxu3BFHeEBMbfZCMTqBwdUvFdTNR2B/7wqcEv1DZYg0Hq8OnDZ/qvLLgjE3lDyDHeWUKFzNMj6ly70YlR7tt4ftpT2kB1YjDrjECzDSZCmTdBE1LvRF8nsrJLzDPphLBdJWa9XWUA519gVc4nKLzTOCxwNY4fzf75sa/PYB6ax+0Og2Y0YB1aIRCXiqQ31rBhapN681loxljICo2S8LdmDmcgRa1asTwlid1S6NMkhLhc4OkRZp3lEDgyrRrWnozJwsqXgiu4sba1zQm1gho/NjmH/KrS0EVy7QdFIVLFNp38Di+Q+IJMXnDTpARHS9FlbNZxUy9f1H7VW9I/gIUCZw==',
	type => 'ssh-rsa',
	user => 'ccadmin';
'bamboo':
         ensure => present,
         key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAxu3BFHeEBMbfZCMTqBwdUvFdTNR2B/7wqcEv1DZYg0Hq8OnDZ/qvLLgjE3lDyDHeWUKFzNMj6ly70YlR7tt4ftpT2kB1YjDrjECzDSZCmTdBE1LvRF8nsrJLzDPphLBdJWa9XWUA519gVc4nKLzTOCxwNY4fzf75sa/PYB6ax+0Og2Y0YB1aIRCXiqQ31rBhapN681loxljICo2S8LdmDmcgRa1asTwlid1S6NMkhLhc4OkRZp3lEDgyrRrWnozJwsqXgiu4sba1zQm1gho/NjmH/KrS0EVy7QdFIVLFNp38Di+Q+IJMXnDTpARHS9FlbNZxUy9f1H7VW9I/gIUCZw==',
         type => 'ssh-rsa',
         user => 'root';

}

#SUDO CONFIGURATION
class { 'sudo':
  purge               => false,
  config_file_replace => false,
}

sudo::conf { 'ccadmin':
  priority => 10,
  content  => 'ccadmin ALL=(ALL) NOPASSWD: ALL',
}


}

