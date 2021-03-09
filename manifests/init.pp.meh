# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include hwiis
class hwiis {

  $iis_features = ['Web-WebServer','Web-Scripting-Tools']
  
  package { 'ruby-pwsh':
    ensure   => 'installed',
    provider => 'gem',
  }

  iis_feature { $iis_features:
    ensure => 'present',
  }

  # Delete the default website to prevent a port binding conflict.
  iis_site {'Default Web Site':
    ensure  => absent,
    require => Iis_feature['Web-WebServer'],
  }


#  ->windowsfeature { 'Web-WebServer':
#    ensure                 => present,
#    installmanagementtools => true,
#  }

#  ->windowsfeature { 'Web-Scripting-Tools':
#    ensure                 => present,
#    installmanagementtools => true,
#  }

  ->file { 'c:\\hwsite':
    ensure => 'directory',
  }

  ->iis_site { 'hwsite':
    ensure          => 'started',
    physicalpath    => 'c:\\hwsite',
    applicationpool => 'hwsite',
  }

}
