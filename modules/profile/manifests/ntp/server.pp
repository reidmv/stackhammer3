class profile::ntp::server {
  class { 'ntp':
    server_enabled => true,
  }
}
