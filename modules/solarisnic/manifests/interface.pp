# Define: solarisnic::interface
#
#   This defined resource type manages the network configuration of a network
#   interface on Solaris 10.  It supports static IP configuration.
#
# Parameters:
#
# $interface:: This is the interface to configure, e.g. 'e1000g1'.  This is the
#              namevar.
#
# $ipaddress:: The IPv4 address to assign to the interface.
#
# $hostname:: The interface specific hostname.  This should resolve to the
#             ipaddress assigned to this interface and should be specific to
#             the interface, not the system (node).
#
# $network::  The network this interface is a part of.  e.g. '192.168.100.0'
#
# $netmask::  The network mask to apply for this interface.  e.g. '255.255.255.0'
#
# Actions:
#
# Requires:
#
#   puppetlabs-stdlib module
#
# Sample Usage:
#
define solarisnic::interface(
  $interface = 'UNSET',
  $ipaddress,
  $network,
  $netmask,
  $hostname
) {

  include solarisnic

  $interface_real = $interface ? {
    'UNSET' => $name,
    default => $interface,
  }

  File {
    owner => '0',
    group => '0',
    mode  => '0644',
  }

  Exec {
    path => "/usr/local/bin:/opt/puppet/bin:/opt/csw/bin:/usr/sbin:/usr/bin:/bin"
  }

  # These settings take effect immediately.
  exec { "${name}-plumb":
    command => "ifconfig $interface_real plumb up",
    unless  => "/bin/bash -c 'ifconfig $interface_real | grep \"flags=.*UP\"'",
  }
  exec { "${name}-address":
    command => "ifconfig $interface_real $ipaddress netmask $netmask",
    unless  => "/bin/bash -c 'ifconfig $interface_real | grep \"inet $ipaddress\"'",
    require => Exec["${name}-plumb"],
  }

  # These configuration settings will take effect the next boot.
  file { "/etc/hostname.${interface_real}":
    ensure  => file,
    content => "${hostname}\n",
  }
  host { "${hostname}.${::domain}":
    ensure       => present,
    host_aliases => [$hostname],
    ip           => $ipaddress,
    target       => '/etc/inet/hosts',
  }
  file_line { "${name}-netmask":
    path    => "/etc/inet/netmasks",
    line    => "$network $netmask",
    require => File["/etc/inet/netmasks"],
  }
}
# EOF


