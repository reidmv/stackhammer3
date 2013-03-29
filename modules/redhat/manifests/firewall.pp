class redhat::firewall {

  service { 'iptables':
    ensure => running,
    enable => true,
  }

  Firewall {
    ensure  => present,
    table   => 'filter',
    chain   => 'RH-Firewall-1-INPUT',
    require => Firewallchain['RH-Firewall-1-INPUT:filter:IPv4'],
  }

  # Default firewall chains shipped with RHEL systems
  firewallchain { 'INPUT:filter:IPv4':
    ensure => 'present',
    policy => 'accept',
  }
  firewallchain { 'OUTPUT:filter:IPv4':
    ensure => 'present',
    policy => 'accept',
  }
  firewallchain { 'RH-Firewall-1-INPUT:filter:IPv4':
    ensure => 'present',
  }

  # Default rules for the INPUT chain
  firewall { '9979 forward INPUT to RH-Firewall-1-INPUT':
    chain => 'INPUT',
    jump  => 'RH-Firewall-1-INPUT',
  }

  # Default rules for the FORWARD chain
  firewall { '9980 forward FORWARD to RH-Firewall-1-INPUT':
    chain => 'FORWARD',
    jump  => 'RH-Firewall-1-INPUT',
  }

  # Default rules for the RH-Firewall-1-INPUT chain
  firewall { '9981 lo accept':
    action  => 'accept',
    iniface => 'lo',
  }
  firewall { '9982 eth0 accept':
    action  => 'accept',
    iniface => 'eth0',
  }
  firewall { '9983 icmp accept':
    action => 'accept',
    proto  => 'icmp',
  }
  firewall { '9984 esp accept':
    action => 'accept',
    proto  => 'esp',
  }
  firewall { '9985 ah accept':
    action => 'accept',
    proto  => 'ah',
  }
  firewall { '9986 udp mdns accept':
    action      => 'accept',
    proto       => 'udp',
    destination => '224.0.0.251/32',
    dport       => '5353',
  }
  firewall { '9989 related,established accept':
    action => 'accept',
    proto  => 'all',
    state  => ['RELATED', 'ESTABLISHED'],
  }
  firewall { '9990 ssh accept':
    action => 'accept',
    proto  => 'tcp',
    state  => 'NEW',
    dport  => '22',
  }
  firewall { '9991 default reject':
    action => 'reject',
    proto  => 'all',
    reject => 'icmp-host-prohibited',
  }

}
