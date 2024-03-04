# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Configure custom HTTP header in Nginx
file { '/etc/nginx/conf.d/custom_header.conf':
  ensure  => present,
  content => "add_header X-Served-By $::hostname;",
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Restart Nginx service
service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => File['/etc/nginx/conf.d/custom_header.conf'],
}
