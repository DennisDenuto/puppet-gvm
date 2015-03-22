define gvm::groovy(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require gvm::install

  exec { "install-groovy-$version":
  	command => "zsh -c 'source ~/.zshrc;gvm install groovy ${version}'",
  	creates => "/Users/${::boxen_user}/.gvm/groovy/${version}"
  }

  if($default) {
    exec { "set-groovy-default":
      command => "zsh -c 'source ~/.zshrc;gvm default groovy ${version}'",
      require => Exec["install-groovy-$version"],
    }
  }
}
