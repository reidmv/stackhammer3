class role::ldapclient (
  $server = pick($::role_ldapclient_server, 'ldapi:///')
) {

  class { 'ldap::client':
    server_list         => $server,
    default_search_base => 'dc=puppetlabs,dc=com',
    service_search_descriptors => [
      'passwd:ou=people,dc=puppetlabs,dc=com',
      'shadow:ou=people,dc=puppetlabs,dc=com',
      'group:ou=groups,dc=puppetlabs,dc=com',
    ],
  }

}
