class requirements {
  group { "puppet": ensure => "present", }


  package {
    ["mysql-client", "mysql-server", "libmysqlclient-dev", "git"]: 
      ensure => installed
  }

  
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

class ror_requirements {
	include nodejs
}

include requirements
include installrvm
include ror_requirements