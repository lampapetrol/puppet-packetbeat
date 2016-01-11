#
class packetbeat::package (
  $ensure = $packatbeat::ensure
) {

  package { 'packetbeat':
    ensure => $ensure
  }
}