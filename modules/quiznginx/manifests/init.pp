class quiznginx{
    package { 'nginx':
    ensure => latest
  }
  service { 'nginx':
    ensure => running,
    enable => true,
    require => Package['nginx']
  }

  package { 'unzip':
    ensure => 'installed'
  }

  file { "/usr/share/nginx/html/infinite_scroll.zip" :
    source  => "puppet:///modules/quiznginx/infinite_scroll.zip",
    notify  => Exec["extract_test_file"],
  }

  exec { "extract_test_file":
    refreshonly => true,
    command     => "/usr/bin/unzip /usr/share/nginx/html/infinite_scroll.zip -d /usr/share/nginx/html/",
  }
}

