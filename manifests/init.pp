
class development {

  # install my .bash_aliases
  include development::bash_aliases
  
  package{ "install_midnightcommander":
    ensure => "installed",
    require => Package["mc"],
  }
  
}
