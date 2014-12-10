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


  # dotfiles
  repository { $people::carmi::config::dotfiles_dir:
    source => "${::github_login}/dotfiles-1",
    require => File[$people::carmi::config::my_dir],
  }

  exec { "install dotfiles":
    provider => shell,
    command  => "./script/bootstrap",
    cwd      => $people::carmi::config::dotfiles_dir,
    creates  => "${people::carmi::config::home_dir}/.zshrc",
    require  => Repository[$people::carmi::config::dotfiles_dir],
  }
}
