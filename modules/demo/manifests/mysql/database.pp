class demo::mysql::database {
  include demo::mysql::server

  mysql::db { 'demo':
    user     => 'demo_user',
    password => 'demo_pass',
    host     => '%',
  }

}
