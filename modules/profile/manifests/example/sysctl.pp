class profile::example::sysctl {

  Sysctl {
    ensure    => present,
    permanent => 'yes',
  }

  # Have IPv6 Privacy Addresses, but don't use them by default
  sysctl { 'net.ipv6.conf.all.use_tempaddr':
    value => '1',
  }
  sysctl { 'net.ipv6.conf.default.use_tempaddr':
    value => '1',
  }

  # Also, make sure we listen to route advertisements
  sysctl { 'net.ipv6.conf.default.accept_ra':
    value => '1',
  }
  sysctl { 'net.ipv6.conf.all.accept_ra':
    value => '1',
  }

  # On Ubuntu/Debian hosts there is default ipv6 configuration that we don't
  # want. Make sure that default configuration is removed.
  file { '/etc/sysctl.d/10-ipv6-privacy.conf':
    ensure => absent,
  }

}
