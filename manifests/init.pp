class webserver {
  # this module will manage my web server

  # file { "C:\\inetpub":
  #  ensure => directory,
  # }
  
 # file { "C:\\Inetpub\\website":
 #   ensure => directory,
 # }

  $folders = ["C:\\Inetpub","C:\\Inetpub\\Website"]

  file { $folders:
    ensure => directory,
  }

  file { "C:\\Inetpub\\website\\index.html":
    ensure => file,
    source => 'puppet:///modules/webserver/index.html',
  }
}
