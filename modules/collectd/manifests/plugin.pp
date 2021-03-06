define collectd::plugin(
  $package = false,
  $collectd_args = undef
){
  include collectd

  $include_dir = '/etc/collectd.d'

  if $package {
      package {
        "collectd-${name}":
            ensure => latest;
      }
  }

  file {
    "${include_dir}/${name}.conf":
        ensure      => present,
        content     => template("collectd/collectd.d/${name}.conf.erb"),
        notify      => Service['collectd'],
        require     => $package ? {
            true    => [Package["collectd-${name}"]],
            default => [],
        };
  }

}
