define gvm::gradle(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require gvm::install

  exec { "install-gradle-$version":
    command => "bash --login -c 'gvm install gradle ${version}'",
    creates => "/Users/${::boxen_user}/.gvm/gradle/${version}"
  }

  if($default) {
    exec { "set-gradle-default":
      command => "bash --login -c 'gvm default gradle ${version}'",
      require => Exec["install-gradle-$version"],
    }
  }
}
