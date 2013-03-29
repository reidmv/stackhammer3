class profile::ssh::server {
  include openssh
  include openssh::hostkeys
}
