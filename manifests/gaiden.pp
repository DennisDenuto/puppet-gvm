define gvm::gaiden(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require gvm::install

  exec { "install-gaiden-$version":
    command => "zsh -c 'source ~/.zshrc;gvm install gaiden ${version}'",
    creates => "/Users/${::boxen_user}/.gvm/gaiden/${version}"
  }

  if($default) {
    exec { "set-gaiden-default":
      command => "zsh -c 'source ~/.zshrc;gvm default gaiden ${version}'",
      require => Exec["install-gaiden-$version"],
    }
  }
}
