define saleseng::master::download_file (
  $dir,
  $source_bucket,
  $install_dir
) {
  s3file { "${install_dir}/${dir}/${title}":
    source  => "${source_bucket}/${dir}/${title}",
    ensure  => latest,
    require => File["${install_dir}/${dir}"],
  }
}
