class saleseng::agent {

  Ini_setting {
    ensure  => present,
    path    => '/etc/puppetlabs/puppet/puppet.conf',
  }

  # On public clouds and when using stack-builder with the cloud provisioner
  # we need to set the puppet.conf server parameter. For now, we're performing
  # a simple check based on ec2 facts. We will probably need to harden this at
  # some point to account for more diverse clouds.
  if $::ec2_hostname {
    ini_setting { 'main_server':
      setting => 'server',
      section => 'main',
      value   => $::servername,
    }

    ini_setting { 'agent_server':
      setting => 'server',
      section => 'agent',
      value   => $::servername,
    }
  }

}
