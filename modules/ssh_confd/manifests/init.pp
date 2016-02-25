class ssh_confd  { 
augeas { "sshd_config":
  context => "/files/etc/ssh/sshd_config",
  changes => [  " set PasswordAuthentication yes " ],
  notify => Service["sshd"],
}

service { "sshd":
  name => $operatingsystem ? {
    Debian  => "ssh",
    default => "sshd",
  },
  require => Augeas["sshd_config"],
  enable  => true,
  ensure  => running,
}

}
