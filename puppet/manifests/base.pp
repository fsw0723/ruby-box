

class requirements {
  
  group { "puppet": ensure => "present", }
  exec { "apt-update":
    command => "/usr/bin/apt-get -y update"
  }

  package { 'curl':
    ensure => installed
  }

  exec { 'install_rvm':
    command => "/usr/bin/curl -L https://get.rvm.io | bash -s stable",
    creates => "${home}/.rvm/bin/rvm",
    require => Package['curl']
  }

  exec { 'install_ruby':
    command => "/usr/local/rvm/bin/rvm install 2.0.0",
    creates => "${home}/.rvm/bin/ruby",
    require => Exec['install_rvm']
  }

  exec { 'install_bundler': 
    command => "gem install bundler",
    creates => "${home}/.rvm/bin/bundle",
    require => Exec['install_ruby']
  }


  exec { 'use_ruby':
      command => "rvm use 2.0.0",
      require => Exec['install_ruby']
  }


  package {
    ["mysql-client", "mysql-server", "libmysqlclient-dev"]: 
      ensure => installed, require => Exec['apt-update']
  }
}


class doinstall {
  class { requirements:}
}

include doinstall