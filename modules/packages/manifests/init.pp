class packages {
#include packages::r
include packages::mc
include packages::htop
include packages::chkconfig
$pack = [ "openssh-client", "openssh-server",  "whois", "man-db", "manpages", "curl", "wget", "less", "locate", "telnet", "iputils-ping",  "lsof", "unzip" ,"rsync", "ca-certificates", "libmysql-java", "mysql-client",  "vim", "ufw", ] 

package { $pack : ensure => "installed" }

}
