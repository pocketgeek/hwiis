# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include hwiis
class hwiis {

  $iis_features = ['Web-WebServer','Web-Scripting-Tools']

#  windowsfeature { 'Web-WebServer':
#    ensure                 => present,
#    installmanagementtools => true,
#    installsubfeatures => true,
#  }

  iis_feature { $iis_features:
    ensure => 'present',
  }

}
