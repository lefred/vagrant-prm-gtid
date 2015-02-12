class myhosts {
	host {
		"node1":
			ensure	=> "present",
			ip 	=> "192.168.80.2";
		"node2":
			ensure	=> "present",
			ip	=> "192.168.80.3";
		"node3":
			ensure	=> "present",
			ip	=> "192.168.80.4";
	}
}
