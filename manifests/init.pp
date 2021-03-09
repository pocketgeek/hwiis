# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include hwiis
class hwiis {

  windowsfeature { 'Web-WebServer':
    ensure                 => present,
    installmanagementtools => true,
  }

  windowsfeature { 'Web-Scripting-Tools':
    ensure                 => present,
    installmanagementtools => true,
  }
}
