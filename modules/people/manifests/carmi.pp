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

  $home_dir = "/Users/${::boxen_user}"
  $dotfiles_dir = "${home_dir}/dotfiles"

  # dotfiles
  repository { $people::carmi::dotfiles_dir:
    source => "${::github_login}/dotfiles-1",
    require => File[$people::carmi::my_dir],
  }

}
