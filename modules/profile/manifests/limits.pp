class profile::limits {
  limits::limits { 'default_nproc_set':
    ensure     => present,
    user       => '*',
    limit_type => 'nproc',
    hard       => 150,
    soft       => 300,
  }
}
