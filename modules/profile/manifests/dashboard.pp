class profile::dashboard {

  dashboard::class { 'profile::tomcat':
    before => Dashboard::Group['Tomcat'],
  }

  dashboard::group { 'Tomcat':
    classes    => ['profile::tomcat'],
    parameters => ['tomcat_version=6.0.35'],
  }

}
