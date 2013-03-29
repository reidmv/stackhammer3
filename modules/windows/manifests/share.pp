class windows::share {
  include apache::params

  $vhost_port = '8081'

  file { '/var/msis':
    ensure => directory,
    mode   => '0755',
  }

  file { '/var/msis/puppet-enterprise-2.5.2-all.tar.gz':
    ensure => file,
    source => 'puppet:///modules/windows/puppet-enterprise-2.5.2-all.tar.gz',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/var/msis/GNUbase.pkg':
    ensure => file,
    source => 'puppet:///modules/windows/GNUbase.pkg',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/var/msis/ASlibiconv-1.12.pkg':
    ensure => file,
    source => 'puppet:///modules/windows/ASlibiconv-1.12.pkg',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/var/msis/orca-3.0.3790.msi':
    ensure => file,
    source => 'puppet:///modules/windows/orca-3.0.3790.msi',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/var/msis/orca-5.0.7069.msi':
    ensure => file,
    source => 'puppet:///modules/windows/orca-5.0.7069.msi',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  apache::vhost { 'windows_share':
    priority => '20',
    port     => $vhost_port,
    docroot  => '/var/msis',
    template => 'apache/vhost-default.conf.erb',
    require  => File['/var/msis'],
  }

  Firewall <| dport == $vhost_port |>

}
