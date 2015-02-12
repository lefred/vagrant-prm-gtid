class percona::prm {

	file {
		"/usr/lib/ocf/resource.d/percona":
			ensure  => directory,
        		mode    => 0644,
        		owner   => "root",
        		group   => "root",
			require => Package["pacemaker"],
	}


    	file {
        	"/usr/lib/ocf/resource.d/percona/mysql_prm56":
        		ensure  => present,
			source  => "puppet:///modules/percona/prm/mysql_prm56",
        		mode    => 0755,
        		owner   => "root",
        		group   => "root",
        		require => File["/usr/lib/ocf/resource.d/percona"],
    	}

	if $hostname == "node1" {
    		file {
        		"/root/crm_config":
        			ensure  => present,
				source  => "puppet:///modules/percona/prm/crm_config",
        			mode    => 0644,
        			owner   => "root",
        			group   => "root",
				notify  => Exec['loadcrmconfig'],
    		}

        	exec { "loadcrmconfig":
			refreshonly	=> true,
			command         => "/bin/sleep 25; /usr/sbin/crm configure load replace /root/crm_config >>/tmp/fred 2>&1",
			require 	=> [ File["/usr/lib/ocf/resource.d/percona/mysql_prm56"], Service['cman'] ],
			subscribe	=> File['/root/crm_config'],
		}
	}

}
