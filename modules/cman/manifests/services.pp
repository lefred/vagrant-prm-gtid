class cman::services {
        service {
                "corosync":
                        enable     => false,
                        hasrestart => true,
                        hasstatus  => true,
                        require => [ Package["cman"], Class['cman::config'] ]
        }

        service {
                "cman":
                        enable     => true,
                        ensure     => "running",
                        hasrestart => true,
                        hasstatus  => true,
                        require => [ Service['corosync'], Package['pacemaker'], Class['myhosts'], File['/etc/corosync/authkey'] ]
        }

        service {
                "pacemaker":
                        enable     => true,
                        ensure     => "running",
                        hasrestart => true,
                        hasstatus  => true,
                        require => [ Package['pacemaker'], Service['cman'] ]
        }

}

