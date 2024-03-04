# 2-puppet_custom_http_response_header.pp
class { 'nginx':
  service_ensure => 'running',
  service_enable => true,
}

file { '/etc/nginx/conf.d/custom_headers.conf':
  ensure => 'file',
  content => "add_header X-Served-By $::hostname;",
  require => Class['nginx'],
  notify => Service['nginx'],
}
