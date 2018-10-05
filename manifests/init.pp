class webserver {
  # this module will manage my web server

  file { "C:\\Inetpub\\website":
    ensure => directory,
  }

  file { "C:\\Inetpub\\website\\index.html":
    ensure => file,
    source => 'puppet:///modules/webserver/index.html',
  }
}
