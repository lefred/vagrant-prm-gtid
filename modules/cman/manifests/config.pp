class cman::config {

	file_line { 'cman_quorum':
  			path    => '/etc/sysconfig/cman',
   			line    => 'CMAN_QUORUM_TIMEOUT=0',
                	require => Package["cman"];
	}

	file {
                "/etc/cluster/cluster.conf":
                        ensure  => present,
                        mode    => 0400,
                        owner   => "root",
                        group   => "root",
                        source  => "puppet:///modules/cman/cluster.conf",
                        require => Package["cman"];
        }
}
