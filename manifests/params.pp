# Class: zookeeper::params
#
# This class defines default parameters used by the main module class zookeeper
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to zookeeper class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class zookeeper::params {

  ### Application related parameters

  $pre_install_java = true

  $package = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'zookeeperd',
    default => 'zookeeperd',
  }

  $service = $::operatingsystem ? {
    default => 'zookeeper',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'java',
  }

  $process_args = $::operatingsystem ? {
    default => 'zookeeper',
  }

  $process_user = $::operatingsystem ? {
    default => 'zookeeper',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/zookeeper/conf',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/zookeeper/conf/zoo.cfg',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/zookeeper',
    default                   => '/etc/sysconfig/zookeeper',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/zookeeper.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/var/lib/zookeeper/',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/zookeeper',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/zookeeper/zookeeper.log',
  }

  $port = '2181'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
