# AUTH: codenvibes
# DESC: a puppet manifest for Nginx configuration & add 301 redirect on /redirect_me

class nginx_config {

  # 1. Install Nginx package
  package { 'nginx':
    ensure => 'installed',
  }

  # 2. Create the index.html file with "Hello World!" content
  file { '/var/www/html/index.html':
    ensure  => 'file',
    content => 'Hello World!',
  }

  # 3. Configure Nginx with a 301 redirect for /redirect_me
  file { '/etc/nginx/sites-available/default':
    ensure  => 'file',
    content => template('nginx/default.conf.erb'),
    notify  => Service['nginx'],
  }

  # 4. Manage the Nginx service
  service { 'nginx':
    ensure  => 'running',
    enable  => true,
    require => Package['nginx'],
  }
}

server {
  listen 80;
  server_name _;

  root /var/www/html;
  index index.html;

  location /redirect_me {
    return 301 /;
  }
}

