class demo::mysql::grants {
  include demo::mysql::users

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
