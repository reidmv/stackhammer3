class profile::apache {

  # The main point of having this in a profile is that we have a central point
  # to set the class parameters. Right now we're comfortable with the defaults.
  class { '::apache': }

  include apache::mod::php

}
