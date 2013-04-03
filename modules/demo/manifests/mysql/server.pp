class demo::mysql::server {

  class { '::mysql::server':
    enabled     => true,
    config_hash => {
      'root_password' => 'sudomakemeasandwich',
      'bind_address'  => '0.0.0.0',
    },
  }

}
