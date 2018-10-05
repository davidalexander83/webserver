class webserver(
  Hash $websites,
){

  $folders = ["C:\\Inetpub"]

  file { 'C:/Inetpub':
    ensure => directory,
  }

  $iis_features = ['Web-WebServer','Web-Scripting-Tools']

  iis_feature { $iis_features:
    ensure => present,
  }

  # Delete the default website to prevent a port binding conflict.
  iis_site { 'Default Web Site':
    ensure  => absent,
    require => Iis_feature['Web-WebServer'],
  }

$websites.each |String $website, Hash $attributes| {
    webserver::website { $website:
      * => $attributes,
    }
  }
}
