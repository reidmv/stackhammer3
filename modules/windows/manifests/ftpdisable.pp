class windows::ftpdisable {
  dism { ['IIS-FTPServer','IIS-FTPSvc']:
    ensure  => 'absent',
    before => Dism['IIS-WebServerRole'],
  }
}
