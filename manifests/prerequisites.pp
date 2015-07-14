# Class: zookeeper::prerequisites
#
# This class installs zookeeper prerequisites
#
# == Variables
#
# Refer to zookeeper class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It's automatically included by zookeeper if the parameter
# install_prerequisites is set to true
# Note: This class may contain resources available on the
# Example42 modules set
#
class zookeeper::prerequisites {

  if $zookeeper::bool_pre_install_java == true {
    include java
  }
}
