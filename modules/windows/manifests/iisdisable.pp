class windows::iisdisable {
  dism { 'IIS-WebServerRole':
    ensure => 'absent',
  }
}
