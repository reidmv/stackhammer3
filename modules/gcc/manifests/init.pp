class gcc inherits gcc::params{
  package { 'gcc':
    ensure => installed,
    name   => $gcc::params::gcc_name,
  }
  package { 'make':
    ensure => installed,
  }
}
