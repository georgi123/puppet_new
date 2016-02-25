class gxl::ntp {
class { '::ntp':
      servers => ['pool.ntp.org','utcnist.colorado.edu'],
      restrict => ['10.20.1.0 mask 255.255.255.0 nomodify notrap'],
    }
}
