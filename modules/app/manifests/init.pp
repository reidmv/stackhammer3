class app (
  $version = pick($::app_version, '1')
) {
  class { 'apache': }

  File {
    owner => 'apache',
    group => 'apache',
  }

  file { '/app':
    ensure  => directory,
    mode    => '0755',
    require => Package['httpd'],
  }

  file { '/app/index.html':
    ensure  => file,
    mode    => '0644',
    content => template('app/index.html.erb'),
    require => Package['httpd'],
    notify  => Service['httpd'],
  }

  file { '/app/version.txt':
    ensure  => file,
    mode    => '0644',
    content => "${version}\n",
  }

  apache::vhost { 'app':
    priority   => '10',
    vhost_name => '*',
    port       => '80',
    docroot    => '/app',
  }

  $ensure = $::environment ? {
    'production' => present,
    default      => absent,
  }

  @@haproxy::balancermember { $::hostname:
    ensure            => $ensure,
    listening_service => 'app',
    server_names      => $::hostname,
    ipaddresses       => $::ipaddress_eth1,
    ports             => '80',
    options           => 'check',
  }

}
