class saleseng::debian {
  include saleseng::agent
  include ntp

  apt::source { 'puppetlabs-products':
    location    => 'http://apt.puppetlabs.com',
    key         => '4BD6EC30',
    key_content => template('saleseng/puppetlabs.gpg'),
  }

  apt::source { 'puppetlabs-enterprise':
    location    => 'http://apt-enterprise.puppetlabs.com',
    repos       => 'extras',
    key         => '4BD6EC30',
    key_content => template('saleseng/puppetlabs.gpg'),
  }

}
