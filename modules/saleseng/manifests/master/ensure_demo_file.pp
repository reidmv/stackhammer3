define saleseng::master::ensure_demo_file (
  $install_dir,
  $files,
  $source_bucket
) {
  file { $title:
    path   => "$install_dir/$title",
    ensure => directory,
  }

  saleseng::master::download_file { $files[$title]:
    dir           => $title,
    install_dir   => $install_dir,
    source_bucket => $source_bucket,
  }
}
