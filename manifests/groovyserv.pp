define gvm::groovyserv(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require gvm::install

  exec { "install-groovyserv-$version":
    command => "bash --login -c 'gvm install groovyserv ${version}'",
    creates => "/Users/${::boxen_user}/.gvm/groovyserv/${version}"
  }

  if($default) {
    exec { "set-groovyserv-default":
      command => "bash --login -c 'gvm default groovyserv ${version}'",
      require => Exec["install-groovyserv-$version"],
    }
  }
}
