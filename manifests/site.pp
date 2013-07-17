node percona1 {
	include percona::repository
        include percona::replication
        include percona::prm
        include cman
	include cman::maintenance
	include myhosts

	Class['percona::repository'] -> Class['percona::server'] -> Class['percona::server::config'] -> Class['percona::replication'] -> Class['cman'] -> Class['percona::prm']

	class {
		'percona::server': 
			mysql_version 	=> "5.6",
			perconaserverid => "1",  
			enable		=> "false",
			ensure		=> "stopped"
	}
}

node percona2 {
	include percona::repository
        include percona::replication
        include percona::prm
        include cman
	include cman::maintenance
	include myhosts

	Class['percona::repository'] -> Class['percona::server'] -> Class['percona::server::config'] -> Class['percona::replication'] -> Class['cman'] -> Class['percona::prm'] 

	class {
		'percona::server': 
			mysql_version 	=> "5.6",
			perconaserverid => "2",  
			enable		=> "false",
			ensure		=> "stopped"
	}

}

node percona3 {
	include percona::repository
        include percona::replication
        include percona::prm
        include cman
	include cman::maintenance
	include myhosts

	Class['percona::repository'] -> Class['percona::server'] -> Class['percona::server::config'] -> Class['percona::replication'] -> Class['cman'] -> Class['percona::prm']

	class {
		'percona::server': 
			mysql_version 	=> "5.6",
			perconaserverid => "3",  
			enable		=> "false",
			ensure		=> "stopped"
	}

}
