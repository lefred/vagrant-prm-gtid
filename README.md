vagrant-prm-gtid
================

Vagrant environment to test Percona Replication Manager with GTID on CentOS/RHEL 6.4 with CMAN and Pacemaker.

Requirements
------------

* Vagrant 1.2.x
* Virtual Box
* a CentOS 6.4 vagrant box

How to use ?
------------

Vagrant
.......

So first you need to install vagrant (http://downloads.vagrantup.com/) 

Example in Fedora::

	# wget http://files.vagrantup.com/packages/0219bb87725aac28a97c0e924c310cc97831fd9d/vagrant_1.2.4_x86_64.rpm
	# yum localinstall vagrant_1.2.4_x86_64.rpm

Install the CentOS 6.4 box, but fisrt you need to download it from https://mega.co.nz/#!vBlzhbib!aajn-EByg6itMjbitYDBz2mbUVRBVKjZv-XBQZ7UfzE

::

        # vagrant box add centos64 centos64.box

This environment
................

It's as simple as git ;-)

::

	$ git clone https://github.com/lefred/vagrant-prm-gtid


Then you can start it

::

	$ vagrant up

You will see a bunch of puppet output and finally

::

	$ vagrant status
	Current machine states:

	percona1                 running (virtualbox)
	percona2                 running (virtualbox)
	percona3                 running (virtualbox)

	This environment represents multiple VMs. The VMs are all listed
	above with their current state. For more information about a specific
	VM, run `vagrant status NAME`.

You can now connect to any of them using

::
	
	$ vagrant ssh percona1
	[vagrant@percona1 ~]$ sudo su -
	[root@percona1 ~]# crm_mon -1A
	Last updated: Thu Jul 18 07:46:38 2013
	Last change: Wed Jul 17 21:50:37 2013 via crm_attribute on percona1
	Stack: cman
	Current DC: percona1 - partition with quorum
	Version: 1.1.8-7.el6-394e906
	3 Nodes configured, unknown expected votes
	7 Resources configured.


	Online: [ percona1 percona2 percona3 ]

	 reader_vip_1	(ocf::heartbeat:IPaddr2):	Started percona1
	 reader_vip_2	(ocf::heartbeat:IPaddr2):	Started percona2
	 reader_vip_3	(ocf::heartbeat:IPaddr2):	Started percona3
	 writer_vip	(ocf::heartbeat:IPaddr2):	Started percona1
	 Master/Slave Set: ms_MySQL [p_mysql]
	     Masters: [ percona1 ]
	     Slaves: [ percona2 percona3 ]

	Node Attributes:
	* Node percona1:
	    + master-p_mysql                  	: 1060      
	    + p_mysql_mysql_master_IP         	: 192.168.80.2
	    + readable                        	: 1         
	* Node percona2:
	    + master-p_mysql                  	: 60        
	    + p_mysql_mysql_master_IP         	: 192.168.80.3
	    + readable                        	: 1         
	* Node percona3:
	    + master-p_mysql                  	: 60        
	    + p_mysql_mysql_master_IP         	: 192.168.80.4
	    + readable                        	: 1 

Easy ;-)


