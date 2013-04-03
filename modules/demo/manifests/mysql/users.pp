class demo::mysql::users {
  include demo::mysql::database

  database_user { 'public@%':
    ensure        => present,
    password_hash => mysql_password('public'),
    provider      => 'mysql',
  }

  database_user { 'backup@%':
    ensure        => present,
    password_hash => mysql_password('ArchiveEverything'),
    provider      => 'mysql',
  }

}
