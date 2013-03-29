# Class: solarisnic
#
# This module manages solarisnic
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class solarisnic(
  $defaultrouter = false,
  $interfaces = {}
){
  File {
    owner => '0',
    group => '0',
    mode  => '0644',
  }

  # We don't manage the content of the default router unless the user
  # explicitly gives us the address when declaring the class.
  $defaultrouter_content = $defaultrouter ? {
    false   => undef,
    default => "${defaultrouter}\n",
  }

  # This sets the default gateway.
  file { '/etc/defaultrouter':
    ensure  => file,
    content => $defaultrouter_content,
  }
  # This controls the network masks and is consulted when bringing up the
  # interface.
  file { '/etc/inet/netmasks':
    owner  => 'sys',
    mode   => '0444',
    ensure => file,
  }

  # Create all of the interfaces from the data provided.  This is structured in
  # a way to work with Hiera in the future.
  create_resources('solarisnic::interface', $interfaces)
}
