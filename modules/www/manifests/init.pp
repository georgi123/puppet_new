class www {    
	    file { '/etc/sudoers':
                # path    => '/etc/sudoers',
                ensure  => file,
                source  => "puppet:///modules/www/sudoers",
                mode => 0440,
                owner => root,
                group => root,
          }
                
    }            
