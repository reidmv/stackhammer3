class saleseng::master::files {
  $source_bucket = 'saleseng/files'
  $install_dir = '/files'

  $file_directories = [
    'demo',
    'orca',
    'pe',
    'splunk',
    'tomcat',
    '7zip',
    'dotnetcms',
  ]

  $files = {
    'demo' => [
      'wordpress-3.4.1.tar.gz',
    ],
    'orca' => [
      'orca-3.0.3790.msi',
      'orca-5.0.7069.msi',
    ],
    'pe' => [
      'puppet-enterprise-2.5.2-all.tar.gz',
    ],
    'solaris' => [
      'ASlibiconv-1.12.pkg',
      'GNUbase.pkg',
    ],
    'splunk' => [
      'splunk-4.3.2-123586-linux-2.6-amd64.deb',
      'splunk-4.3.2-123586-linux-2.6-intel.deb',
      'splunk-4.3.2-123586-linux-2.6-x86_64.rpm',
      'splunk-4.3.2-123586-solaris-9-intel.pkg',
      'splunk-4.3.2-123586-x64-release.msi',
      'splunk-4.3.2-123586-x86-release.msi',
      'splunk-4.3.2-123586.i386.rpm',
      'splunkforwarder-4.3.2-123586-linux-2.6-amd64.deb',
      'splunkforwarder-4.3.2-123586-linux-2.6-intel.deb',
      'splunkforwarder-4.3.2-123586-linux-2.6-x86_64.rpm',
      'splunkforwarder-4.3.2-123586-solaris-9-intel.pkg',
      'splunkforwarder-4.3.2-123586-x64-release.msi',
      'splunkforwarder-4.3.2-123586-x86-release.msi',
      'splunkforwarder-4.3.2-123586.i386.rpm',
    ],
    'tomcat' => [
      'apache-tomcat-5.5.30.tar.gz',
      'apache-tomcat-6.0.35.tar.gz',
      'apache-tomcat-7.0.25.tar.gz',
      'jdk-6u21-linux-i586-rpm.bin',
      'jdk-6u27-linux-x64-rpm.bin',
      'jenkins-1.400.war',
      'jenkins-1.449.war',
    ],
    '7zip' => [
      '7z920-x64.msi',
    ],
    'dotnetcms' => [
      'CMS4.06.zip',
      'dotNetFx40_Full_x86_x64.exe',
    ],
  }

  case $::virtual {
    default: { }
    'virtualbox': {
      mount { '/files':
        ensure  => mounted,
        fstype  => 'vboxsf',
        device  => 'files',
        options => 'defaults',
        require => File[$install_dir],
        before  => Saleseng::Master::Ensure_demo_file[$file_directories],
      }
    }
  }

  file { $install_dir:
    ensure => directory,
  }

  saleseng::master::ensure_demo_file { $file_directories:
    install_dir   => $install_dir,
    source_bucket => $source_bucket,
    files         => $files,
  }
}
