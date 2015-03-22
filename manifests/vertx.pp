define gvm::vertx(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require gvm::install

  exec { "install-vertx-$version":
    command => "bash --login -c 'gvm install vertx ${version}'",
    creates => "/Users/${::boxen_user}/.gvm/vertx/${version}"
  }

  if($default) {
    exec { "set-vertx-default":
      command => "bash --login -c 'gvm default vertx ${version}'",
      require => Exec["install-vertx-$version"],
    }
  }
}
