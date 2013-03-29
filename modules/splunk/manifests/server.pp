class splunk::server (
  $splunk_pkg = $splunk::params::splunk_pkg,
  $splunk_pkg_name = $splunk::params::splunk_pkg_name,
  $splunk_ver = $splunk::params::splunk_ver,
  $splunk_source = $splunk::params::source_root,
  $pkg_provider = $splunk::params::pkg_provider
) inherits splunk::params {
  
  #saleseng staging default dir: /var/staging/
  include profile::staging

  staging::file {"${splunk_pkg}":
    source => "${splunk_source}/${splunk_pkg}",
  }

  package {'splunk':
    ensure   => present,
    provider => $pkg_provider,
    source   => "/var/staging/splunk/${splunk_pkg}",
    require  => Staging::File["${splunk_pkg}"],
  }

  exec {'license_splunk':
    command => "/opt/splunk/bin/splunk start --accept-license --answer-yes",
    creates => "/opt/splunk/etc/auth/splunk.secret",
    timeout => 0,
    require => Package['splunk'],
  }
  
  exec {'enable_splunk':
    command => "/opt/splunk/bin/splunk enable boot-start",
    creates => "/etc/init.d/splunk",
    require => Exec['license_splunk'],
  }

  service {'splunk':
    ensure  => running,
    enable  => true,
    require => Exec['enable_splunk'],
  }

  exec {"set_listen_port":
    unless  => "/bin/grep '\[splunktcp\:\/\/${splunk::params::logging_port}\]' /opt/splunk/etc/apps/search/local/inputs.conf",
    command => "/opt/splunk/bin/splunk enable listen ${splunk::params::logging_port} -auth ${splunk::params::splunk_admin}:${splunk::params::splunk_admin_pass}",
    require => Exec['license_splunk'],
  }
  exec {"set_tcp_listen_port":
    unless  => "/bin/grep '\[tcp\:\/\/${splunk::params::syslogging_port}\]' /opt/splunk/etc/apps/search/local/inputs.conf",
    command => "/opt/splunk/bin/splunk add tcp ${splunk::params::syslogging_port} -sourcetype syslog -auth ${splunk::params::splunk_admin}:${splunk::params::splunk_admin_pass}",
    require => Exec['license_splunk'],
  }
  firewall { "100 allow Splunk Console":
    action => "accept",
    proto  => "tcp",
    dport  => "${splunk::params::admin_port}",
  }
  firewall { "100 allow Splunkd":
    action => "accept",
    proto  => "tcp",
    dport  => "${splunk::params::splunkd_port}",
  }
  firewall { "100 allow splunktcp syslog Logging in":
    action => "accept",
    proto  => "tcp",
    dport  => "${splunk::params::logging_port}",
  }
  firewall { "100 allow tcp syslog Logging in":
    action => "accept",
    proto  => "tcp",
    dport  => "${splunk::params::syslogging_port}",
  }
}
