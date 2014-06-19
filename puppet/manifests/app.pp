class requirements {
  group { "puppet": ensure => "present", }
  exec { "apt-update":
    command => "/usr/bin/apt-get -y update"
  }

  package {
    ["mysql-client", "mysql-server", "libmysqlclient-dev"]: 
      ensure => installed, require => Exec['apt-update']
  }

  include nodejs
}

class installrvm {
  include rvm
  rvm::system_user { vagrant: ; }

  rvm_system_ruby {
	  'ruby-1.9':
	    ensure      => 'present',
	    default_use => true;
	  'ruby-2.0':
	    ensure      => 'present',
	    default_use => false;
   }

   rvm_gem {
	  'bundler':
	    name         => 'bundler',
	    ruby_version => 'ruby-1.9.3-p547',
	    ensure       => 'present',
	    require      => Rvm_system_ruby['ruby-1.9'];
	  'rails':
	    name         => 'rails',
	    ruby_version => 'ruby-1.9.3-p547',
	    ensure       => 'present',
	    require      => Rvm_system_ruby['ruby-1.9'];
	}
}

include requirements
include installrvm