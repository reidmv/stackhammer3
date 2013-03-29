class root_user {
  # A root user with the password of 'puppet'
  user { 'root':
    ensure           => 'present',
    comment          => 'root',
    gid              => '0',
    home             => '/root',
    password         => '$6$alXbC/G3$lvoj3pMKquT73ry0Tv6UMcI5iN605ETgwMP7.xD7PQyu07bttGI2cQScyp.cuEiTAILf7YxtExpoFdhlNefJb.',
    password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/bash',
    uid              => '0',
  }
}
