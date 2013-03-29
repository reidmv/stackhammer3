class repo::params {
  $yumrepo_path    = pick($::yumrepo_path, '/var/tmp/puppetrepo')
  $yumrepo_port    = pick($::yumrepo_port, '9876')
  $yumrepo_server  = pick($::yumrepo_server, "beaker-centos.dc1.puppetlabs.net:${yumrepo_port}")
  $yumrepo_baseurl = pick($::yumrepo_baseurl, "http://${yumrepo_server}")
}
