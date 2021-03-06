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

  $package = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'zookeeperd',
    default                   => 'zookeeper',
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
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/zookeeper/conf',
    default                   => '/etc/zookeeper',
  }

  $config_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/zookeeper/conf/zoo.cfg',
    default                   => '/etc/zookeeper/zoo.cfg',
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
    /(?i:Debian|Ubuntu|Mint)/ => '/var/lib/zookeeper/data',
    default                   => '/var/lib/zookeeper',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/zookeeper',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/zookeeper/zookeeper.log',
  }

  $config_env_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu:mint)/ => '/etc/zookeeper/conf/environment',
    default                   => '/etc/zookeeper/environment'
  }

  $source_env_file = ''
  $template_env_file = 'zookeeper/environment.erb'

  $config_log_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu:mint)/ => '/etc/zookeeper/conf/log4j.properties',
    default                   => '/etc/zookeeper/log4j.properties'
  }

  $source_log_file = ''
  $template_log_file = 'zookeeper/log4j.properties.erb'

  $config_myid_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu:mint)/ => '/etc/zookeeper/conf/myid',
    default                   => '/etc/zookeeper/myid'
  }

  $source_myid_file = ''
  $template_myid_file = 'zookeeper/myid.erb'

  $myid = ''
  $servers = []
  $log_mode = 'INFO'

  $pre_install_java = true

  $follower_port = '2888'
  $leader_port = '3888'
  $port = '2181'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = 'zookeeper/zoo.cfg.erb'
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
