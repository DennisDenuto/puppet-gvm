define gvm::lazybones(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require gvm::install

  exec { "install-lazybones-$version":
    command => "zsh -c 'source ~/.zshrc;gvm install lazybones ${version}'",
    creates => "/Users/${::boxen_user}/.gvm/lazybones/${version}"
  }

  if($default) {
    exec { "set-lazybones-default":
      command => "zsh -c 'source ~/.zshrc;gvm default lazybones ${version}'",
      require => Exec["install-lazybones-$version"],
    }
  }
}
