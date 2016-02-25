class cc {
include cc::users
include cc::frontend
$pkgs = [ "openssh-client", "openssh-server",  "whois", "man-db", "manpages", "curl", "wget", "less", "locate", "telnet", "iputils-ping",  "lsof", "unzip" ,"rsync", "ca-certificates", "libmysql-java", "mysql-client",  "vim" ]
package { $pkgs : ensure => "installed" }

}
