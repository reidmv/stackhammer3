define nagios::htpasswd (
  $username,
  $password,
  $ensure = present,
  $path   = undef
) {
  include nagios::params
  include apache::params

  $password_sha1 = nagios_sha1($password)

  if ($path == undef) {
    $path_real = $nagios::params::htpasswd_file
  } else {
    $path_real = $path
  }

  if !defined(Concat["nagios::htpasswd:$title"]) {
    concat { "nagios::htpasswd:$title":
      path  => $path_real,
      owner => $apache::params::user,
      group => $apache::params::group,
      mode  => '0600',
    }
  }

  concat::fragment { "nagios::htpasswd:$title":
    ensure  => $ensure,
    target  => "nagios::htpasswd:$title",
    content => "${username}:{SHA}${password_sha1}\n",
    order   => '10',
  }
}
