class windows::ftp {
  dism { ['IIS-FTPServer','IIS-FTPSvc']:
    ensure  => 'present',
    require => Dism['IIS-WebServerRole'],
  }
}
