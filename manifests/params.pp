# == Class crowd::params
#
# This class is meant to be called from crowd
# It sets variables according to platform
#
class crowd::params {
  $version = '2.7.0'
  $home    = '/home/crowd'

  $permgen_size    = '384m'
  $minimum_memory  = '384m'
  $maximum_memory  = '1024m'

  case $::osfamily {
    'Debian': {
      $package_name = 'crowd'
      $service_name = 'crowd'
    }
    'RedHat', 'Amazon': {
      $package_name = 'crowd'
      $service_name = 'crowd'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
