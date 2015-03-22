define gvm::grails(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require gvm::install

  exec { "install-grails-$version":
  	command => "zsh -c 'source ~/.zshrc;gvm install grails ${version}'",
  	creates => "/Users/${::boxen_user}/.gvm/grails/${version}"
  }

  if($default) {
    exec { "set-grails-default":
      command => "zsh -c 'source ~/.zshrc;gvm default grails ${version}'",
    }
  }
}
