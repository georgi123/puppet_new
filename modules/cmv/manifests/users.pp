class cmv::users {


group { 'cmv':
  ensure => 'present',
  gid    => '1001',
}

user { 'cmv':
  ensure           => 'present',
  comment          => 'cmv user',
  gid              => 'cmv',
  home             => '/var/www/cmv',
  password         => 'ZRJPt4nTfy59vQFo',
  shell            => '/bin/bash',
  uid              => '1001',
  managehome       => true,
  require          => Group["cmv"],
}


ssh_authorized_key {
    'root':
        ensure  => present,
        key     => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQCxIcHn4BXoqXa1TdlnE8aWn87n8u/iLx+c5ZDu7m5Mzpl2ygdl3S0a8xoogt4UGGNJa9bsPY7OQMUNQgxkNu1JDlHbXokZo4lwEK05LduaYO8X8B3IWnQq2x2Tvxkv8Jh+MYDGg1DbCmcK5l5/tNOryaX6vZHH+XrS7NyaHOibtugJg1foprf1THasBsPiYieyg24qzZbdSJlCzuDZmA9dzYFoZVzygFF1fjBDIDOAtDgg4+JFQ6yPx/dGiUQEubwF5lbI0349JAcfIYNO1Ywcr1yHI/UR6ZxGTlGqzHQ5lZ1PSj7Lrz0EkDc5Aynn9OUpodXqo580rro1lx7/U1IUcgWih9w7rMSxk3LyoxU82GnTB3sbc/L2dvVuvxDHpZruWav1+XzXm9tUaXgVNV4MJgyaHJUMYj0Dx/ZGcEDvmSyCcghfoewCUIp+FN6umW6U283OtGgYNVfrK/wbgUXs98JbDZFJBwkhMoyqEQywMAXR+u+z0NimZ2kiTk3inRs01rEIDPosSCiwaXjlO32o3XbPjvrA3b0mnsGw26auiNUl6jZtb8wvl1Lhyu8Fsilhso2aTcTcNXLYx38ALrNMtwg8CgJ5WCv+qYOblEJN9Br2ZVC5VaHELo9Vh8dc9BjLk8PlNTLHznsBQ3+/msr/rSRNtuCYLHchRR9q29YSkw==',
        type    => 'ssh-rsa',
        user    => 'root';
'ktklin-sys':
        ensure  => present,
        key     => 'AAAAB3NzaC1kc3MAAAEBAIcZ1Y5KI2CHCRzLympfA2oxNwKtFuCZRI77d97O8mvJ+5E6xALLGQU8AoPwi7FrqyxYwjZoQsKCQFbgvkljKL/v5vBF+gckPxuBMWylFNJLg6rdMDjccaol5oDVdWITVSzV75LcwG3GeNtv+HPCCy3vNRtYeFGnoyqq+gETU+13wNMG8oHt0R3YxrCzCikqRP6rJTedkC6ZdJSZ44tHvGJm6rAHb7s8Zv62RA4HfN0/6j+rX/3U2I+sW4vdv0+EXqMVupO57hdx64Mb/0Z22QpoRZXiUDZcmQMetgQHlzH0jvlP9rgxeUF2kXC8H2pTPmN/OKoz18LIlLiujzTe7OUAAAAVAPzy5ywggtDA87sNX6gB/8BmTMBTAAABAF3KPet0Xi3magUL15i3x4DBJzmpT3FY45dfqtz988RwcOG34M+byb+quLdXfI/zX4LnEBme1GiXKAYRkn8CG3Z4APyPtwaJzjEh+edUZHE63ZKvR85ajA36dWSxhkBJ2T77f7vja+/lcK2kdrJIxUisoB05L42ZRLEnFnyOpxs/wRPZ76ezeMFtBNXfbt3e3DqjUct+4kZVFI/AXPJfK4R70yCgUUx5lJzkZrTHZ4xRpeDDWWVc2a75OxDezTp+0UE8ERxLJBSNzrOk4dModshAIO3jkhVzdcU4TE1s5arTSjhZkIPIB4Uk4hgKepusr4b2SjhUyetAfluB1YExbaUAAAEABzbxXMUGQ+hxlPVGIjt6rQ/foenfno6F+4iOzXzyLj2U/gIhEs/jgN0T58o/97RZ+0UdN4QCrsME5TjknyyomQ7AYI90eSrMQ9oUwf37Dz2efPU/15HokTksorXEatJfxUCDCox1BiIvHKGMD3iLmM4zYMGWSM4PKtn9VkzoagOLrZ31vcDWHcJs7LkmDG6bkhzKULleN7dkLsCpJlX1Tto0XMnt+YK3K5VaMHUFwai439GMIV9E0J+10nt2AUeJGJIizJh2psD3SvBVmDeKesbi5IwG5o2KZv9d1ejSzUv1hHqglwY8sCTWVatuIg7m2yd9qkO2mL1RWRywjcceiQ==',
        type    => 'ssh-dss',
        user    => 'cmv';
  'inivan-sys':
        ensure  => present,
        key     => 'AAAAB3NzaC1yc2EAAAABJQAAAQEAgkgKjD6deope5HLPGypdi7I3FuFIclpnhmkmYUsav0VShf0RqULCFtoF0owWSyXyWJlxA7QDjw6T1cYkwKKRlgkuTUI4KvPJVooWxbTZU+i+pvZv85cWV+XFokGqGQxW9ciH8PLM2+9td+0+YcFiwl5oezM1AAxyWl+oGGUGC/Nlw9j7hbXTy97QT75RepWRhE0r+GO7kB1vAS8hwkLPeWWlZEvRvh2sVFL/5DYyAT3ImzoWR+utrMucuy8QtVbLkojvLPsSx8LsuSFp3ssgf9juD6nMulJ1XBql8ccQQqVUs7XDTNON0hJoZ6sA/RBGHNeCe+8qWJHTPEDnNIVxDw==',
        type    => 'ssh-rsa',
        user    => 'cmv';
  'dgorczyca-dev':
	ensure  => present,
	key	=> 'AAAAB3NzaC1yc2EAAAABJQAAAgEAnsdCC41b6dRFcLKhXO18/0aaSoq8lQnIGbe/xDJWGakAC16PxcbvQlV6yxzF9Ml7EMUqy8RJmN4oN9+Z3eJvtEwP0SNngeV3EP0jCIF1kslkLX+Wy0QHUy0ZjCk1ys1UqK+wxWXw8KnOrbAULbBnOSmhN2eMI4AJ7sd2CejjPbCos7V6CaiDira5FxJINA945dPPmgNFIOC8px9Gv0rChLjCTzvp5Dfbxh+yHXKlezKlGaqcwaPS+Z2awD0VraPsFSZzU0O4c51ljmDSemIgLfUqaX2qtvYGxs2ANs5/fLHofPPtIAeLMwT95VSFF/KQYEicBuRMQGG15iu2h9xHu8i80qjoBW1x6uwe+NPfYe0WfP1KwnZSkFxLvup03oHwGPm2XeYklSzLD2yO5H+fGS+rlQ7liq5fjW2kBX4fuCctjUKHFqDt8ZtGhbi6nCadjZhyTNwhAY4mAn2sGybbWGdZqpZLEGxMi05ShT/HQH6opBLu1bd7dDUJmoMPZXjXbPeP+w61H5ndK10O0Y4Twa4SpCAtuWNhBIu0s7GRbsSBnjXwxgBFzIox1D86wt+1T8Um+m/AoEBkaDrg1pkG6rVirANnufbS03IWlNhifWhhNHiv3mj9vlfY8QAmEBkkxXp6fkhO5i1ySfTCpCv5lgGbDagHn24OJkF0PPe1yMc=',
	type	=> 'ssh-rsa',
	user	=> 'cmv';
  'pkolev-sys':
        ensure  => present,
        key     => 'AAAAB3NzaC1yc2EAAAABJQAAAQEAgb0aExDaPAgWuHH3RcByH75p7pr8MtCbHYHlrhHxcSvk5ej7iDfc+XahpV6ZvtLJzr2mSECfluCrK3m4GLcdrJd7Mo8+gymxtBvKwJP4ZXgumk9aGZiPMQtpZyE+A5TihRvnLvQ0L8QRYRW89neM3MvnWq9PhPUeHrmZCM9bYO5u9xVy/FWpp67WN2FmJkkG3NL8bsNSfawb2ScgQhCZrBh8cENmeLDlcQt6puNEQQJA3vZ4VT2n1ZGeVnhkOQu6WpOBC2QoxFJSfjx0VpYMrlu1RFlyIEmNCMkYFBSFO6tr+AQ5Zvip/IGfvdwfpG84dREXFw9uzyI3Z2+eEVNpXQ==',
        type    => 'ssh-rsa',
        user    => 'root';
  'joro-sys':
        ensure  => present,
        key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDStVcnn7SnFoa+nbL//QQWxfOys9BPLokXOfgwUikVO20D9hK1suR5kZUGdqfn6tHbGg4v9d0nip4Yqy8AFRrLEV1cQ7UXG1lEJvpeoEZWMJEUH38HkEqR9fNvXI5xlKAVL8gHvAlDfhTGMW7bsMfw/1ngq/s9YIC7C2+Vp6QFU/ibRU9/6zxxK1I5CKUX7D7RLeAfK15GoPSPyAA0oi7GQK2Cr8U+NLyDu9tBuUzgIfa4WWowg38Yz5NzIkIXHAQ9yEEcj2oGfJyfR0RVJRe8wRUuv4uC1Vc5ZhcHA2EvrX3FC8SCzCPe3LTMMj/IrVE9Wq20siACwFFQvpJCwo7z',
        type    => 'ssh-rsa',
        user    => 'root';

  }

#sudo configuration
class { 'sudo':
  purge               => false,
  config_file_replace => false,
}

sudo::conf { 'cmv':
  priority => 10,
  content  => 'cmv ALL=(ALL) NOPASSWD: /usr/sbin/service',
}



}

