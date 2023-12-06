# AUTH: codenvibes
# DESC: A Puppet manifest that Configures Nginx with Custom Header.
#       This Puppet manifest updates package information, installs the Nginx package,
#       creates a basic HTML file, configures Nginx to include a custom HTTP header,
#       and ensures the Nginx service is running.

exec { 'apt-update':
  command => '/usr/bin/apt-get -y update',
  path    => ['/usr/bin', '/bin'],
}

package { 'nginx':
  ensure => installed,
}

file { '/var/www/html/index.html':
  content => 'Hello World!',
}

file_line { 'add custom header':
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  line   => "\tadd_header X-Served-By ${hostname};",
  after  => 'server_name _;',
}
