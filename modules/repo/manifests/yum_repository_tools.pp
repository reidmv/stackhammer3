class repo::yum_repository_tools {
  package { 'createrepo':
    ensure => installed,
  }

  package { 'yum-utils':
    ensure => installed,
  }
}
