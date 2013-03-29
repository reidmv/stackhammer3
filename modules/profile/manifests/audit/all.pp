class profile::audit::all {

  $audit_list = [
    '/etc/passwd',
    '/etc/shadow',
    '/etc/group',
    '/etc/sudoers',
    '/etc/motd',
  ]

  file { $audit_list:
    audit => all,
  }

}
