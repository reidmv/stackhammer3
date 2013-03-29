class profile::security::network {

  Sysctl {
    ensure    => present,
    permanent => 'yes',
  }

  sysctl { 'net.ipv4.tcp_timestamps':
    value => 0,
  }

  sysctl { 'net.ipv4.tcp_syncookies':
    value => 1,
  }

  sysctl { 'net.ipv4.conf.all.rp_filter':
    value => 1,
  }

  sysctl { 'net.ipv4.ip_local_port_range':
    value => '32768 61000',
  }
}
