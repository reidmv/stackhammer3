class profile::mysql {

  class { '::mysql::server':
    enabled     => true,
    config_hash => {
      'root_password' => 'puppet',
      'bind_address'  => '0.0.0.0',
    },
  }

  include mysql::php

}
