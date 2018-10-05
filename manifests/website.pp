define webserver::website(
  String $website = $title,
  String $path,
  String $index,
  String $indexname,
){
  file { $path:
    ensure => directory,
  }

  file { $index:
    ensure => file,
    source => "puppet:///modules/webserver/${indexname}",
  }
  
  iis_site { $website:
    ensure          => 'started',
    physicalpath    => $path,
    applicationpool => 'DefaultAppPool',
    require         => File[$path],
    bindings        => [
      {
        'bindinginformation'   => "$website:80:",
        'protocol'             => 'http',
      },
    ]
  }

  host { $website:
    ip => '127.0.0.1',
  }
}
