class snow_xclient::params {

$package_name  = 'xClient-1.7.00-1'
$config_name   = 'snowclient.conf'
#OL5.8 osfamyly=RedHat for some reason
  case $::osfamily {
    'Debian': {
	case $::architecture {
	    'i386': {
	         $file_name  = 'xClient-1.7.00-1.i386.deb'
	         }
	    'amd64': {
	         $file_name  = 'xClient-1.7.00-1.amd64.deb'
	         }
	}
	$package_provider = 'dpkg'
        $os_package       = 'xclient'
    }
    'OracleLinux', 'Suse', 'RedHat': {
	case $::architecture {
	    'i386': {
		 $file_name  = 'xClient-1.7.00-1.i386.rpm'
	         }
	    'x86_64': {
	         $file_name  = 'xClient-1.7.00-1.x86_64.rpm'
	         }
	}
	$package_provider = 'rpm'
    }
    default: {
	if $::operatingsystem == 'SLES' {
	    case $::architecture {
		'i386': {
		     $file_name  = 'xClient-1.7.00-1.i386.rpm'
	        }
	        'x86_64': {
		     $file_name  = 'xClient-1.7.00-1.x86_64.rpm'
		}
    	    }
	    $package_provider = 'rpm'
	    notice("Old facter <1.7.2")
	}
	else {
              fail("\"${module_name}\" \"${::osfamily}\" is not supported")
        }
    }
  }
}
