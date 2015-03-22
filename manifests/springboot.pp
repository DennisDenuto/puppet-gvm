define gvm::springboot(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require gvm::install

  exec { "install-springboot-$version":
    command => "bash --login -c 'gvm install springboot ${version}'",
    creates => "/Users/${::boxen_user}/.gvm/springboot/${version}"
  }

  if($default) {
    exec { "set-springboot-default":
      command => "bash --login -c 'gvm default springboot ${version}'",
      require => Exec["install-springboot-$version"],
    }
  }
}
