class nagios::server (
  $ensure   = present,
  $username = 'nagiosadmin',
  $password = 'nagiosadmin',
  $purge    = pick($::nagios_server_purge, 'false')
) {
  include nagios::params

  case $ensure {
    default: { fail("unrecognized ensure value \"$ensure\"") }
    present, 'present': {
      $service_ensure    = running
      $service_enable    = true
      $service_before    = undef
      $service_require   = Package[$nagios::params::server_package]
    }
    absent, 'absent': {
      $service_ensure    = stopped
      $service_enable    = false
      $service_before    = Package[$nagios::params::server_package]
      $service_require   = undef
    }
  }

  nagios::htpasswd { 'nagios::server':
    username => $username,
    password => $password,
  }

  package { $nagios::params::server_package:
    ensure => $ensure,
  }

  service { $nagios::params::server_service:
    enable    => $enable_service,
    before    => $service_before,
    require   => $service_require,
    subscribe => $service_subscribe,
  }

  # ensure the nagios config file references the .cfg files
  file_line { 'nagios_host':
    line => 'cfg_file=/etc/nagios/nagios_host.cfg',
    path => "${nagios::params::confdir}/nagios.cfg", 
  }
  file_line { 'nagios_hostextinfo':
    line => 'cfg_file=/etc/nagios/nagios_hostextinfo.cfg',
    path => "${nagios::params::confdir}/nagios.cfg", 
  }
  file_line { 'nagios_service':
    line => 'cfg_file=/etc/nagios/nagios_service.cfg',
    path => "${nagios::params::confdir}/nagios.cfg", 
  }

  # collect resources and populate ${nagios::params::confdir}/nagios_*.cfg
  File {
    ensure => file,
    owner  => $nagios::params::owner,
    group  => $nagios::params::group,
    mode   => '0640',
  }

  file {'/etc/nagios':
    ensure => directory,
    mode   => '0755',
  }  

  file { '/etc/nagios/nagios_host.cfg': }
  resources { 'nagios_host': purge => $purge; }
  Nagios_host <<||>> {
    require => File['/etc/nagios/nagios_host.cfg'],
    notify  => Service[$::nagios::params::server_service],
  }

  file { '/etc/nagios/nagios_hostextinfo.cfg': }
  resources { 'nagios_hostextinfo': purge => $purge; }
  Nagios_hostextinfo <<||>> {
    require => File['/etc/nagios/nagios_hostextinfo.cfg'],
    notify  => Service[$::nagios::params::server_service],
  }

  file { '/etc/nagios/nagios_service.cfg': }
  resources { 'nagios_service': purge => $purge; }
  Nagios_service <<||>> {
    require => File['/etc/nagios/nagios_service.cfg'],
    notify  => Service[$::nagios::params::server_service],
  }

}
