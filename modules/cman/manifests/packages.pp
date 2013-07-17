class cman::packages {

        package {
                "cman.$hardwaremodel":
                        alias  => "cman",
                        ensure => "installed";

		"ccs":	
			ensure => "installed";
		"pacemaker":
			ensure => "installed";
        }
}
