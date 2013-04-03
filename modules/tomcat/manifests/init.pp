class tomcat(
  $tomcat_version         = $tomcat::params::tomcat_version,
  $tomcat_tarball         = $tomcat::params::tomcat_tarball,
  $tomcat_current_version = $tomcat::params::tomcat_current_version,
  $war_source             = $tomcat::params::war_source
) inherits tomcat::params {

  #
  # Staging Module Setup
  # profile::staging sets up everything in /var/staging
  include profile::staging

  staging::file{ $tomcat_tarball:
    source => "${war_source}/${tomcat_tarball}",
  }

  staging::extract{ $tomcat_tarball:
    target  => "/opt/tomcat",
    creates => "/opt/tomcat/${tomcat_current_version}",
    require => [
      Staging::File[$tomcat_tarball],
      File["/opt/tomcat"]
    ]
  }


  #
  # Tomcat Setup and Dependencies
  #
  package { "java-1.7.0-openjdk.${::hardwaremodel}":
    ensure => installed,
  }

  file { '/opt/tomcat/active':
    ensure  => symlink,
    target  => "/opt/tomcat/${tomcat_current_version}",
    require => Staging::Extract[$tomcat_tarball],
  }

  file { '/opt/tomcat':
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => 0644,
  }

  file { '/etc/init.d/tomcat':
    mode    => '0755',
    source  => 'puppet:///modules/tomcat/tomcat-init-script',
    require => File['/opt/tomcat/active'],
  }

  file { "/usr/bin/stop_tomcat":
    ensure => present,
    mode   => '0755',
    source => 'puppet:///modules/tomcat/stop_tomcat.sh',
  }

  service { 'tomcat':
    ensure    => running,
    enable    => true,
    hasstatus => true,
    restart   => '/usr/bin/stop_tomcat && sleep 3 && /etc/init.d/tomcat start',
    subscribe => [
                   File['/opt/tomcat/active'],
                   Package["java-1.7.0-openjdk.${::hardwaremodel}"]
                 ],
    require   => [
                   File['/usr/bin/stop_tomcat'],
                   File['/etc/init.d/tomcat'],
                 ],
  }

  firewall { "0101 tomcat allow":
    action => 'accept',
    dport  => '8080',
    proto  => 'tcp',
  }
}

