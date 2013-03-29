class saleseng::master {
  include saleseng::master::puppet
  include saleseng::master::puppetdb
  include saleseng::master::files

  # Puppet master firewall rules
  Firewall {
    chain  => 'INPUT',
    proto  => 'tcp',
    action => 'accept',
  }
  firewall { '110 puppetmaster allow all':
    dport  => '8140',
  }
  firewall { '110 dashboard allow all':
    dport  => '443',
  }
  firewall { '110 mcollective allow all':
    dport  => '61613'
  }

  # Set up userland amenities
  case $::osfamily {
    default: { }
    'Debian': {
      package { 'vim-puppet':
        ensure => installed,
      }
      exec { 'vim-puppet':
        provider => shell,
        command  => 'vim-addons install puppet',
        unless   => 'vim-addons show puppet | grep "Status: installed"',
        require  => Package['vim-puppet'],
        path     => '/bin:/usr/bin:/sbin:/usr/sbin',
      }
    }
  }

}
