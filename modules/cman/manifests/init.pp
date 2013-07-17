class cman {

	include cman::packages
	include cman::config
	include cman::services

	file {
                "/etc/corosync/authkey":
                        ensure  => present,
                        mode    => 0400,
                        owner   => "root",
                        group   => "root",
                        source  => "puppet:///modules/cman/authkey",
                        require => Package["cman"];
        }


}
