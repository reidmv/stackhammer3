class nagios::params {

  case $::osfamily {
    default: { fail("unsupported osfamily: \"$::osfamily\"") }
    'Debian': {
      $confdir = '/etc/nagios3'
      $cfg_dir = "${confdir}/conf.d"
      $server_package = [
        'nagios3',
        'nagios-nrpe-plugin',
      ]
      $server_service = 'nagios3'
      $plugin_package = [
        'nagios-plugins',
        'nagios-nrpe-server',
      ]
      $htpasswd_file  = "${confdir}/htpasswd.users"
      $owner = 'nagios'
      $group = 'nagios'
    }
    'RedHat': {
      $confdir = '/etc/nagios'
      $cfg_dir = "${confdir}/conf.d"
      $server_package = 'nagios'
      $server_service = 'nagios'
      $plugin_package = [
        'nagios-plugins-users',
        'nagios-plugins',
        'nrpe',
      ]
      $htpasswd_file  = "${confdir}/htpasswd.users"
      $owner = 'nagios'
      $group = 'nagios'
    }
  }

}
