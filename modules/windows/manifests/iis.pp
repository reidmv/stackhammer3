class windows::iis {
  dism { 'IIS-WebServerRole':
    ensure => 'present',
  }
}
