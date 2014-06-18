group { "puppet":
        ensure => "present",
}

class install_ruby{
	include 'rvm'

	rvm_system_ruby {
	  'ruby-1.9':
	    ensure      => 'present',
	    default_use => false,
	    build_opts  => ['--binary'],
	    require => Class['rvm'];
	  'ruby-2.0':
	    ensure      => 'present',
	    default_use => true,
	    require => Class['rvm'];
	}
	
}


exec { "use-ruby":
	command => '/usr/local/rvm/bin/rvm use 2.0.0 && /usr/bin/which ruby',
	require => Class['install_ruby'],
}

include install_ruby
