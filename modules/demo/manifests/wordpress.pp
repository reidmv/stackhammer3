class demo::wordpress {
  include demo::mysql::server
  include apache::params
  include apache::mod::php

  mysql::db { 'wordpress':
    user     => 'wordpress',
    password => 'wordpress',
    host     => 'localhost',
  } ->

  # Setup the Apache webserver
  package { 'php5-mysql':
    ensure => installed,
  } ->

  apache::vhost { 'wordpress.puppetlabs.demo':
    priority      => '10',
    port          => '80',
    docroot       => '/srv/www/wordpress',
  } ->

  # Setup the Wordpress installation files
  file { '/wordpress-3.4.1.tar.gz':
    ensure => present,
    source => 'puppet:///files/demo/wordpress-3.4.1.tar.gz',
  } ->

  exec { 'extract_wordpress':
    provider => shell,
    path     => '/bin:/usr/bin',
    command  => 'cd /srv/www && tar -xzf /wordpress-3.4.1.tar.gz && chown root:root wordpress',
    creates  => '/srv/www/wordpress/index.php',
  } ->

  file { '/srv/www/wordpress/wp-config.php':
    ensure => present,
    source => 'puppet:///modules/demo/wordpress/wp-config.php',
    owner  => $apache::params::user,
    group  => $apache::params::group,
    mode   => '0755',
  }

}
