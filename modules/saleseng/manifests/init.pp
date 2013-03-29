class saleseng {

  case $::osfamily {
    default: { }
    'RedHat': { include saleseng::redhat }
    'Debian': { include saleseng::debian }
  }

}
