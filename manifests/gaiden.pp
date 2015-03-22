define gvm::gaiden(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require gvm::install

  exec { "install-gaiden-$version":
    command => "bash --login -c 'gvm install gaiden ${version}'",
    creates => "/Users/${::boxen_user}/.gvm/gaiden/${version}"
  }

  if($default) {
    exec { "set-gaiden-default":
      command => "bash --login -c 'gvm default gaiden ${version}'",
      require => Exec["install-gaiden-$version"],
    }
  }
}
