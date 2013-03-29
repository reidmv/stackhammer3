class repo::yumrepo_use (
  $yumrepo_baseurl = $repo::params::yumrepo_baseurl
) inherits repo::params {
  file { '/etc/yum.repos.d/puppet_made_repo.repo':
    ensure  => file,
    content => template('repo/puppet_made_repo.repo.erb'),
    notify  => Exec['update-yumcache'],
  }

  exec { 'update-yumcache':
    command     => '/usr/bin/yum makecache',
    refreshonly => true,
  }
}
