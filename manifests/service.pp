#
class packetbeat::service (
  $ensure             = $packetbeat::ensure
){
  
  service { 'packetbeat':
    enable => true,
    ensure => 'running'
  }
  
}