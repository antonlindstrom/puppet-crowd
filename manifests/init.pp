# == Class: crowd
#
# Full description of class crowd here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class crowd (
  $minimum_memory = $crowd::params::minimum_memory,
  $maximum_memory = $crowd::params::maximum_memory,
  $permgen_size   = $crowd::params::permgen_size,
  $jvm_options    = undef
) inherits crowd::params {

  # validate parameters here

  anchor { 'crowd::begin': } ->
  class { 'crowd::install': } ->
  class { 'crowd::config': }
  class { 'crowd::service': } ->
  anchor { 'crowd::end': }

  Anchor['crowd::begin']  ~> Class['crowd::service']
  Class['crowd::install'] ~> Class['crowd::service']
  Class['crowd::config']  ~> Class['crowd::service']
}
