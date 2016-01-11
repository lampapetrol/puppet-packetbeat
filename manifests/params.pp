# == Class packetbeat::params
#
# === Parameters
#
# This class does not provide any parameters.

#
# === Examples
#
# This class is not intended to be used directly.
class packetbeat::params {

  $configfile = '/etc/packetbeat/fragment.yml'

  $ensure = 'present'

  $status = 'enabled'

  $config_defaults = {
    interfaces => {
      device => 'any',
      snaplen => 1514,
      type => 'pcap',
      buffer_size_mb => 30
    },
    procs => {
      mysql => {
        process => 'mysqld'
      }
    },
    protocols => {
      dns => {
        ports => [53],
        include_authorities => false,
        include_additionals => false,
        send_request => false,
        send_response => false,
      },
      http => {
        ports => [80,8080,8000,5000,8002],
        hide_keywords => [],
      },
      memcache => {
        ports => [11211],
        parseunknown => false,
        maxvalues => 0,
        maxbytespervalue => 'unlimited',
        udptransactiontimeout => 200
      },
      mysql => {
        ports => [3306]
      },
      pgsql => {
        ports => [5432]
      },
      redis => {
        ports => [6379]
      },
      thrift => {
        ports => [9090]
      },
      mongodb => {
        ports => [27017]
      }
    },
    shipper => {
      name => '',
      tags => [],
      ignore_outgoing => false,
      refresh_topology_freq => 10,
      topology_expire => 15,
      geoip => {
        enabled => false,
        paths => []
      }
    },
    output => {
      elasticsearch => {
        enabled => false
      },
      logstash => {
        enabled => false,
        hosts => ['localhost:5044'],
        worker => 1,
        loadbalance => false,
        index => 'packetbeat',
        tls => {
          enabled => false,
          certificate_authorities => [],
          certificate => '',
          certificate_key => '',
          insecure => false,
          cipher_suites => [],
          curve_types => []
        }
      },
      file => {
        enabled => false
      },
      console => {
        enabled => false,
        pretty => false
      }
    },
    shipper => {
      name => '',
      tags => [],
      ignore_outgoing => false,
      refresh_topology_freq => 10,
      topology_expire => 15,
      geoip => {
        enabled => false,
        paths => []
      }
    },
    logging => {
      level => 'error'
    }
  }

    $protocols = {
        dns => {
            ports => [53],
            include_authorities => false,
            include_additionals => false,
            send_request => false,
            send_response => false,
        },
        http => {
            ports => [80,8080,8000,5000,8002],
            hide_keywords => [],
        },
        memcache => {
            ports => [11211],
            parseunknown => false,
            maxvalues => 0,
            maxbytespervalue => 'unlimited',
            udptransactiontimeout => 200
        },
        mysql => {
            ports => [3306]
        },
        pgsql => {
            ports => [5432]
        },
        redis => {
            ports => [6379]
        },
        thrift => {
            ports => [9090]
        },
        mongodb => {
            ports => [27017]
        }
    }

  $procs = {
    mysqld => {
      process => 'mysqld',
      cmdline_grep => 'mysqld'
    },
    pgsql => {
      process => 'pgsql',
      cmdline_grep => 'postgres'
    },
    nginx => {
      process => 'nginx',
      cmdline_grep => 'nginx'
    }
  }
}