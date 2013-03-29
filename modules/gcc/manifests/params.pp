class gcc::params {
  case $::osfamily {
    RedHat: {
      if $::operatingsystemrelease >= '6' {
	if $::architecture == 'x86_64' {
          $gcc_name = ['gcc', 'glibc-devel.i686', 'libgcc.i686', 'libstdc++-devel.i686', 'glibc-devel.x86_64']
        } else {
          $gcc_name = ['gcc', 'glibc-devel.i686', 'libgcc.i686', 'libstdc++-devel.i686']
        }
      } else {
        $gcc_name = ['glibc-devel', 'gcc']
      }
    }
    default: { fail('Only RedHat Family Operating Systems supported with gcc class!') }
  }
}
