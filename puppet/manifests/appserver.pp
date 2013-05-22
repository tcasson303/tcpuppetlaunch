#puppet essential... 
group { 'puppet': ensure => 'present' }

#global path def.
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] } 

class app {

  exec { "update_package_list":
    user    => "vagrant",
    command => "/usr/bin/sudo /usr/bin/apt-get update",
  }

  package {
    [ "ntp", "git-core" ] :
      ensure => present
  }

  rvm::install {
    #for user
    'tcasson' : ;
  }

}

require users
require rvm
require app
