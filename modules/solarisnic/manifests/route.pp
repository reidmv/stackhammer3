# Define: solarisnic::route
#
#   This defined resource type manages entries in the routing table for a
#   Solaris 10 machine.  This could and perhaps should be implemented as a
#   native type but the defined type is here to illustrate how to easily model
#   resources without an in-depth knowledge of Ruby.
#
#   Idempotent Exec resources provide a good implementation for this problem.
#
# Parameters:
#
# ensure:: [ present | absent ] The basic state of the route entry.
#
# network:: The destination network with the mask bits appended.  e.g.
#           '10.20.40.0'
#
# netmask:: The netmask of the destination network.  Must be specified in IPv4
#           format.  e.g. '255.255.255.0'
#
# gateway:: The router to use for destination traffic.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
#   class lab_network {
#     # Route all traffic destined for 192.168.200.0/24 to the gateway at
#     # 10.20.30.1
#     solarisnic::route { 'lab_network_vpn':
#       network => '10.20.40.0',
#       netmask => '255.255.255.0',
#       gateway => '10.20.30.1',
#     }
#   }
define solarisnic::route(
  $ensure = present,
  $network,
  $netmask,
  $gateway
) {

  validate_re($ensure, '^present$|^absent$')

  # Convert the netmask to bits so we can feed it into the route add command.
  # the netstat command reports back the netmask notation.
  $bits = mask2cidr($netmask)

  # The command will only execute if the route is not already in the routing table
  # as reported by `netstat -nrv` and parsed using awk columns.
  if $ensure == present {
    exec { "${name}-${network}-${gateway}":
      path     => "/sbin:/usr/sbin:/bin:/usr/bin:/usr/sfw/bin",
      command  => "route -n add ${network}/${bits} $gateway",
      unless   => "/bin/bash -c \"netstat -nrv | awk 'BEGIN { r=1 } \\\$1 == \\\"${network}\\\" && \\\$2 == \\\"${netmask}\\\" && \\\$3 == \\\"${gateway}\\\" { r=0 } END { exit r }'\"",
    }
  } else {
    exec { "${name}-${network}-${gateway}":
      path     => "/sbin:/usr/sbin:/bin:/usr/bin:/usr/sfw/bin",
      command  => "route -n delete ${network}/${bits} $gateway",
      onlyif   => "/bin/bash -c \"netstat -nrv | awk 'BEGIN { r=1 } \\\$1 == \\\"${network}\\\" && \\\$2 == \\\"${netmask}\\\" && \\\$3 == \\\"${gateway}\\\" { r=0 } END { exit r }'\"",
    }
  }
}
# EOF
