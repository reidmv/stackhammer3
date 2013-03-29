class splunk::linux_forwarder {

  $server = $splunk::params::logging_server
  $port   = $splunk::params::logging_port
  $splunkforwarder_pkg = $splunk::params::splunkforwarder_pkg
  $splunk_source = $splunk::params::source_root

  include profile::staging

  staging::file {"${splunkforwarder_pkg}":
    source => "${splunk_source}/${splunkforwarder_pkg}",
  }

  package {'splunkforwarder':
    ensure   => present,
    source   => "/var/staging/splunk/${splunkforwarder_pkg}",
    require  => Staging::File["${splunkforwarder_pkg}"],
  }

  exec {'license_splunk':
    command => "/opt/splunkforwarder/bin/splunk start --accept-license --answer-yes",
    creates => "/opt/splunkforwarder/etc/auth/splunk.secret",
    timeout => 0,
    require => Package['splunkforwarder'],
  }
  
  exec {'enable_splunk':
    command => "/opt/splunkforwarder/bin/splunk enable boot-start",
    creates => "/etc/init.d/splunk",
    require => Exec['license_splunk'],
  }
  
  exec {"set_monitor_default":
    unless  => "/bin/grep \"/var/log\" /opt/splunkforwarder/etc/apps/search/local/inputs.conf",
    command => "/opt/splunkforwarder/bin/splunk add monitor \"/var/log/\" -auth ${splunk::params::splunk_admin}:${splunk::params::splunk_admin_pass}",
    require => Exec['license_splunk','enable_splunk'],
  }
  
  service {"splunk":
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Exec['enable_splunk'],
  }

  file { '/opt/splunkforwarder/etc/system/local/outputs.conf':
    ensure  => file,
    content => template('splunk/outputs.conf.erb'),
    require => Package['splunkforwarder'],
    notify  => Service['splunk'],
  }
}
