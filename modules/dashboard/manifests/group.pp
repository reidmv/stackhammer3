define dashboard::group (
  $ensure     = present,
  $classes    = [],
  $parameters = [],
) {

  Exec {
    cwd  => '/opt/puppet/share/puppet-dashboard',
    path => '/opt/puppet/bin:/usr/bin:/bin',
  }

  $opts = "RAILS_ENV=production"

  case $ensure {
    present: {
      exec { "dashboard_group_create_${title}":
        command => "rake nodegroup:add name='${name}' ${opts}",
        unless  => "rake nodegroup:list ${opts} | grep -e '^${name}\$'",
      }

      $classes_with_group_prefix = prefix($classes, "${name}###")
      dashboard::group::class { $classes_with_group_prefix:
        require => Exec["dashboard_group_create_${title}"],
      }

      # The below is a hack due to there not being a way to check current
      # param values using Rake
      $parameters_joined = join($parameters, ',')
      $parameters_opts   = "name='${name}' parameters=${parameters_joined}"
      exec { "dashboard_group_parameters_${title}":
        command => "rake nodegroup:parameters ${parameters_opts} ${opts}",
        unless  => "rake nodegroup:parameters ${parameters_opts} ${opts}",
      }
      
    }
    absent: {
      exec { "dashboard_group_destroy_${title}":
        command => "rake nodegroup:del name='${name}' ${opts}",
        onlyif  => "rake nodegroup:list ${opts} | grep -e '^${name}\$'",
      }
    }
    default: {
      fail("ensure must be the keyword present or the keyword absent")
    }
  }


}
