class saleseng::nagios {

  class { 'nagios::host':
    ensure    => present,
    ipaddress => pick($::ipaddress_eth1, $::ipaddress),
  }

}
