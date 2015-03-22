define gvm::vertx(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require gvm::install

  exec { "install-vertx-$version":
    command => "zsh -c 'source ~/.zshrc;gvm install vertx ${version}'",
    creates => "/Users/${::boxen_user}/.gvm/vertx/${version}"
  }

  if($default) {
    exec { "set-vertx-default":
      command => "zsh -c 'source ~/.zshrc;gvm default vertx ${version}'",
      require => Exec["install-vertx-$version"],
    }
  }
}
