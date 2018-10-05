class webserver(
  Hash $websites,
){
  $iis_features = ['Web-WebServer','Web-Scripting-Tools']
  iis_feature { $iis_features:
    ensure => present,
  }
$websites.each |String $website, Hash $attributes| {
    webserver::website { $website:
      * => $attributes,
    }
  }
}
