define gvm::springboot(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require gvm::install

  exec { "install-springboot-$version":
    command => "zsh -c 'source ~/.zshrc;gvm install springboot ${version}'",
    creates => "/Users/${::boxen_user}/.gvm/springboot/${version}"
  }

  if($default) {
    exec { "set-springboot-default":
      command => "zsh -c 'source ~/.zshrc;gvm default springboot ${version}'",
      require => Exec["install-springboot-$version"],
    }
  }
}
