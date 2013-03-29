class saleseng::master::bootstrap {
  include saleseng
  include saleseng::master::files

  $set_certname = generate('/bin/sh', '-c', '/bin/sed -n "s/ *certname *= *\(.*\)/\1/p1" /etc/puppetlabs/puppet/puppet.conf | head -n 1')
  $chomp_certname = regsubst($set_certname, '\n', '', 'G')

  if $chomp_certname == '' {
    fail("Unable to determine certname")
  }

  ini_setting { 'puppet main certname':
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'main',
    setting => 'certname',
    value   => $chomp_certname,
    ensure  => present,
  }

  file { '/tmp/production.sql':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/saleseng/master/bootstrap/production.sql',
  }

  $rakecommand = [
    'rake ',
    '-f ',
    '/opt/puppet/share/puppet-dashboard/Rakefile ',
    'RAILS_ENV=production ',
    'db:raw:restore ',
    'FILE=/tmp/production.sql',
  ]

  exec { 'prepopulate_pec_database':
    path    => '/opt/puppet/bin:/usr/bin:/bin:/usr/sbin:/sbin',
    command => "$rakecommand",
    require => File['/tmp/production.sql'],
  }

}
