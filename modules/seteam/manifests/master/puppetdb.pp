class seteam::master::puppetdb {
  include seteam

  $public_hostname = $::ec2_public_hostname ? {
    default => $::ec2_public_hostname,
    undef   => undef,
  }

  class { 'puppetdb::server':
    database       => 'embedded',
    listen_address => $public_hostname,
    require        => Class['seteam'],
  }

  class { 'puppetdb::master::config':
    require                  => Class['puppetdb::server'],
    puppetdb_startup_timeout => '120',
  }

}
