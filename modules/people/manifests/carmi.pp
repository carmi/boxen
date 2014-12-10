class people::carmi {

  # personal applications
  include skype
  include dropbox

  include chrome
  include firefox

  include vlc

  include virtualbox
  include vagrant

  include clipmenu
  include spectacle

  include flux

  include charles

  include macvim
  include iterm2::stable

  include zsh
  include ohmyzsh

  include lastpass

  $home     = "/Users/${::boxen_user}"
  $my       = "${home}/my"
  $dotfiles = "${my}/dotfiles"

  file { $my:
    ensure  => directory
  }

  repository { $dotfiles:
    source => "${::github_user}/dotfiles-1"
    require => File[$my]
  }
}
