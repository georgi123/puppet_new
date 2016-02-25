class sudo::sudoers {
  sudo::conf { 'gxladmin':
    priority => 10,
    content  => "gxladmin ALL=(ALL) NOPASSWD: ALL",
  }
}

