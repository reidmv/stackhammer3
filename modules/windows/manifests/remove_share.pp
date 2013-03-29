class windows::remove_share {
  include apache::params
  package { $apache::params::apache_name:
    ensure => purged,
    require => Service[$apache::params::apache_name],
  }

  service { $apache::params::apache_name:
    ensure => stopped,
    enable => false,
  }

  file { '/var/msis':
    ensure  => absent,
    force   => true,
    recurse => true,
  }

  file { "${apache::params::vdir}/20-windows_share.conf":
    ensure => absent,
  }
}
