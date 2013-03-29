class openssh::known_hosts {
  Sshkey <<| |>> {
    ensure => present,
    before => File['/etc/ssh/ssh_known_hosts'],
  }

  # See bug http://projects.puppetlabs.com/issues/2014
  file { '/etc/ssh/ssh_known_hosts':
    ensure => file,
    owner  => '0',
    group  => '0',
    mode   => '0644',
  }
}
