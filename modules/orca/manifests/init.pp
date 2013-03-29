# Example values:
#
# $orca_version = '3.0.3790'
# $orca_packagecode = 'EEA0D94C-1C1C-426D-9D8B-F61FA06A2DAF'
#
# $orca_version = '5.0.7069'
# $orca_packagecode = 'D3EDC709-C102-914A-30C7-782286D3B068'
#
class orca (
  $orca_version = pick($::orca_version, '3.0.3790'),
  $orca_packagecode = pick($::orca_packagecode, 'EEA0D94C-1C1C-426D-9D8B-F61FA06A2DAF')
) {

  file { "c:/packages":
    ensure => directory
  }

  file { "c:/packages/orca-${orca_version}.msi":
    ensure => present,
    source => "puppet:///files/orca/orca-${orca_version}.msi",
  }

  package { "{${orca_packagecode}}":
    ensure          => installed,
    source          => "c:\\packages\\orca-${orca_version}.msi",
    install_options => { 'INSTALLDIR' => 'C:\orca' },
    require         => File["c:/packages/orca-${orca_version}.msi"],
  }

}
