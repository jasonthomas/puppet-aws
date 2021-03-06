class audit::aws {
    # remove these before we even start.
    package {
        'pam-1.1.1-10.19.amzn1.i686':
            ensure => absent,
            before => Package['audit-libs-2.2-2.17.amzn1.i686'];
      [
        'audispd-plugins',
        'audit',
        'audit-libs-2.2-2.17.amzn1.i686',
        'audit-libs-python',
      ]:
            ensure => absent,
            before => [ 
                        Package['audispd-mozilla-plugins'],
                        Package['audit_package'],
                        Package['audit-mozilla-libs'],
                        Package['audit-mozilla-libs-python'],
            ];
    }

    package {
        'audit_package':
            ensure => latest,
            name   => audit-mozilla;
        'audispd-mozilla-plugins':
            ensure => latest;
        'audit-mozilla-libs-python':
            ensure => latest;
        'audit-mozilla-libs':
            ensure => latest,
            before => Package['audit_package'];
    }
}
