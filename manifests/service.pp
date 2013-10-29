# == Class crowd::service
#
# This class is meant to be called from crowd
# It ensure the service is running
#
class crowd::service {
  include crowd::params

  service { $crowd::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
