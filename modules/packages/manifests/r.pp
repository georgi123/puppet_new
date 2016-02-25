class packages::r {
  $version = '3.2.2'

  if (versioncmp($::macosx_productversion_major, '10.9') >= 0) {
    $macv = 'mavericks'
  } else {
    $macv = 'snowleopard'
  }

  package { 'R':
    provider => 'dpkg',
    source => "http://cran.r-project.org/bin/macosx/R-${version}-${macv}.pkg",
    ensure => present,
  }

}
