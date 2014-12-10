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
  include vim
  include iterm2::stable

  include zsh
  include ohmyzsh

  include lastpass

  $home_dir = "/Users/${::boxen_user}"
  $my_dir = "${boxen::config::srcdir}/my"
  $dotfiles_dir = "${my_dir}/dotfiles"

  file { $my_dir:
    owner   => $::boxen_user,
    group   => staff,
    ensure  => directory,
    recurse => true,
  }

  # dotfiles
  repository { $people::carmi::dotfiles_dir:
    source => "${::github_login}/dotfiles-1",
    require => File[$people::carmi::my_dir],
  }

  #exec { "install dotfiles":
  #  provider => shell,
  #  command  => "./script/bootstrap",
  #  cwd      => $people::carmi::dotfiles_dir,
  #  creates  => "${people::carmi::home_dir}/.vimrc",
  #  require  => Repository[$people::carmi::dotfiles_dir],
  #}
}
