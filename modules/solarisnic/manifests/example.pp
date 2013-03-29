# = Class: solarisnic::example
#
#   This is a class that shows an example of how to automatically configure
#   additional interfaces in Solaris 10.
#
# = Parameters
#
# = Actions
#
# = Requires
#
# = Sample Usage
#
#   include solarisnic::example
#
# (MARKUP: http://links.puppetlabs.com/puppet_manifest_documentation)
class solarisnic::example {
  # Manage an un-used interface
  solarisnic::interface { "e1000g1":
    ipaddress => "172.16.214.91",
    network   => "172.16.214.0",
    netmask   => "255.255.255.0",
    hostname  => "pe-solaris10-2",
  }

  # Mount an NFS filesystem
  mount { "/vagrant":
    ensure      => mounted,
    device      => "172.16.214.1:/Users/jeff/vms/puppet",
    blockdevice => '-',
    pass        => '-',
    atboot      => yes,
    fstype      => nfs,
    options     => '-',
  }

  # Manage routing table entries.
  solarisnic::route { "lab30":
    network => "10.20.30.0",
    netmask => "255.255.255.0",
    gateway => "172.16.214.2",
  }
  solarisnic::route { "lab40":
    network => "10.20.40.0",
    netmask => "255.255.255.0",
    gateway => "172.16.214.2",
  }
  solarisnic::route { "lab50":
    ensure  => $fact_lab50_ensure,
    network => "10.20.50.0",
    netmask => "255.255.255.0",
    gateway => "172.16.214.2",
  }
}
