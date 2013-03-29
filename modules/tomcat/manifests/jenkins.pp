# Class: tomcat::jenkins
#
#   This class models the Jenkins Continuous Integration
#   service in Puppet.
#
class tomcat::jenkins(
  $jenkins_war_file   = $tomcat::params::jenkins_war_file,
) inherits tomcat::params {
  $jenkins_packages = ['fontconfig', 'dejavu-sans-fonts']

  package{ $jenkins_packages:
    ensure => installed,
    before => Tomcat::War['jenkins'],
  }
  
  tomcat::war { 'jenkins':
    filename => $jenkins_war_file,
  }
}
