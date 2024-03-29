# AUTH: codenvibes
# DESC: A Puppet manifest that Configures Nginx with Custom Header.
#       This Puppet manifest updates package information, installs the Nginx package,
#       creates a basic HTML file, configures Nginx to include a custom HTTP header,
#       and ensures the Nginx service is running.

# Update package information using apt-get
exec { 'apt-update':
  command => '/usr/bin/apt-get -y update',
  path    => ['/usr/bin', '/bin'],
}

# Ensure that Nginx package is installed
package { 'nginx':
  ensure => installed,
}

# Create a basic HTML file
file { '/var/www/html/index.html':
  content => 'Hello World!',
}

# Add a custom HTTP header configuration to Nginx
file_line { 'add custom header':
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  line   => "\tadd_header X-Served-By ${hostname};",
  after  => 'server_name _;',
}

# Ensure Nginx service is running
service { 'nginx':
  ensure => running,
}
