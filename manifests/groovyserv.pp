define gvm::groovyserv(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require gvm::install

  exec { "install-groovyserv-$version":
    command => "zsh -c 'source ~/.zshrc;gvm install groovyserv ${version}'",
    creates => "/Users/${::boxen_user}/.gvm/groovyserv/${version}"
  }

  if($default) {
    exec { "set-groovyserv-default":
      command => "zsh -c 'source ~/.zshrc;gvm default groovyserv ${version}'",
      require => Exec["install-groovyserv-$version"],
    }
  }
}
