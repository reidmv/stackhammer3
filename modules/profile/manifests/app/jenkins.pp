class profile::app::jenkins {

  include profile::tomcat
  include tomcat::jenkins

}
