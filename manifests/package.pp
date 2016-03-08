#
class packetbeat::package (
  $ensure = $packetbeat::ensure
) {

  package { 'packetbeat':
    ensure => $ensure
  }
}
