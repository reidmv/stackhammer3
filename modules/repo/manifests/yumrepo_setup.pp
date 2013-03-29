class repo::yumrepo_setup (
  $yumrepo_path   = $repo::params::yumrepo_path,
  $yumrepo_port   = $repo::params::yumrepo_port
) inherits repo::params {
  include apache::params

  repo::yum::bootstrap { 'yumrepo':
    path => $yumrepo_path,
  }

  apache::vhost { 'yum_repository':
    servername => $fqdn,
    priority   => '20',
    port       => $yumrepo_port,
    docroot    => $yumrepo_path,
    require    => Repo::Yum::Bootstrap['yumrepo'],
  }

  exec { 'kill-selinux':
    command => '/usr/sbin/setenforce 0',
    unless  => '/bin/cat /selinux/enforce | grep 0',
    onlyif  => '/usr/sbin/selinuxenabled',
    before  => Apache::Vhost['yum_repository'],
  }

  Firewall <| dport == $yumrepo_port |>
}
