class mymodule{
  class { 'apache': }
    apache::vhost { 'localhost':
    port    => '80',
    docroot => '/var/www/html'
  }

  package { 'unzip':
    ensure => 'installed'
  }

  file { "/var/www/html/infinite_scroll.zip" :
    source  => "puppet:///modules/mymodule/infinite_scroll.zip",
    notify  => Exec["extract_test_file"],
  }

  exec { "extract_test_file":
    refreshonly => true,
    command     => "/usr/bin/unzip /var/www/html/infinite_scroll.zip -d /var/www/html/",
  }
}

