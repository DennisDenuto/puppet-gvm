define gvm::griffon(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require gvm::install

  exec { "install-griffon-$version":
    command => "bash --login -c 'gvm install griffon ${version}'",
    creates => "/Users/${::boxen_user}/.gvm/griffon/${version}"
  }

  if($default) {
    exec { "set-griffon-default":
      command => "bash --login -c 'gvm default griffon ${version}'",
      require => Exec["install-griffon-$version"],
    }
  }
}
