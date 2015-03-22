define gvm::lazybones(
  $ensure = 'installed',
  $version = $name,
  $default = false
) {
  require gvm::install

  exec { "install-lazybones-$version":
    command => "bash --login -c 'gvm install lazybones ${version}'",
    creates => "/Users/${::boxen_user}/.gvm/lazybones/${version}"
  }

  if($default) {
    exec { "set-lazybones-default":
      command => "bash --login -c 'gvm default lazybones ${version}'",
      require => Exec["install-lazybones-$version"],
    }
  }
}
