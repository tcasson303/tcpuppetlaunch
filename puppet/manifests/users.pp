class users {

  user { "tcasson":
    ensure => "present",
    shell => "/bin/bash",
    managehome => true,
  }

}
