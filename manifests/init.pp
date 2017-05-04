class openresty {

# install dependency packages
package { ['readline-devel','pcre-devel','openssl-devel','gcc','curl','make','patch','wget','gcc-c++']:
  ensure  => installed,
  before  => File['install_script'],
}

# copy install script
file { 'install_script':
  source => 'puppet:///modules/openresty/install_openresty.sh',
  path    => '/tmp/install_openresty.sh',
  ensure  => file,
  owner   => 'root',
  group   => 'root',
  mode    => 0755,
}

# Execute the install script if openresty binary is not already existing
exec { 'sh /tmp/install_openresty.sh':
  creates => '/usr/local/openresty/bin/openresty',
  path    => ['/usr/bin', '/bin', '/sbin'],
  require => File['install_script'],
}

}
