class profile::sysctl::ipv6 {

  case $::kernel {
    'Linux': {

      # Have IPv6 Privacy Addresses, but don't use them by default
      sysctl::value { 'net.ipv6.conf.all.use_tempaddr':
        value => '1',
      }
      sysctl::value { 'net.ipv6.conf.default.use_tempaddr':
        value => '1',
      }
      file { '/etc/sysctl.d/10-ipv6-privacy.conf':
        ensure => absent,
      }

      # Also, make sure we listen to route advertisements
      sysctl::value { 'net.ipv6.conf.default.accept_ra':
        value => '1',
      }
      sysctl::value { 'net.ipv6.conf.all.accept_ra':
        value => '1',
      }

    }
  }

}
