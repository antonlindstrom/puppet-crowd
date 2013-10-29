# == Class crowd::install
#
class crowd::install {
  include crowd::params
  include wget
  include java7

  $crowd_version = $crowd::params::version

  file { '/opt':
    ensure => directory,
  }

  wget::fetch { 'download_crowd':
    source      => "http://www.atlassian.com/software/crowd/downloads/binary/atlassian-crowd-${crowd_version}.tar.gz",
    destination => "/opt/atlassian-crowd-${crowd_version}.tar.gz",
    timeout     => 0,
    verbose     => false,
    require     => File['/opt'],
  }

  exec { 'extract_crowd':
    command   => "tar xzf /opt/atlassian-crowd-${crowd_version}.tar.gz",
    cwd       => '/opt',
    path      => '/usr/bin/:/bin/',
    logoutput => true,
    creates   => "/opt/atlassian-crowd-${crowd_version}-standalone",
    require   => Wget::Fetch['download_crowd'],
  }

  file { '/etc/init.d/crowd':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('crowd/crowd-init.erb'),
  }

}
