class app::mcollective {
  include pe_mcollective

  File {
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    notify => Service['pe-mcollective'],
  }

  file { '/opt/puppet/libexec/mcollective/mcollective/agent/app.rb':
    source => 'puppet:///modules/app/app.rb',
  }
  file { '/opt/puppet/libexec/mcollective/mcollective/agent/app.ddl':
    source => 'puppet:///modules/app/app.ddl',
  }

  file { '/opt/puppet/libexec/mcollective/mcollective/agent/util.rb':
    source => 'puppet:///modules/app/util.rb',
  }
  file { '/opt/puppet/libexec/mcollective/mcollective/agent/util.ddl':
    source => 'puppet:///modules/app/util.ddl',
  }

}
