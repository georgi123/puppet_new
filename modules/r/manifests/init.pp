# Class installing R server
class r (
  $version = 'installed'
) {
  apt::source { 'cran':
    location    => 'http://cran.uni-muenster.de/bin/linux/debian',
    release     => 'wheezy-cran3/',
    repos       => '',
    include_src => false,
    key         => '381BA480',
    key_server  => 'keys.gnupg.net',
  }

  package { 'r-base':
    ensure  => $version,
    require => Apt::Source['cran'],
  }
}

