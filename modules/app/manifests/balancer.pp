class app::balancer {

  class { '::haproxy': }

  haproxy::listen { 'app':
    ipaddress => $::ipaddress_eth1,
    ports     => '80',
    options   => {
      'option'  => [
        'tcplog',
      ],
      'balance' => 'roundrobin',
    },
  }

  Haproxy::Balancermember <| |>

}
