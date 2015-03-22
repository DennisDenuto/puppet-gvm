define gvm::gradle(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require gvm::install

  exec { "install-gradle-$version":
    command => "zsh -c 'source ~/.zshrc;gvm install gradle ${version}'",
    creates => "/Users/${::boxen_user}/.gvm/gradle/${version}"
  }

  if($default) {
    exec { "set-gradle-default":
      command => "zsh -c 'source ~/.zshrc;gvm default gradle ${version}'",
      require => Exec["install-gradle-$version"],
    }
  }
}
