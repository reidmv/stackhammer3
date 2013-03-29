class nagios::host (
  $ensure    = present,
  $ipaddress = $::ipaddress
) {
  include nagios::params

  case $ensure {
    default: { fail("unrecognized ensure value \"$ensure\"") }
    present, 'present', absent, 'absent': { }
  }

  package { $nagios::params::plugin_package:
    ensure => $ensure,
  }

  @@nagios_host { $::fqdn:
    ensure  => $ensure,
    alias   => $::hostname,
    address => $ipaddress,
    use     => 'generic-host',
  }

  @@nagios_hostextinfo { $::fqdn:
    ensure          => $ensure,
    icon_image_alt  => $::operatingsystem,
    icon_image      => "base/${::operatingsystem}.png",
    statusmap_image => "base/${::operatingsystem}.gd2",
  }

  @@nagios_service { "check_ping_${fqdn}":
    check_command       => 'check_ping!100.0,20%!500.0,60%',
    use                 => 'generic-service',
    host_name           => $::fqdn,
    notification_period => '24x7',
    service_description => "check_ping_${fqdn}",
  }

  case $::osfamily {
    default:   { include nagios::host::unix    }
    'Windows': { include nagios::host::windows }
  }

}
