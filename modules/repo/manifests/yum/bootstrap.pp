define repo::yum::bootstrap (
  $path
) {

  require repo::yum_repository_tools

  file { "repo-${path}":
    ensure => directory,
    path   => $path,
  }

  file { "${path}/noarch":
    ensure => directory,
  }

  file { 'garypkg-1':
    ensure => file,
    path   => "${path}/noarch/garypkg-1.0.0-1.noarch.rpm",
    source => 'puppet:///modules/repo/garypkg-1.0.0-1.noarch.rpm',
  }
  
  file { 'garypkg-2':
    ensure => file,
    path   => "${path}/noarch/garypkg-2.0.0-1.noarch.rpm",
    source => 'puppet:///modules/repo/garypkg-2.0.0-1.noarch.rpm',
  }
  
  file { 'garypkg-3':
    ensure => file,
    path   => "${path}/noarch/garypkg-2.1.0-1.noarch.rpm",
    source => 'puppet:///modules/repo/garypkg-2.1.0-1.noarch.rpm',
  }

  exec { "create-${repo}-repo":
    path    => '/usr/bin',
    command => "createrepo ${path}",
    creates => "${path}/repodata/repomd.xml",
    require => [File['garypkg-1'], File['garypkg-2'], File['garypkg-3']],
  }
}
