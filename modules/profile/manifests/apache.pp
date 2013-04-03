class profile::apache {
  class { '::apache': }
  apache::vhost { $::hostname:
    port    => '80',
    docroot => '/var/www/html',
  }
  
  file { ['/var/www', '/var/www/html']:
    ensure => directory,
  }

  file { '/var/www/html/index.html':
    ensure => present,
    content => template('profile/apache/index.html.erb'),
  }
}
