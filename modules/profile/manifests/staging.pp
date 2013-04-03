class profile::staging {
  class {'::staging':
    path  => '/var/staging',
    owner => root,
    group => root,
  }
}
