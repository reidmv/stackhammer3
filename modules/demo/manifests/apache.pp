class demo::apache {
  include apache::params

  file { '/srv':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/srv/www':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/srv/www/website.puppetlabs.demo':
    ensure  => present,
    owner   => $apache::params::user,
    group   => $apache::params::group,
    recurse => true,
    purge   => true,
    source  => 'puppet:///modules/demo/apache/website.puppetlabs.demo',
    before  => Apache::Vhost['website.puppetlabs.demo'],
  }

  apache::vhost { 'website.puppetlabs.demo':
    priority => '10',
    port     => '80',
    docroot  => '/srv/www/website.puppetlabs.demo',
  }

}
