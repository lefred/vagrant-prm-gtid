class cman::maintenance {

 	yumrepo {
        	"network_ha-clustering":
            		descr       => "High Availability/Clustering server technologies",
	            	enabled     => 0,
			baseurl	    => "http://download.opensuse.org/repositories/network:/ha-clustering:/Stable/CentOS_CentOS-6/",
            		gpgcheck    => 0;
 	}

	# because pacemaker provided on opensuse's repo doesn't support
        # cman, I can't use package but need an exec like bellow:
	exec { 
		"install_crmsh":
    			command   => '/usr/bin/yum --enablerepo=network_ha-clustering -y install crmsh',
    			creates   => '/usr/sbin/crm',
			require	=> [ Yumrepo['network_ha-clustering'], Class['cman'] ]
  	}

	package {
		"pcs":
			ensure 	=> "installed",
			require	=> Class['cman'] 
	}	

} 
