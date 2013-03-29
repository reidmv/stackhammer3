class profile::app::wordpress {

  include profile::mysql
  include profile::apache

  group { 'wordpress':
    ensure => present,
  }

  user { 'wordpress':
    ensure   => present,
    gid      => 'wordpress',
    password => '$1$jrm5tnjw$h8JJ9mCZLmJvIxvDLjw1M/', #puppet
    home     => '/var/www/wordpress',
  }

  ## Configure apache
  apache::vhost { 'wordpress':
    servername => '*',
    port       => '80',
    docroot    => '/var/www/wordpress',
  }

  ## Configure wordpress
  class { 'wordpress':
    install_dir => '/var/www/wordpress',
    db_name     => 'wordpress',
    db_host     => 'localhost',
    db_user     => 'wordpress',
    db_password => 'wordpress',
    wp_owner    => 'wordpress',
    wp_group    => 'wordpress',
  }
}
