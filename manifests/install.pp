class gvm::install(
  $ensure = $gvm::install::ensure,
  $prefix = $gvm::install::prefix,
  $user   = $gvm::install::user,
) {
  exec { 'selfupdate-gvm':
    command => "zsh -c 'source ~/.zshrc;gvm selfupdate'",
    onlyif  => "test -e /Users/${::boxen_user}/.gvm/etc/config",
    require => Exec['install-gvm'],
  }

  exec { 'install-gvm':
    command => "curl -s get.gvmtool.net | bash",
    creates => "/Users/${::boxen_user}/.gvm/etc/config",
  }
}
