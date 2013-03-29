class profile::example::mysql_databases {
  include profile::mysql

  mysql::db { 'demo':
    user     => 'demo_user',
    password => 'demo_pass',
    host     => '%',
  }

  database_user { 'backup@%':
    ensure        => present,
    password_hash => mysql_password('ArchiveEverything'),
    provider      => 'mysql',
  }

  database_user { 'public@%':
    ensure        => present,
    password_hash => mysql_password('public'),
    provider      => 'mysql',
  }

  database_grant { 'backup@%':
    privileges => 'Select_priv',
    provider   => 'mysql',
    require    => Database_user['backup@%'],
  }

  database_grant { 'public@%/demonstration':
    privileges => 'Select_priv',
    provider   => 'mysql',
    require    => [
      Database['demonstration'],
      Database_user['pubilc@%'],
    ],
  }

}

