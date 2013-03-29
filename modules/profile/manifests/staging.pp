class profile::staging {

  # Set up the staging class, declaring the appropriate staging directory
  # dependent on operatingsystem.
  case $::osfamily {
    default: {
      class { '::staging':
        path  => '/var/staging',
        owner => '0',
        group => '0',
      }
    }
    'windows': {
      class { '::staging':
        path  => 'C:/staging',
      }
    }
  }

}
