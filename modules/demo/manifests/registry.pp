class demo::registry {

  registry_key { 'HKEY_LOCAL_MACHINE\Software\Demonstration':
    ensure       => present,
    purge_values => true,
  }

  registry_value { 'HKEY_LOCAL_MACHINE\Software\Demonstration\value1':
    type => string,
    data => 'this is a value',
  }

  registry_value { 'HKEY_LOCAL_MACHINE\Software\Demonstration\value2':
    type         => dword,
    data         => '0xFFFFFFFF',
  }

  registry_value { 'HKLM\Software\Demonstration\value3':
    ensure => present,
    type   => array,
    data   => [ 0, 'zero', '0', 123456, 'two' ],
  }

}
