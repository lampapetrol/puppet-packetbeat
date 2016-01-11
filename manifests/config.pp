#
class packetbeat::config (
){

    concat { $packetbeat::params::configfile: 
    }

    concat::fragment { "procs_header":
        target => $packetbeat::params::configfile,
        order => 90,
        content => "procs\n  enabled: true\n  monitored:\n"
    }

}