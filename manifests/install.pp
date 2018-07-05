# @api private
#
# This class is called from the main duo class for installing the application.
#
class duo::install {
  assert_private('duo::install is a private class')

  package { $::duo::package_name:
    ensure => $::duo::package_ensure,
  }
}
