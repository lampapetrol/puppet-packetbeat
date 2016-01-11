#
define packetbeat::proc (
    $process = undef,
    $cmdline_grep = undef
) {
    $defaults = $packetbeat::params::procs

    if ($process == undef) {
        if (has_key($defaults, $name)) {
            $proc = $defaults[$name]['process']
        }
        else {
            fail("\"${name}\" is not a valid process")
        }
    }
    else {
        $proc = $process
    }

    if ($cmdline_grep == undef) {
        if (has_key($defaults, $name)) {
            $grep = $defaults[$name]['cmdline_grep']
        }
        else {
            fail("\"${name}\" is not a valid process")
        }
    }
    else {
        $grep = $process
    }

    concat::fragment { "procs_$name":
        target => $packetbeat::params::configfile,
        order => 91,
        content => "    - process: ${proc}\n      cmdline_grep: ${grep}\n"
    }
}