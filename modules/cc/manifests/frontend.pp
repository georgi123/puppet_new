class cc::frontend {

#ADDITIONAL REPOSITORIES
include apt::backports

#PACKAGES
$pkgs = [ "apache2", "git", 
"mariadb-server",
"nodejs",
"mariadb-client"]
package { $pkgs : ensure => "installed" }

}
