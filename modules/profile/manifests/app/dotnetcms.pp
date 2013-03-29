class profile::app::dotnetcms {

  require profile::iis
  include 7zip

  file { 'C:/dotNetFx40_Full_x86_x64.exe':
    ensure => file,
    source => 'puppet:///files/dotnetcms/dotNetFx40_Full_x86_x64.exe',
    mode   => '0755',
    before => Windows_package['Microsoft .NET Framework 4 Client Profile'],
  }

  windows_package { 'Microsoft .NET Framework 4 Client Profile':
    ensure          => installed,
    source          => 'C:/dotNetFx40_Full_x86_x64.exe',
    install_options => ['/q', '/norestart'],
    before          => Exec['extract_cms4'],
    notify          => Exec['register_net_with_iis'],
  }

  exec { 'register_net_with_iis':
    command     => 'C:\Windows\Microsoft.NET\Framework64\v4.0.30319\aspnet_regiis.exe -i',
    refreshonly => true,
  }

  file { 'C:/CMS4.06.zip':
    ensure => file,
    source => 'puppet:///files/dotnetcms/CMS4.06.zip',
    notify => Exec['extract_cms4'],
  }

  exec { 'extract_cms4':
    path        => [$::path, 'C:\Program Files\7-Zip'],
    command     => '7z.exe x C:\CMS4.06.zip -oC:\cms4app',
    require     => Class['7zip'],
    refreshonly => true,
  }

  iis_apppool { 'CMS4':
    ensure                => present,
    startmode             => 'AlwaysRunning',
    managedpipelinemode   => 'Integrated',
    managedruntimeversion => 'v4.0',
    require               => Exec['extract_cms4'],
  }

  iis_site {'CMS4':
    ensure          => present,
    serverautostart => true,
    bindings        => ['http/*:80:'],
    require         => Exec['extract_cms4'],
  }

  iis_app {'CMS4/':
    ensure          => present,
    applicationpool => 'CMS4',
    require         => Exec['extract_cms4'],
  }

  iis_vdir {'CMS4/':
    ensure       => present,
    iis_app      => 'CMS4/',
    physicalpath => 'c:\cms4app\CMS',
    require      => Exec['extract_cms4'],
  }

}
