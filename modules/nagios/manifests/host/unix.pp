class nagios::host::unix {

  @@nagios_service { "check_ssh_${fqdn}":
    check_command       => 'check_ssh',
    use                 => 'generic-service',
    host_name           => $::fqdn,
    notification_period => '24x7',
    service_description => "check_ssh_${::fqdn}",
  }

}
