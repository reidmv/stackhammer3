class splunk inherits splunk::params {
  case $::kernel {
    /(?i)linux/: { include "splunk::linux_forwarder" }
    /(?i)sunos/: { include "splunk::solaris_forwarder" }
    /(?i)windows/: { 
      include "splunk::windows_forwarder" 
      Exec {
        path => "${::path};C:\\Program Files\\Splunk\\bin",
      }
    }
  }
}
