class 7zip {

  file { 'C:/7z920-x64.msi':
    ensure => file,
    source => 'puppet:///files/7zip/7z920-x64.msi',
    mode   => '0755',
  }

  windows_package { '7-Zip':
    ensure  => installed,
    name    => '7-Zip 9.20 (x64 edition)',
    source  => 'C:\7z920-x64.msi',
    require => File['C:/7z920-x64.msi'],
  }

}
