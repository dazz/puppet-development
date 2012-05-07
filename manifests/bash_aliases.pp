class development::bash_aliases {
  
  
  $git_project_url = 'https://github.com/dazz/dazs-bash_aliases'
  
  $file            = '.bash_aliases'
  $tmp_dir         = '/home/vagrant/bash_aliases'
  $taget_dir       = '/home/vagrant'
  
  # download .bash_aliases from github
  exec { "download_bash_aliases":
    command => "git clone ${git_project_url} bash_aliases",
    require => Package["git-core"],
    cwd => '/home/vagrant/',
    creates => "${tmp_dir}/${file}",
  }
  
  # copy .bash_aliases to /home/vagrant/.bash_aliases
  exec { "copy_bash_aliases":
    command => "cp ${tmp_dir}/${file} ${taget_dir}/${file}"
  }
  
  # remove tmp dir
  exec { "remove_old_checkout_dir":
    command => "rm -Rf ${tmp_dir}"
  }
}