class seteam::master::puppet {
  include seteam

  Ini_setting {
    ensure  => present,
    notify  => Service['pe-httpd'],
    section => 'main',
    path    => '/etc/puppetlabs/puppet/puppet.conf',
  }

  File {
    ensure => file,
    owner  => 'pe-puppet',
    group  => 'pe-puppet',
  }

  file { '/etc/puppetlabs/puppet/fileserver.conf':
    ensure  => file,
    content => template('seteam/fileserver.conf.erb'),
    mode    => '0644',
  }

  file { '/etc/puppetlabs/puppet/hiera.yaml':
    ensure => file,
    source => 'puppet:///modules/seteam/master/hiera.yaml',
    mode   => '0644',
  }

}
