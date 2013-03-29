class profile::security::kernel_hardening {

  Sysctl {
    ensure    => present,
    permanent => 'yes',
  }

  sysctl { 'kernel.printk':
    value => '4 4 1 7',
  }

  sysctl { 'kernel.panic':
    value => '10',
  }

  sysctl { 'kernel.sysrq':
    value => '0',
  }

  sysctl { 'kernel.msgmni':
    value => '2048',
  }

  sysctl { 'kernel.core_uses_pid':
    value => '1',
  }

  sysctl { 'kernel.msgmnb':
    value => '655536',
  }

  sysctl { 'kernel.msgmax':
    value => '655536',
  }

  sysctl { 'vm.swappiness':
    value => '30',
  }

  sysctl { 'vm.vfs_cache_pressure':
    value => '50',
  }

  sysctl { 'fs.file-max':
    value => '359208',
  }

  sysctl { 'net.core.rmem_default':
    value => '256960',
  }

  sysctl { 'net.core.rmem_max':
    value => '4194304',
  }

  sysctl { 'net.core.wmem_default':
    value => '256960',
  }

  sysctl { 'net.core.wmem_max':
    value => '4194304',
  }

  sysctl { 'net.core.optmem_max':
    value => '57344',
  }

  sysctl { 'net.core.netdev_max_backlog':
    value => '3000',
  }

  sysctl { 'net.core.somaxconn':
    value => '3000',
  }

  sysctl { 'net.ipv4.conf.all.bootp_relay':
    value => '0',
  }

  sysctl { 'net.ipv4.icmp_ratelimit':
    value => '20',
  }

  sysctl { 'net.ipv4.icmp_ratemask':
    value => '88089',
  }

  sysctl { 'net.ipv4.ipfrag_high_thresh':
    value => '512000',
  }

  sysctl { 'net.ipv4.ipfrag_low_thresh':
    value => '446464',
  }

  sysctl { 'net.ipv4.tcp_wmem':
    value => '4096 87380 4194304',
  }

  sysctl { 'net.ipv4.tcp_rmem':
    value => '4096 87380 4194304',
  }

  sysctl { 'net.ipv4.tcp_mem':
    value => '512000 1048576 4194304',
  }

  sysctl { 'net.ipv4.tcp_max_tw_buckets':
    value => '1440000',
  }

  #sysctl { 'net.ipv4.ip_conntrack_max':
  #  value => '1048576',
  #}

  sysctl { 'net.ipv4.ip_forward':
    value => '1',
  }

  sysctl { 'net.ipv4.conf.all.send_redirects':
    value => '0',
  }

  sysctl { 'net.ipv4.conf.default.send_redirects':
    value => '1',
  }

  sysctl { 'net.ipv4.conf.default.forwarding':
    value => '1',
  }

  sysctl { 'net.ipv4.conf.all.accept_source_route':
    value => '0',
  }

  sysctl { 'net.ipv4.conf.all.accept_redirects':
    value => '0',
  }

  sysctl { 'net.ipv4.conf.all.secure_redirects':
    value => '1',
  }

  sysctl { 'net.ipv4.conf.all.shared_media':
    value => '1',
  }

  sysctl { 'net.ipv4.conf.all.log_martians':
    value => '1',
  }

  sysctl { 'net.ipv4.conf.default.accept_source_route':
    value => '0',
  }

  sysctl { 'net.ipv4.conf.default.accept_redirects':
    value => '0',
  }

  sysctl { 'net.ipv4.conf.default.secure_redirects':
    value => '1',
  }

  sysctl { 'net.ipv4.conf.default.log_martians':
    value => '1',
  }

  sysctl { 'net.ipv4.icmp_echo_ignore_broadcasts':
    value => '1',
  }

  sysctl { 'net.ipv4.icmp_ignore_bogus_error_responses':
    value => '1',
  }

  sysctl { 'net.ipv4.tcp_window_scaling':
    value => '0',
  }

  sysctl { 'net.ipv4.tcp_rfc1337':
    value => '1',
  }

  sysctl { 'net.ipv4.tcp_synack_retries':
    value => '2',
  }

  sysctl { 'net.ipv4.tcp_syn_retries':
    value => '2',
  }

  sysctl { 'net.ipv4.tcp_max_syn_backlog':
    value => '2048',
  }

  sysctl { 'net.ipv4.conf.default.rp_filter':
    value => '1',
  }

  sysctl { 'net.ipv4.conf.default.proxy_arp':
    value => '0',
  }

  sysctl { 'net.ipv4.tcp_sack':
    value => '0',
  }

  sysctl { 'net.ipv4.tcp_ecn':
    value => '0',
  }

  sysctl { 'net.ipv4.tcp_fin_timeout':
    value => '20',
  }

  sysctl { 'net.ipv4.tcp_keepalive_intvl':
    value => '15',
  }

  sysctl { 'net.ipv4.tcp_keepalive_probes':
    value => '5',
  }

  sysctl { 'net.ipv4.tcp_no_metrics_save':
    value => '1',
  }

  sysctl { 'net.ipv6.conf.all.accept_redirects':
    value => '0',
  }

  sysctl { 'net.ipv6.conf.default.accept_redirects':
    value => '0',
  }
}
