#
# Note: this class requires that the MS SQL Server 2008 installation media
#       be mounted on the target agent.
#
class profile::example::mssql_installed {

  class { '::mssql':
    media          => 'D:\\',
    instancename   => 'MSSQLSERVER',
    features       => 'SQL,AS,RS,IS',
    agtsvcaccount  => 'SQLAGTSVC',
    agtsvcpassword => 'Puppet0',
    assvcaccount   => 'SQLASSVC',
    assvcpassword  => 'Puppet0',
    rssvcaccount   => 'SQLRSSVC',
    rssvcpassword  => 'Puppet0',
    sqlsvcaccount  => 'SQLSVC',
    sqlsvcpassword => 'Puppet0',
  }

}
