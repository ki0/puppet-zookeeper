# = Class: zookeeper
#
# This is the main zookeeper class
#
#
# == Parameters
# Module's specific variables
#
# [*config_env_file*]
#   Path to the environment file
#
# [*source_env_file*]
#   Custom source file for env.sh
#
# [*template_env_file*]
#   Custom template file for env.sh
#
# [*log_mode*]
#   Logging mode: info, debug or trace (default: info)
#
# [*config_log_file*]
#   Path to the environment file
#
# [*source_log_file*]
#   Custom source file for env.sh
#
# [*template_log_file*]
#   Custom template file for env.sh
#
# [*pre_install_java*]
#   Include java module for install
#
# [*servers*]
#   List of servers for Zookeeper cluster
#
# [*myid*]
#   Zookeeper instance id between 1 to 255
#
# [*source_myid_file*]
#   Custom source file for myid file
#
# [*template_myid_file*]
#   Custom template file for generated myid file
#
# [*follower_port*]
#   Port used by followers to connect to the leader.
#
# [*leader_port*]
#   Port for leader election.
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, zookeeper class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $zookeeper_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, zookeeper main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $zookeeper_source
#
# [*source_dir*]
#   If defined, the whole zookeeper configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $zookeeper_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $zookeeper_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, zookeeper main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $zookeeper_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $zookeeper_options
#
# [*service_autorestart*]
#   Automatically restarts the zookeeper service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $zookeeper_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $zookeeper_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $zookeeper_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $zookeeper_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for zookeeper checks
#   Can be defined also by the (top scope) variables $zookeeper_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $zookeeper_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $zookeeper_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $zookeeper_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $zookeeper_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for zookeeper port(s)
#   Can be defined also by the (top scope) variables $zookeeper_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling zookeeper. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $zookeeper_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $zookeeper_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $zookeeper_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $zookeeper_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: false
#
# Default class params - As defined in zookeeper::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of zookeeper package
#
# [*service*]
#   The name of zookeeper service
#
# [*service_status*]
#   If the zookeeper service init script supports status argument
#
# [*process*]
#   The name of zookeeper process
#
# [*process_args*]
#   The name of zookeeper arguments. Used by puppi and monitor.
#   Used only in case the zookeeper process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user zookeeper runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $zookeeper_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $zookeeper_protocol
#
#
# See README for usage patterns.
#

class zookeeper (
  $config_env_file       = params_lookup( 'config_env_file' ),
  $source_env_file       = params_lookup( 'source_env_file' ),
  $template_env_file     = params_lookup( 'template_env_file'),
  $log_mode              = params_lookup( 'log_mode' ),
  $config_log_file       = params_lookup( 'config_log_file' ),
  $source_log_file       = params_lookup( 'source_log_file' ),
  $template_log_file     = params_lookup( 'template_log_file' ),
  $pre_install_java      = params_lookup( 'pre_install_java' ),
  $servers               = params_lookup( 'servers' ),
  $myid                  = params_lookup( 'myid'),
  $source_myid_file      = params_lookup( 'source_myid_file' ),
  $template_myid_file    = params_lookup( 'template_myid_file' ),
  $follower_port         = params_lookup( 'follower_port' ),
  $leader_port           = params_lookup( 'leader_port' ),
  $my_class              = params_lookup( 'my_class' ),
  $source                = params_lookup( 'source' ),
  $source_dir            = params_lookup( 'source_dir' ),
  $source_dir_purge      = params_lookup( 'source_dir_purge' ),
  $template              = params_lookup( 'template' ),
  $service_autorestart   = params_lookup( 'service_autorestart' , 'global' ),
  $options               = params_lookup( 'options' ),
  $version               = params_lookup( 'version' ),
  $absent                = params_lookup( 'absent' ),
  $disable               = params_lookup( 'disable' ),
  $disableboot           = params_lookup( 'disableboot' ),
  $monitor               = params_lookup( 'monitor' , 'global' ),
  $monitor_tool          = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target        = params_lookup( 'monitor_target' , 'global' ),
  $puppi                 = params_lookup( 'puppi' , 'global' ),
  $puppi_helper          = params_lookup( 'puppi_helper' , 'global' ),
  $firewall              = params_lookup( 'firewall' , 'global' ),
  $firewall_tool         = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src          = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst          = params_lookup( 'firewall_dst' , 'global' ),
  $debug                 = params_lookup( 'debug' , 'global' ),
  $audit_only            = params_lookup( 'audit_only' , 'global' ),
  $noops                 = params_lookup( 'noops' ),
  $package               = params_lookup( 'package' ),
  $service               = params_lookup( 'service' ),
  $service_status        = params_lookup( 'service_status' ),
  $process               = params_lookup( 'process' ),
  $process_args          = params_lookup( 'process_args' ),
  $process_user          = params_lookup( 'process_user' ),
  $config_dir            = params_lookup( 'config_dir' ),
  $config_file           = params_lookup( 'config_file' ),
  $config_file_mode      = params_lookup( 'config_file_mode' ),
  $config_file_owner     = params_lookup( 'config_file_owner' ),
  $config_file_group     = params_lookup( 'config_file_group' ),
  $config_file_init      = params_lookup( 'config_file_init' ),
  $pid_file              = params_lookup( 'pid_file' ),
  $data_dir              = params_lookup( 'data_dir' ),
  $log_dir               = params_lookup( 'log_dir' ),
  $log_file              = params_lookup( 'log_file' ),
  $port                  = params_lookup( 'port' ),
  $protocol              = params_lookup( 'protocol' )
  ) inherits zookeeper::params {

  $bool_pre_install_java=any2bool($pre_install_java)
  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)
  $bool_noops=any2bool($noops)

  ### Definition of some variables used in the module
  $manage_package = $zookeeper::bool_absent ? {
    true  => 'absent',
    false => $zookeeper::version,
  }

  $manage_service_enable = $zookeeper::bool_disableboot ? {
    true    => false,
    default => $zookeeper::bool_disable ? {
      true    => false,
      default => $zookeeper::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $zookeeper::bool_disable ? {
    true    => 'stopped',
    default =>  $zookeeper::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $zookeeper::bool_service_autorestart ? {
    true    => Service[zookeeper],
    false   => undef,
  }

  $manage_file = $zookeeper::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $zookeeper::bool_absent == true
  or $zookeeper::bool_disable == true
  or $zookeeper::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $zookeeper::bool_absent == true
  or $zookeeper::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $zookeeper::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $zookeeper::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $zookeeper::source ? {
    ''        => undef,
    default   => $zookeeper::source,
  }

  $manage_file_content = $zookeeper::template ? {
    ''        => undef,
    default   => template($zookeeper::template),
  }

  $manage_env_file_source = $zookeeper::source_env_file ? {
    ''        => undef,
    default   => $zookeeper::source_env_file,
  }

  $manage_env_file_content = $zookeeper::template_env_file ? {
    ''        => undef,
    default   => template($zookeeper::template_env_file),
  }

  $manage_log_file_source = $zookeeper::source_log_file ? {
    ''        => undef,
    default   => $zookeeper::source_log_file,
  }

  $manage_log_file_content = $zookeeper::template_log_file ? {
    ''        => undef,
    default   => template($zookeeper::template_log_file),
  }

  $manage_myid_file_source = $zookeeper::source_myid_file ? {
    ''        => undef,
    default   => $zookeeper::source_myid_file,
  }

  $manage_myid_file_content = $zookeeper::template_myid_file ? {
    ''        => undef,
    default   => template($zookeeper::template_myid_file),
  }

  ### Managed resources
  if $zookeeper::bool_pre_install_java {
    include java
  }

  package { $zookeeper::package:
    ensure  => $zookeeper::manage_package,
    noop    => $zookeeper::bool_noops,
  }

  service { 'zookeeper':
    ensure     => $zookeeper::manage_service_ensure,
    name       => $zookeeper::service,
    enable     => $zookeeper::manage_service_enable,
    hasstatus  => $zookeeper::service_status,
    pattern    => $zookeeper::process,
    require    => Package[$zookeeper::package],
    noop       => $zookeeper::bool_noops,
  }

  file { 'zookeeper.conf':
    ensure  => $zookeeper::manage_file,
    path    => $zookeeper::config_file,
    mode    => $zookeeper::config_file_mode,
    owner   => $zookeeper::config_file_owner,
    group   => $zookeeper::config_file_group,
    require => Package[$zookeeper::package],
    notify  => $zookeeper::manage_service_autorestart,
    source  => $zookeeper::manage_file_source,
    content => $zookeeper::manage_file_content,
    replace => $zookeeper::manage_file_replace,
    audit   => $zookeeper::manage_audit,
    noop    => $zookeeper::bool_noops,
  }

  file { 'zookeeper.env':
    ensure  => $zookeeper::manage_file,
    path    => $zookeeper::config_env_file,
    mode    => $zookeeper::config_file_mode,
    owner   => $zookeeper::config_file_owner,
    group   => $zookeeper::config_file_group,
    require => Package[$zookeeper::package],
    notify  => $zookeeper::manage_service_autorestart,
    source  => $zookeeper::manage_env_file_source,
    content => $zookeeper::manage_env_file_content,
    replace => $zookeeper::manage_file_replace,
    audit   => $zookeeper::manage_audit,
    noop    => $zookeeper::bool_noops,
  }

  file { 'zookeeper.log4j':
    ensure  => $zookeeper::manage_file,
    path    => $zookeeper::config_log_file,
    mode    => $zookeeper::config_file_mode,
    owner   => $zookeeper::config_file_owner,
    group   => $zookeeper::config_file_group,
    require => Package[$zookeeper::package],
    notify  => $zookeeper::manage_service_autorestart,
    source  => $zookeeper::manage_log_file_source,
    content => $zookeeper::manage_log_file_content,
    replace => $zookeeper::manage_file_replace,
    audit   => $zookeeper::manage_audit,
    noop    => $zookeeper::bool_noops,
  }

  if $zookeeper::myid {
    file { 'zookeeper.id':
      ensure  => $zookeeper::manage_file,
      path    => $zookeeper::config_myid_file,
      mode    => $zookeeper::config_file_mode,
      owner   => $zookeeper::config_file_owner,
      group   => $zookeeper::config_file_group,
      require => Package[$zookeeper::package],
      notify  => $zookeeper::manage_service_autorestart,
      source  => $zookeeper::manage_myid_file_source,
      content => $zookeeper::manage_myid_file_content,
      replace => $zookeeper::manage_file_replace,
      audit   => $zookeeper::manage_audit,
      noop    => $zookeeper::bool_noops,
    }
  }

  # The whole zookeeper configuration directory can be recursively overriden
  if $zookeeper::source_dir {
    file { 'zookeeper.dir':
      ensure  => directory,
      path    => $zookeeper::config_dir,
      require => Package[$zookeeper::package],
      notify  => $zookeeper::manage_service_autorestart,
      source  => $zookeeper::source_dir,
      recurse => true,
      purge   => $zookeeper::bool_source_dir_purge,
      force   => $zookeeper::bool_source_dir_purge,
      replace => $zookeeper::manage_file_replace,
      audit   => $zookeeper::manage_audit,
      noop    => $zookeeper::bool_noops,
    }
  }

  ### Include custom class if $my_class is set
  if $zookeeper::my_class {
    include $zookeeper::my_class
  }

  ### Provide puppi data, if enabled ( puppi => true )
  if $zookeeper::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'zookeeper':
      ensure    => $zookeeper::manage_file,
      variables => $classvars,
      helper    => $zookeeper::puppi_helper,
      noop      => $zookeeper::bool_noops,
    }
  }

  ### Service monitoring, if enabled ( monitor => true )
  if $zookeeper::bool_monitor == true {
    if $zookeeper::port != '' {
      monitor::port { "zookeeper_${zookeeper::protocol}_${zookeeper::port}":
        protocol => $zookeeper::protocol,
        port     => $zookeeper::port,
        target   => $zookeeper::monitor_target,
        tool     => $zookeeper::monitor_tool,
        enable   => $zookeeper::manage_monitor,
        noop     => $zookeeper::bool_noops,
      }
    }
    if $zookeeper::service != '' {
      monitor::process { 'zookeeper_process':
        process  => $zookeeper::process,
        service  => $zookeeper::service,
        pidfile  => $zookeeper::pid_file,
        user     => $zookeeper::process_user,
        argument => $zookeeper::process_args,
        tool     => $zookeeper::monitor_tool,
        enable   => $zookeeper::manage_monitor,
        noop     => $zookeeper::bool_noops,
      }
    }
  }

  ### Firewall management, if enabled ( firewall => true )
  if $zookeeper::bool_firewall == true and $zookeeper::port != '' {
    firewall { "zookeeper_${zookeeper::protocol}_${zookeeper::port}":
      source      => $zookeeper::firewall_src,
      destination => $zookeeper::firewall_dst,
      protocol    => $zookeeper::protocol,
      port        => $zookeeper::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $zookeeper::firewall_tool,
      enable      => $zookeeper::manage_firewall,
      noop        => $zookeeper::bool_noops,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $zookeeper::bool_debug == true {
    file { 'debug_zookeeper':
      ensure  => $zookeeper::manage_file,
      path    => "${settings::vardir}/debug-zookeeper",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
      noop    => $zookeeper::bool_noops,
    }
  }

}
