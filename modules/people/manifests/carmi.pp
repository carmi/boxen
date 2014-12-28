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
  include adium

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
}
