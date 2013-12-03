# Atlassian Crowd

[![Build Status](https://travis-ci.org/antonlindstrom/puppet-crowd.png)](https://travis-ci.org/antonlindstrom/puppet-crowd)

Puppet module for [Atlassian Crowd](https://www.atlassian.com/software/crowd).

Installs a basic Crowd standalone installation in `/opt` and starts it.

NOTE: This has never been used in production.

## Example usage

Include with default parameters:

    include crowd

Set max, min and permgen memory sizes:

    class { 'crowd':
      minimum_memory => '512m',
      maximum_memory => '512m',
      permgen_size   => '2048m',
    }

Set JVM options for crowd:

    class { 'crowd':
      jvm_options => '-Djava.net.preferIPv4Stack=true',
    }

## License

See [LICENSE](LICENSE) file.
